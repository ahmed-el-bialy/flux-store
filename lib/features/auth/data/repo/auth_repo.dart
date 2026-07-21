import '../../../../core/helper/shared_prefs_helper.dart';
import '../models/login_response_model.dart';
import '../web_services/auth_api_service.dart';

class AuthRepo {
  final AuthApiService apiService;

  AuthRepo(this.apiService);

  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    final cleanEmail = email.trim().toLowerCase();

    // 1. Check local registered users (from signups on this device)
    final localUsers = SharedPrefsHelper.getLocalUsers();
    if (localUsers.containsKey(cleanEmail)) {
      final localUser = localUsers[cleanEmail];
      final savedPassword = localUser['password'];
      if (savedPassword == password) {
        final details = Map<String, dynamic>.from(localUser['details']);
        final mockToken = 'mock-jwt-token-$cleanEmail';
        details['token'] = mockToken;
        final user = LoginResponseModel.fromJson(details);

        // Save session
        await SharedPrefsHelper.saveToken(mockToken);
        await SharedPrefsHelper.saveUser(user);
        return user;
      } else {
        throw Exception('Incorrect password.');
      }
    }

    // 2. Query DummyJSON by email to map to their username
    final apiUsers = await apiService.searchUserByEmail(cleanEmail);
    if (apiUsers.isEmpty) {
      throw Exception('No user found with this email.');
    }

    // Find user by exact email match
    var matchingUserJson = apiUsers.firstWhere(
      (u) =>
          u['email'] != null &&
          u['email'].toString().toLowerCase() == cleanEmail,
      orElse: () => null,
    );

    if (matchingUserJson == null) {
      throw Exception('No user found with this email.');
    }

    final String username = matchingUserJson['username'];

    // 3. Login to DummyJSON
    final loggedInUser = await apiService.login(
      username: username,
      password: password,
    );

    // Save session
    await SharedPrefsHelper.saveToken(loggedInUser.token);
    await SharedPrefsHelper.saveUser(loggedInUser);

    return loggedInUser;
  }

  Future<LoginResponseModel> register({
    required String email,
    required String password,
  }) async {
    final cleanEmail = email.trim().toLowerCase();
    final localUsers = SharedPrefsHelper.getLocalUsers();
    if (localUsers.containsKey(cleanEmail)) {
      throw Exception('This email is already registered.');
    }

    final String username = cleanEmail.split('@')[0];
    const String firstName = 'New';
    const String lastName = 'User';

    // Call DummyJSON register simulator
    final responseData = await apiService.register(
      email: cleanEmail,
      password: password,
      username: username,
      firstName: firstName,
      lastName: lastName,
    );

    // Prepare profile fields with fallback values
    final userDetails = {
      'id': responseData['id'] ?? 999,
      'username': username,
      'email': cleanEmail,
      'firstName': firstName,
      'lastName': lastName,
      'gender': 'unknown',
      'image': 'https://dummyjson.com/icon/$username/128',
    };

    // Save registered user locally
    await SharedPrefsHelper.saveLocalUser(cleanEmail, password, userDetails);

    // Automatically log in the user after registering
    final mockToken = 'mock-jwt-token-$cleanEmail';
    userDetails['token'] = mockToken;
    final loggedInUser = LoginResponseModel.fromJson(userDetails);

    await SharedPrefsHelper.saveToken(mockToken);
    await SharedPrefsHelper.saveUser(loggedInUser);

    return loggedInUser;
  }

  LoginResponseModel? getSavedUser() {
    return SharedPrefsHelper.getUser();
  }

  Future<void> logout() async {
    await SharedPrefsHelper.clearSession();
  }
}

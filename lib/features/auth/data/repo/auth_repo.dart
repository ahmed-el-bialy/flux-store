import '../../../../core/helper/shared_prefs_helper.dart';
import '../models/login_response_model.dart';
import '../models/social_provider.dart';
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
    final httpResponse = await apiService.searchUserByEmail(email: cleanEmail);
    final responseData = httpResponse.data as Map<String, dynamic>;
    final List<dynamic> apiUsers = responseData['users'] ?? [];

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
    final httpResponse = await apiService.register(
      email: cleanEmail,
      password: password,
      username: username,
      firstName: firstName,
      lastName: lastName,
    );

    final responseData = httpResponse.data as Map<String, dynamic>;

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

  Future<LoginResponseModel> socialLogin({
    required SocialProvider provider,
  }) async {
    final providerKey = provider.name;

    final savedSocialUser = SharedPrefsHelper.getSocialUser(providerKey);
    if (savedSocialUser != null) {
      await SharedPrefsHelper.saveToken(savedSocialUser.token);
      await SharedPrefsHelper.saveUser(savedSocialUser);
      return savedSocialUser;
    }

    final profile = _demoProfileFor(provider);
    final token = 'social-${provider.name}-token';
    profile['token'] = token;

    final user = LoginResponseModel.fromJson(profile);

    await SharedPrefsHelper.saveSocialUser(providerKey, user);
    await SharedPrefsHelper.saveToken(token);
    await SharedPrefsHelper.saveUser(user);

    return user;
  }

  Map<String, dynamic> _demoProfileFor(SocialProvider provider) {
    return switch (provider) {
      SocialProvider.google => {
        'id': 1001,
        'username': 'google_user',
        'email': 'google.user@gmail.com',
        'firstName': 'Google',
        'lastName': 'User',
        'gender': 'unknown',
        'image': 'https://dummyjson.com/icon/google_user/128',
      },
      SocialProvider.facebook => {
        'id': 1002,
        'username': 'facebook_user',
        'email': 'facebook.user@gmail.com',
        'firstName': 'Facebook',
        'lastName': 'User',
        'gender': 'unknown',
        'image': 'https://dummyjson.com/icon/facebook_user/128',
      },
      SocialProvider.apple => {
        'id': 1003,
        'username': 'apple_user',
        'email': 'apple.user@icloud.com',
        'firstName': 'Apple',
        'lastName': 'User',
        'gender': 'unknown',
        'image': 'https://dummyjson.com/icon/apple_user/128',
      },
    };
  }

  LoginResponseModel? getSavedUser() {
    return SharedPrefsHelper.getUser();
  }

  Future<void> logout() async {
    await SharedPrefsHelper.clearSession();
  }
}

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/models/login_response_model.dart';

class SharedPrefsHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String _keyToken = 'auth_token';
  static const String _keyUser = 'auth_user';
  static const String _keyLocalUsers = 'local_users';

  static Future<void> saveToken(String token) async {
    await _sharedPreferences?.setString(_keyToken, token);
  }

  static String? getToken() {
    return _sharedPreferences?.getString(_keyToken);
  }

  static Future<void> saveUser(LoginResponseModel user) async {
    await _sharedPreferences?.setString(_keyUser, jsonEncode(user.toJson()));
  }

  static LoginResponseModel? getUser() {
    final userJson = _sharedPreferences?.getString(_keyUser);
    if (userJson == null) return null;
    try {
      return LoginResponseModel.fromJson(jsonDecode(userJson));
    } catch (_) {
      return null;
    }
  }

  static bool isLoggedIn() {
    return getToken() != null && getUser() != null;
  }

  static Future<void> clearSession() async {
    await _sharedPreferences?.remove(_keyToken);
    await _sharedPreferences?.remove(_keyUser);
  }

  static Future<void> saveLocalUser(
    String email,
    String password,
    Map<String, dynamic> userDetails,
  ) async {
    final localUsers = getLocalUsers();
    localUsers[email] = {'password': password, 'details': userDetails};
    await _sharedPreferences?.setString(_keyLocalUsers, jsonEncode(localUsers));
  }

  static Map<String, dynamic> getLocalUsers() {
    final jsonStr = _sharedPreferences?.getString(_keyLocalUsers);
    if (jsonStr == null) return {};
    try {
      return jsonDecode(jsonStr) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }
}

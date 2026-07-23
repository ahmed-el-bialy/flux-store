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
  static const String _keySocialUsers = 'social_users';
  static const String _keyWishlist = 'user_wishlist';
  static const String _keyCart = 'user_cart';

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

  static Future<void> saveSocialUser(
    String providerKey,
    LoginResponseModel user,
  ) async {
    final socialUsers = getSocialUsers();
    socialUsers[providerKey] = user.toJson();
    await _sharedPreferences?.setString(
      _keySocialUsers,
      jsonEncode(socialUsers),
    );
  }

  static LoginResponseModel? getSocialUser(String providerKey) {
    final socialUsers = getSocialUsers();
    final userJson = socialUsers[providerKey];
    if (userJson == null) return null;
    try {
      return LoginResponseModel.fromJson(
        Map<String, dynamic>.from(userJson as Map),
      );
    } catch (_) {
      return null;
    }
  }

  static Map<String, dynamic> getSocialUsers() {
    final jsonStr = _sharedPreferences?.getString(_keySocialUsers);
    if (jsonStr == null) return {};
    try {
      return jsonDecode(jsonStr) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }

  // ─── Wishlist & Cart Storage ──────────────────────────────────────

  static Future<void> saveWishlist(List<Map<String, dynamic>> wishlistJson) async {
    await _sharedPreferences?.setString(_keyWishlist, jsonEncode(wishlistJson));
  }

  static List<Map<String, dynamic>> getWishlist() {
    final str = _sharedPreferences?.getString(_keyWishlist);
    if (str == null) return [];
    try {
      final List<dynamic> decoded = jsonDecode(str);
      return decoded.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveCart(List<Map<String, dynamic>> cartJson) async {
    await _sharedPreferences?.setString(_keyCart, jsonEncode(cartJson));
  }

  static List<Map<String, dynamic>> getCart() {
    final str = _sharedPreferences?.getString(_keyCart);
    if (str == null) return [];
    try {
      final List<dynamic> decoded = jsonDecode(str);
      return decoded.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    } catch (_) {
      return [];
    }
  }
}

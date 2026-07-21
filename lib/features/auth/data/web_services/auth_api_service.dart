import 'package:dio/dio.dart';

import '../models/login_response_model.dart';

class AuthApiService {
  final Dio dio;

  AuthApiService(this.dio);

  Future<LoginResponseModel> login({
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      'https://dummyjson.com/auth/login',
      data: {'username': username, 'password': password, 'expiresInMins': 60},
    );
    return LoginResponseModel.fromJson(response.data);
  }

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
  }) async {
    final response = await dio.post(
      'https://dummyjson.com/users/add',
      data: {
        'email': email,
        'password': password,
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
      },
    );
    return response.data;
  }

  Future<List<dynamic>> searchUserByEmail(String email) async {
    final response = await dio.get(
      'https://dummyjson.com/users/search',
      queryParameters: {'q': email},
    );
    return response.data['users'] ?? [];
  }

  Future<LoginResponseModel> getProfile(String token) async {
    final response = await dio.get(
      'https://dummyjson.com/auth/me',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return LoginResponseModel.fromJson(response.data);
  }
}

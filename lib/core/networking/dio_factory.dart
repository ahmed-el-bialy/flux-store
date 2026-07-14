import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class DioFactory {
  static Dio getDio() {
    final headers = {'accept': 'application/json'};

    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: headers,
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: false,
      ),
    );

    return dio;
  }
}

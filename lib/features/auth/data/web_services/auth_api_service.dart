import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/login_response_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com/')
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  @POST('auth/login')
  Future<LoginResponseModel> login({
    @Field('username') required String username,
    @Field('password') required String password,
    @Field('expiresInMins') int expiresInMins = 60,
  });

  @POST('users/add')
  Future<HttpResponse<dynamic>> register({
    @Field('email') required String email,
    @Field('password') required String password,
    @Field('username') required String username,
    @Field('firstName') required String firstName,
    @Field('lastName') required String lastName,
  });

  @GET('users/search')
  Future<HttpResponse<dynamic>> searchUserByEmail({
    @Query('q') required String email,
  });

  @GET('auth/me')
  Future<LoginResponseModel> getProfile({
    @Header('Authorization') required String token,
  });
}
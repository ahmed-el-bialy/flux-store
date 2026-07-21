part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginResponseModel user;
  AuthSuccess(this.user);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class Unauthenticated extends AuthState {}

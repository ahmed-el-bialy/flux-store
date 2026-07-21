import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/login_response_model.dart';
import '../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  void checkSession() {
    final user = authRepo.getSavedUser();
    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.login(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.register(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authRepo.logout();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
  }
}

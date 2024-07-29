import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';
import 'auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthState.initial());

  Future<void> register(String email, String password) async {
    try {
      User? user = await _authService.registerWithEmailAndPassword(email, password);
      emit(AuthState(user: user));
    } catch (e) {
      emit(AuthState(error: e.toString()));
    }
  }

  Future<void> logIn(String email, String password) async {
    try {
      User? user = await _authService.logInWithEmailAndPassword(email, password);
      emit(AuthState(user: user));
    } catch (e) {
      emit(AuthState(error: e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      emit(AuthState(user: null));
    } catch (e) {
      emit(AuthState(error: e.toString()));
    }
  }
}
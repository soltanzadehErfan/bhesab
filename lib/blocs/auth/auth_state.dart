import 'package:firebase_auth/firebase_auth.dart';

class AuthState {
  final User? user;
  final String? error;

  AuthState({this.user, this.error});

  factory AuthState.initial() => AuthState(user: null, error: null);
}
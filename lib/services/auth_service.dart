import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  AuthService() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(User? user) async {
    _user = user;
    notifyListeners();
  }

  Future<void> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw _handleRegisterAuthException(e);
    } catch (e) {
      debugPrint('Registration Error: $e');
      throw Exception('An unexpected error occurred.');
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw _handleSignInAuthException(e);
    } catch (e) {
      debugPrint('Sign-In Error: $e');
      throw Exception('An unexpected error occurred.');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Private method to handle FirebaseAuthException for registration
  Exception _handleRegisterAuthException(FirebaseAuthException e) {
    String errorMessage;
    switch (e.code) {
      case 'email-already-in-use':
        errorMessage = 'An account already exists with this email address.';
        break;
      case 'invalid-email':
        errorMessage = 'The email address is not valid.';
        break;
      case 'operation-not-allowed':
        errorMessage = 'Email/password accounts are not enabled.';
        break;
      case 'weak-password':
        errorMessage =
            'The password is too weak. Please use a stronger password.';
        break;
      default:
        errorMessage = 'An unexpected error occurred. Please try again.';
        break;
    }
    return Exception(errorMessage);
  }

  // Private method to handle FirebaseAuthException for sign-in
  Exception _handleSignInAuthException(FirebaseAuthException e) {
    debugger();
    String errorMessage;
    switch (e.code) {
      case 'invalid-email':
        errorMessage = 'The email address is not valid.';
        break;
      case 'user-disabled':
        errorMessage =
            'The user corresponding to the given email has been disabled.';
        break;
      case 'user-not-found':
        errorMessage = 'There is no user corresponding to the given email.';
        break;
      case 'wrong-password':
        errorMessage =
            'The password is invalid for the given email, or the account does not have a password set.';
        break;
      default:
        errorMessage = 'An unexpected error occurred. Please try again.';
        break;
    }
    return Exception(errorMessage);
  }
}

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

  Future<void> registerUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
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

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handlePasswordResetEmailException(e);
    } catch (e) {
      debugPrint('Password Reset Error: $e');
      throw Exception('An unexpected error occurred.');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Private method to handle FirebaseAuthException for registration
  Exception _handleRegisterAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return Exception('An account already exists with this email address.');
      case 'invalid-email':
        return Exception('The email address is not valid.');
      case 'operation-not-allowed':
        return Exception('Email/password accounts are not enabled.');
      case 'weak-password':
        return Exception('The password is too weak. Please use a stronger password.');
      default:
        return Exception('An unexpected error occurred. Please try again.');
    }
  }

  // Private method to handle FirebaseAuthException for sign-in
  Exception _handleSignInAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return Exception('The email address is not valid.');
      case 'user-disabled':
        return Exception('The user corresponding to the given email has been disabled.');
      case 'user-not-found':
        return Exception('There is no user corresponding to the given email.');
      case 'wrong-password':
        return Exception('The password is invalid for the given email, or the account does not have a password set.');
      default:
        return Exception('An unexpected error occurred. Please try again.');
    }
  }

  // Private method to handle FirebaseAuthException for password reset
  Exception _handlePasswordResetEmailException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return Exception('The email address is not valid.');
      case 'missing-android-pkg-name':
        return Exception('An Android package name must be provided if the Android app is required to be installed.');
      case 'missing-continue-uri':
        return Exception('A continue URL must be provided in the request.');
      case 'missing-ios-bundle-id':
        return Exception('An iOS Bundle ID must be provided if an App Store ID is provided.');
      case 'invalid-continue-uri':
        return Exception('The continue URL provided in the request is invalid.');
      case 'unauthorized-continue-uri':
        return Exception('The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.');
      case 'user-not-found':
        return Exception('There is no user corresponding to the email address.');
      default:
        return Exception('An unexpected error occurred. Please try again.');
    }
  }
}

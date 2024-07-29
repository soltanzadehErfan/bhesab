
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Auth in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Sign In'),
              onPressed: () async {
                User? user = await _auth.signInWithEmailAndPassword(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
                if (user != null) {
                  debugPrint('Signed in: ${user.email}');
                } else {
                  debugPrint('Sign in failed');
                }
              },
            ),
            ElevatedButton(
              child: const Text('Register'),
              onPressed: () async {
                User? user = await _auth.registerWithEmailAndPassword(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
                if (user != null) {
                  debugPrint('Registered: ${user.email}');
                } else {
                  debugPrint('Registration failed');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
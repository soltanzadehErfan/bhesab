import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/resetPassword');
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStateColor.transparent,
              ),
              child: const Text(
                'Forgot password',
                style: TextStyle(color: Colors.purple),
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.deepPurple,
                ),
              ),
              onPressed: () async {
                try {
                  await authService.signInWithEmailAndPassword(
                    _emailController.text,
                    _passwordController.text,
                  );
                  GoRouter.of(context).go('/home');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login_rounded),
                  SizedBox(width: 16.0),
                  Text('Sign in'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/register');
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStateColor.transparent,
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_cubit.dart';
import '../blocs/auth/auth_state.dart';
import '../blocs/auth/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthService()),
      child: Scaffold(
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
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.user != null) {
                    debugPrint('User: ${state.user!.email}');
                  } else if (state.error != null) {
                    debugPrint('Error: ${state.error}');
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      ElevatedButton(
                        child: const Text('Sign In'),
                        onPressed: () {
                          context.read<AuthCubit>().logIn(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Register'),
                        onPressed: () {
                          context.read<AuthCubit>().register(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
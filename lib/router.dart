import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bhesab/ui/home/home_screen.dart';
import 'package:bhesab/ui/auth/register_screen.dart';
import 'package:bhesab/ui/auth/login_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => MaterialPage(child: RegisterScreen()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
    ),
  ],
);
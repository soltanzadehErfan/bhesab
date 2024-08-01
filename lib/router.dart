import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ui/home/home_screen.dart';
import 'ui/auth/signup_screen.dart';
import 'ui/auth/signin_screen.dart';
import 'ui/landing/landing_screen.dart';
import 'ui/auth/forgot_password_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          const MaterialPage(child: LandingScreen()),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => MaterialPage(child: RegisterScreen()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
    ),
    GoRoute(
      path: '/resetPassword',
      pageBuilder: (context, state) => MaterialPage(child: ResetPassword()),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
  ],
);

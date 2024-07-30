import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../services/theme_service.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bhesab',
        ),
        leading: IconButton(
          onPressed: () {
            themeService.toggleTheme();
          },
          icon: Icon(Provider.of<ThemeNotifier>(context).themeIcon),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_chart_rounded,
              size: 128.0,
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              'Bhesab helps you to track expenses, manage income, create invoices, generate financial reports, set budgets, and ensure data security.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32.0,
            ),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.deepPurple,
                ),
              ),
              onPressed: () {
                GoRouter.of(context).go('/login');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_rounded,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'Continue with email',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

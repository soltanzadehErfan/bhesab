import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bhesab'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bhesab helps you to track expenses, manage income, create invoices, generate financial reports, set budgets, and ensure data security.',
              style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 64,
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/login');
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.black12,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_rounded,
                    color: Colors.purple,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Continue with email',
                    style: TextStyle(
                      color: Colors.black,
                    ),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bhesab/services/auth_service.dart';
import 'package:bhesab/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark(),
        routerConfig: router,
        // routerDelegate: router.routerDelegate,
        // routeInformationParser: router.routeInformationParser,
        title: 'Bhesab App',
      ),
    );
  }
}

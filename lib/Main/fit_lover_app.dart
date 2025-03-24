import 'package:fitlover_mvps/Main/main_app.dart';
import 'package:fitlover_mvps/screens/login/create_account_page.dart';
import 'package:fitlover_mvps/screens/login/login_page.dart';
import 'package:fitlover_mvps/screens/Pages/splash_page.dart';
import 'package:flutter/material.dart';

class FitLoverApp extends StatelessWidget {
  const FitLoverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 48, 87),
      ),
      initialRoute: '/', // Initial route for app launch
      routes: {
        '/': (context) => const SplashScreen(), // Initial splash screen
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MainApp(), // Home page after login
      },
    );
  }
}

import 'package:fitlover_mvps/Screens/Login_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'Screens/Login_pages/create_account_page.dart';
import 'package:fitlover_mvps/Screens/Pages/splash_page.dart';
import 'package:fitlover_mvps/main_app.dart';

void main() {
  runApp(const FitLoverApp());
}

class FitLoverApp extends StatelessWidget {
  const FitLoverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF102E69),
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
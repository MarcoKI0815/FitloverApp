import 'package:fitlover_mvps/Screens/Login_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'Screens/Login_pages/create_account_page.dart';
import 'package:fitlover_mvps/Screens/Pages/splash_page.dart';
import 'package:fitlover_mvps/main_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Stellt sicher, dass Firebase korrekt initialisiert wird
  await Firebase.initializeApp();
  runApp(const FitLoverApp());
}

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitLover',
      theme: ThemeData.dark(),
      home: const SignUpScreen(),
    );
  }
}

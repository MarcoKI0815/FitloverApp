import 'package:fitlover_mvps/data/app_theme.dart';
import 'package:fitlover_mvps/screen/login/create_account_page.dart';
import 'package:fitlover_mvps/screen/login/login_page.dart';
import 'package:fitlover_mvps/screen/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main/main_app.dart';
import 'data/firestoreDatabaseRepository.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Entscheide, ob Mock- oder Firebase-Datenbank verwendet wird
  final FirestoreDatabaseRepository database =
      FirestoreDatabaseRepository(); // Replace with actual implementation
  bool useMock = false; // Setze auf false, um Firebase zu nutzen

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: fitLoverTheme,
      initialRoute: '/', // Startpunkt der App
      routes: {
        '/': (context) => const SplashScreen(), // Splash Screen
        '/signup': (context) => const SignUpScreen(), // Registrierungsseite
        '/login': (context) => const LoginPage(), // Login-Seite
        '/home': (context) => const MainApp(), // Hauptseite nach Login
      },
    );
  }
}

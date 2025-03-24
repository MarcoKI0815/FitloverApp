import 'package:fitlover_mvps/data/mockDatabase.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login/login_page.dart';
import 'screens/login/create_account_page.dart';
import 'screens/Pages/splash_page.dart';
import 'Main/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Entscheide, ob Mock- oder Firebase-Datenbank verwendet wird
  final MockDatabaseRepository database =
      MockDatabaseRepository(); // Replace with actual implementation
  bool useMock = true; // Setze auf false, um Firebase zu nutzen

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 10, 20, 46),
      ),
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

<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login/login_page.dart';
import 'screens/login/create_account_page.dart';
import 'screens/splash_page.dart';
import 'main_app.dart';
=======
import 'package:fitlover_mvps/domain/workout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitlover_mvps/Data/database_repository.dart';
import 'package:fitlover_mvps/Data/mockDatabase.dart';
import 'package:fitlover_mvps/Widgets/my_app.dart'; 


>>>>>>> origin/main

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Entscheide, ob Mock- oder Firebase-Datenbank verwendet wird
  final DatabaseRepository database;
  bool useMock = true; // Setze auf false, um Firebase zu nutzen

<<<<<<< HEAD
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
=======
  database = MockDatabaseRepository(); 
database.addWorkout(Workout("Bankdrücken", "assets/Bank.jpeg",
        "Eine der besten Übungen für die Brustmuskulatur."));
    

  // Starte die App und übergebe den `database`-Parameter
  runApp(MyApp(database: database)); // Übergabe des Parameters
}
>>>>>>> origin/main

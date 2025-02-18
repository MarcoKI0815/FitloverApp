import 'package:fitlover_mvps/domain/workout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitlover_mvps/Data/database_repository.dart';
import 'package:fitlover_mvps/Data/mockDatabase.dart';
import 'package:fitlover_mvps/Widgets/my_app.dart'; 



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Entscheide, ob Mock- oder Firebase-Datenbank verwendet wird
  final DatabaseRepository database;
  bool useMock = true; // Setze auf false, um Firebase zu nutzen

  database = MockDatabaseRepository(); 
database.addWorkout(Workout("Bankdrücken", "assets/Bank.jpeg",
        "Eine der besten Übungen für die Brustmuskulatur."));
    

  // Starte die App und übergebe den `database`-Parameter
  runApp(MyApp(database: database)); // Übergabe des Parameters
}
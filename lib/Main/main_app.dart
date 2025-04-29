import 'package:fitlover_mvps/screen/home_page.dart';
import 'package:fitlover_mvps/screen/login/create_account_page.dart';
import 'package:fitlover_mvps/screen/pages/exercise_page.dart';
import 'package:fitlover_mvps/screen/pages/settings_page.dart';
import 'package:fitlover_mvps/screen/pages/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:fitlover_mvps/buttons/bottom_navigation.dart';


class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  int selectedIndex = 0;
  List<Map<String, String>> favoriteExercises = []; // Liste für Favoriten
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const HomePage(),
      ExercisesPage(
        onFavoriteToggle: updateFavorites,
        onAddCustomExercise:
            addCustomExercise, // Hinzufügen von eigenen Übungen
      ),
      WorkoutPage(
        favoriteExercises: favoriteExercises,
        onWorkoutComplete: () {},
      ), // Übergabe der Favoriten
      const SettingsPage(),
    ];
  }

  // Favoriten aktualisieren
  void updateFavorites(Map<String, String> exercise) {
    setState(() {
      if (favoriteExercises.any((e) => e["name"] == exercise["name"])) {
        favoriteExercises.removeWhere((e) => e["name"] == exercise["name"]);
      } else {
        favoriteExercises.add(exercise);
      }
    });
  }

  // Eigene Übung hinzufügen
  void addCustomExercise(Map<String, String> exercise) {
    setState(() {
      favoriteExercises.add(
          exercise); // Benutzerdefinierte Übung zu den Favoriten hinzufügen
    });
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigation(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
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

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fitlover_mvps/Screens/Pages/workout_page.dart';

class RandomWorkoutButton extends StatelessWidget {
  const RandomWorkoutButton({super.key});

  List<Map<String, String>> generateRandomWorkout(String focus, String level) {
    Map<String, List<Map<String, String>>> categorizedExercises = {
      "Oberkörper": [
        {
          "name": "Push-Ups",
          "image": "assets/pushups.png",
          "description": "Klassische Liegestütze"
        },
        {
          "name": "Bizeps Curls",
          "image": "assets/biceps.png",
          "description": "Bizeps-Training mit Hanteln"
        },
      ],
      "Beine": [
        {
          "name": "Squats",
          "image": "assets/squats.png",
          "description": "Kniebeugen für die Beine"
        },
        {
          "name": "Lunges",
          "image": "assets/lunges.png",
          "description": "Ausfallschritte für starke Beine"
        },
      ],
      "Ganzkörper": [
        {
          "name": "Plank",
          "image": "assets/plank.png",
          "description": "Core-Stärkung durch Plank"
        },
      ]
    };

    List<Map<String, String>> selectedExercises =
        categorizedExercises[focus] ?? categorizedExercises["Ganzkörper"]!;
    selectedExercises.shuffle(Random());
    return selectedExercises.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            String selectedFocus = "Ganzkörper";
            String selectedLevel = "Anfänger";
            return AlertDialog(
              title: const Text("Workout Einstellungen"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: selectedFocus,
                    items: ["Oberkörper", "Beine", "Ganzkörper"]
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      selectedFocus = newValue!;
                    },
                  ),
                  DropdownButton<String>(
                    value: selectedLevel,
                    items: ["Anfänger", "Fortgeschritten", "Profi"]
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      selectedLevel = newValue!;
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkoutPage(
                          favoriteExercises: generateRandomWorkout(
                              selectedFocus, selectedLevel),
                          onWorkoutComplete: () {
                            Navigator.pop(context, true);
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text("Starten"),
                ),
              ],
            );
          },
        );
      },
      child: const Text("Zufälliges Workout starten"),
    );
  }
}

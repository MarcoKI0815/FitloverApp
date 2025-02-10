import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  final List<Map<String, String>> favoriteExercises;

  const WorkoutPage({super.key, required this.favoriteExercises});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteExercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(favoriteExercises[index]["image"]!),
            title: Text(favoriteExercises[index]["name"]!),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(favoriteExercises[index]["name"]!),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(favoriteExercises[index]["image"]!),
                      const SizedBox(height: 10),
                      Text(favoriteExercises[index]["description"] ?? "Keine Beschreibung verfügbar"),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Schließen"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
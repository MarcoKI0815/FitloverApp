import 'package:flutter/material.dart';

class ExercisesPage extends StatefulWidget {
  final Function(Map<String, String>) onFavoriteToggle;

  const ExercisesPage({super.key, required this.onFavoriteToggle});

  @override
  ExercisesPageState createState() => ExercisesPageState();
}

class ExercisesPageState extends State<ExercisesPage> {
  final List<Map<String, String>> exercises = [
    {"name": "Bankdrücken", "image": "assets/Bank.jpeg"},
    {"name": "Kniebeugen", "image": "assets/kmie.png"},
    {"name": "Kreuzheben", "image": "assets/Kreuz.jpeg"},
    {"name": "Schulterdrücken", "image": "assets/Schulter.jpeg"},
    {"name": "Bizeps Curls", "image": "assets/Bizeps.jpeg"},
    {"name": "Trizeps Dips", "image": "assets/dips.jpeg"},
    {"name": "Klimmzüge", "image": "assets/Klimm.jpeg"},
    {"name": "Beinpresse", "image": "assets/Bein.jpeg"}
  ];

  final Set<String> favoriteExercises = {};

  void toggleFavorite(Map<String, String> exercise) {
    setState(() {
      if (favoriteExercises.contains(exercise['name'])) {
        favoriteExercises.remove(exercise['name']);
      } else {
        favoriteExercises.add(exercise['name']!);
      }
    });
    widget.onFavoriteToggle(exercise);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context), // Zurück zur vorherigen Seite
        ),
      ),
      body: SingleChildScrollView( // Wrapper für Scrollbarkeit
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,  // Verhindert, dass die ListView den gesamten verfügbaren Raum einnimmt
              physics: NeverScrollableScrollPhysics(), // Deaktiviert das eigene Scrollen der ListView
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                final isFavorite = favoriteExercises.contains(exercise['name']);
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.blueGrey[800],
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    leading: Image.asset(
                      exercise["image"]!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      exercise["name"]!,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                      onPressed: () => toggleFavorite(exercise),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
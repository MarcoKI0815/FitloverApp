import 'package:flutter/material.dart';

class ExercisesPage extends StatefulWidget {
  final Function(Map<String, String>) onFavoriteToggle;
  final Function(Map<String, String>) onAddCustomExercise;

  const ExercisesPage({
    super.key,
    required this.onFavoriteToggle,
    required this.onAddCustomExercise,
  });

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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

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

  void addCustomExercise() {
    if (nameController.text.isNotEmpty && imageController.text.isNotEmpty) {
      setState(() {
        final customExercise = {
          'name': nameController.text,
          'image': imageController.text,
        };
        exercises.add(customExercise);
        widget.onAddCustomExercise(customExercise); // Hinzufügen der benutzerdefinierten Übung
      });
      nameController.clear();
      imageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Formular für eigene Übung hinzufügen
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Übung Name",
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: imageController,
                    decoration: const InputDecoration(
                      labelText: "Bild URL",
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: addCustomExercise,
                    child: const Text("Eigene Übung hinzufügen"),
                  ),
                ],
              ),
            ),
            // Liste der Übungen
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
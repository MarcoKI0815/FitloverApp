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
    {
      "name": "Bankdrücken",
      "image": "assets/Bank.jpeg",
      "description": "Eine der besten Übungen für die Brustmuskulatur."
    },
    {
      "name": "Kniebeugen",
      "image": "assets/kmie.png",
      "description":
          "Eine grundlegende Übung für starke Beine und den unteren Rücken."
    },
    {
      "name": "Kreuzheben",
      "image": "assets/Kreuz.jpeg",
      "description":
          "Eine Ganzkörperübung, die besonders den unteren Rücken stärkt."
    },
    {
      "name": "Schulterdrücken",
      "image": "assets/Schulter.jpeg",
      "description":
          "Stärkt die Schultermuskulatur und verbessert die Stabilität."
    },
    {
      "name": "Bizeps Curls",
      "image": "assets/Bizeps.jpeg",
      "description": "Isolierte Übung zur Stärkung des Bizeps."
    },
    {
      "name": "Trizeps Dips",
      "image": "assets/dips.jpeg",
      "description": "Hervorragende Übung zur Kräftigung des Trizeps."
    },
    {
      "name": "Klimmzüge",
      "image": "assets/Klimm.jpeg",
      "description": "Eine der besten Übungen für den Rücken und die Arme."
    },
    {
      "name": "Beinpresse",
      "image": "assets/Bein.jpeg",
      "description": "Kräftigt die Beine und schont den unteren Rücken."
    }
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
          'description': "Benutzerdefinierte Übung ohne Beschreibung."
        };
        exercises.add(customExercise);
        widget.onAddCustomExercise(customExercise);
      });
      nameController.clear();
      imageController.clear();
    }
  }

  void showExerciseDescription(Map<String, String> exercise) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(exercise['name']!),
          content:
              Text(exercise['description'] ?? "Keine Beschreibung verfügbar."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Schließen",
                style: TextStyle(color: Color.fromARGB(255, 71, 175, 235)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercises"),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                final isFavorite = favoriteExercises.contains(exercise['name']);
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Color.fromARGB(255, 71, 175, 235),
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
                    onTap: () => showExerciseDescription(exercise),
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

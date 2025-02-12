import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  final List<Map<String, String>> favoriteExercises;

  const WorkoutPage({super.key, required this.favoriteExercises, required Null Function() onWorkoutComplete});

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  late List<bool> completedExercises;

  @override
  void initState() {
    super.initState();
    completedExercises = List<bool>.filled(widget.favoriteExercises.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dein Workout")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.favoriteExercises.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(widget.favoriteExercises[index]["name"]!),
                  subtitle: Text("Beschreibung fehlt"), // Hier könnte eine Beschreibung hinzugefügt werden
                  secondary: Image.asset(widget.favoriteExercises[index]["image"]!),
                  value: completedExercises[index],
                  onChanged: (bool? value) {
                    setState(() {
                      completedExercises[index] = value!;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Workout abgeschlossen
                Navigator.pop(context);
              },
              child: const Text("Workout abschließen"),
            ),
          ),
        ],
      ),
    );
  }
}
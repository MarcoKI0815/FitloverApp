import 'package:flutter/material.dart';

class DifficultyButtons extends StatelessWidget {
  const DifficultyButtons({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> levels = ["Anfänger", "Pro", "Expert"];
    return Column(
      children: levels.map((level) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$level ausgewählt")),
                );
              },
              child: Text(level,
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        );
      }).toList(),
    );
  }
}

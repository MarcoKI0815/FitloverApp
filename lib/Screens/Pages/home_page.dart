import 'package:fitlover_mvps/Bottons/random_workout_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/5555.png', 
            fit: BoxFit.cover,
          ),
          Center(
            child: RandomWorkoutButton(),
          ),
        ],
      ),
    );
  }
}

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
            'assets/SplashScreenFitlover.png', 
            fit: BoxFit.cover,
          ),
          Column(
                mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                      Center(  
                        child: RandomWorkoutButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
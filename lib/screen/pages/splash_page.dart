import 'package:fitlover_mvps/screen/login/sign_up_with_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 48, 87),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/SplashScreenFitlover.png', // Hintergrundbild für den Splash-Screen
            fit: BoxFit.none,
          ),
        ],
      ),
    );
  }
}

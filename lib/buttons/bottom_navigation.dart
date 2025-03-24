// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.lightBlueAccent,
      unselectedItemColor: Colors.blueGrey,
      backgroundColor:
          const Color.fromARGB(255, 10, 20, 46), // Dunkelblauer Hintergrund
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt, color: Colors.white),
            label: "Exercises"),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center, color: Colors.white),
          label: "Workout",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white), label: "Settings"),
      ],
    );
  }
}

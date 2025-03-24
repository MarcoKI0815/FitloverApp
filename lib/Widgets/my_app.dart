import 'package:fitlover_mvps/screens/login/create_account_page.dart';
import 'package:flutter/material.dart';
import 'package:fitlover_mvps/Data/database_repository.dart';


class MyApp extends StatelessWidget {
  final DatabaseRepository database;

  // Konstruktor, um `database` als Parameter zu übergeben
  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitLover',
      theme: ThemeData.dark(),
      home:
          SignUpScreen(), // Setze hier dein Start-Widget, z.B. Login oder SignUp
    );
  }
}
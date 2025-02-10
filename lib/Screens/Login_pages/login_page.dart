import 'package:flutter/material.dart';

void main() {
  runApp(const FitLoverLogin());
}

class FitLoverLogin extends StatelessWidget {
  const FitLoverLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF102E69), // Dunkelblauer Hintergrund
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
      backgroundColor: const Color(0xFF102E69),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text("Welcome back!", style: TextStyle(fontSize: 28, color: Colors.white)),
            const SizedBox(height: 20),
            TextField(decoration: inputDecoration("Email")),
            const SizedBox(height: 16),
            TextField(obscureText: true, decoration: inputDecoration("Password")),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");  // 🔥 Nach Login zu Home wechseln
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
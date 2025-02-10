import 'package:flutter/material.dart';
import 'package:fitlover_mvps/Screens/Login_pages/login_page.dart';
import 'package:fitlover_mvps/Screens/Login_pages/create_account_page.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Navigator.canPop(context) ? BackButton() : null,
      ),
      backgroundColor: const Color(0xFF102E69),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(height: 24),
            buildSocialButton(
              icon: Icons.apple,
              text: "Continue with Apple",
              color: Colors.white,
              textColor: Colors.black,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            buildSocialButton(
              icon: Icons.facebook,
              text: "Login with Facebook",
              color: Colors.blue,
              textColor: Colors.white,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            buildSocialButton(
              icon: Icons.email,
              text: "Sign in with Google",
              color: Colors.white,
              textColor: Colors.black,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            buildSocialButton(
              icon: Icons.mail,
              text: "Sign up With Email",
              color: Colors.green,
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: const Text(
                "Create a account",
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSocialButton({
    required IconData icon,
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        icon: Icon(icon, color: textColor),
        label: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}

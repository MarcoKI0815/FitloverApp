import 'package:flutter/material.dart';
import 'package:fitlover_mvps/Screens/Login_pages/login_page.dart';
import 'package:fitlover_mvps/Screens/Login_pages/create_account_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // ✅ Apple Login
  Future<void> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    } catch (error) {
      debugPrint("Apple Sign-In Fehler: $error");
    }
  }

  // ✅ Google Login
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // Abbruch, falls User den Login abbricht

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      debugPrint("Google Sign-In Fehler: $error");
    }
  }

  // ✅ Facebook Login
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
        await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        debugPrint("Facebook Sign-In abgebrochen");
      }
    } catch (error) {
      debugPrint("Facebook Sign-In Fehler: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Navigator.canPop(context) ? const BackButton() : null,
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
              onTap: signInWithApple,
            ),
            const SizedBox(height: 16),
            buildSocialButton(
              icon: Icons.facebook,
              text: "Login with Facebook",
              color: Colors.blue,
              textColor: Colors.white,
              onTap: signInWithFacebook,
            ),
            const SizedBox(height: 16),
            buildSocialButton(
              icon: Icons.email,
              text: "Sign in with Google",
              color: Colors.white,
              textColor: Colors.black,
              onTap: signInWithGoogle,
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
                "Create an account",
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
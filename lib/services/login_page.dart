import 'package:flutter/material.dart';
import 'auth_service.dart'; // Replace with the actual path

class LoginPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Sign in anonymously
            dynamic result = await _auth.signInAnonymously();
            if (result != null) {
              // Successfully signed in, navigate to the home page
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              // Handle sign-in error
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Failed to sign in. Please try again.'),
              ));
            }
          },
          child: const Text('Sign In Anonymously'),
        ),
      ),
    );
  }
}

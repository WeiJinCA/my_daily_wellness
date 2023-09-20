import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth_service.dart'; // Replace with the actual path

class LoginPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text('Login to Daily Wellness'),
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: FaIcon(
                FontAwesomeIcons.handHoldingHeart,
                size: 140,
                color: Colors.blue,
              ),
            ),
            Center(
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
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.fromLTRB(
                        20.0, 22.0, 20.0, 22.0), // Change the padding
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(
                        fontSize: 18,
                        color: Colors.white), // Change the text style
                  ),
                  elevation: MaterialStateProperty.all<double>(
                      4.0), // Change the elevation
                  // You can customize other properties like shape, shadowColor, overlayColor, etc.
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 40.0), // Adjust the padding as needed
                  child: IntrinsicWidth(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.userNinja),
                        SizedBox(
                            width:
                                12.0), // Add some spacing between the icon and text
                        Text('Anonymous Login'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

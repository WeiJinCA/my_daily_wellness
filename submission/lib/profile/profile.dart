import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/info_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var info = Provider.of<Info>(context, listen: true);
    DateTime? loginTime;

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.isAnonymous) {
      final userMetadata = FirebaseAuth.instance.currentUser?.metadata;
      if (userMetadata != null) {
        loginTime = userMetadata.creationTime!.toLocal();
      }
    }

    String time = loginTime.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Display the user's stock image
              const CircleAvatar(
                radius: 90,
                backgroundColor: Colors.white, // Adjust the size as needed
                backgroundImage: AssetImage(
                    'assets/girl.png'), // Replace with your image asset
              ),
              const SizedBox(height: 20), // Add some spacing

              const Text(
                'Anonymous user', // Replace with the actual signup date
                style: TextStyle(fontSize: 18),
              ),
              // Display the signup date
              Text(
                'Signed up on: $time', // Replace with the actual signup date
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40), // Add more spacing

              // Sign-out button
              ElevatedButton(
                onPressed: () async {
                  // Implement sign-out logic here
                  await FirebaseAuth.instance.signOut();
                  info.resetInfo();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacementNamed(
                      '/login'); // Navigate to the login page
                },
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

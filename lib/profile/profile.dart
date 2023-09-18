import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'assets/user.png'), // Replace with your image asset
              ),
              const SizedBox(height: 20), // Add some spacing

              const Text(
                'Anonymous user', // Replace with the actual signup date
                style: TextStyle(fontSize: 18),
              ),
              // Display the signup date
              const Text(
                'Signed up on: September 16, 2023', // Replace with the actual signup date
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40), // Add more spacing

              // Sign-out button
              ElevatedButton(
                onPressed: () {
                  // Implement sign-out logic here
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

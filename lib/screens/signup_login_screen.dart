

// signup_login_screen.dart

import 'package:flutter/material.dart';
import 'api.dart';
import 'home_screen.dart';  // Import the screen you want to navigate to

class SignupLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            loginUser('example_username', 'example_password');
            
            // Navigate to the HomeScreen after login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}




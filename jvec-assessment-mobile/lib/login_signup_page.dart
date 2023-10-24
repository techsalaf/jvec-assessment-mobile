import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contact_app/homepage.dart';

class LoginSignupPage extends StatelessWidget {
  // Function to handle user login
  Future<void> _handleLogin(BuildContext context) async {
    // Perform login logic here...

    // Save authentication state
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    // Navigate to the home page
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login / Signup'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _handleLogin(context),
          child: Text('Login'),
        ),
      ),
    );
  }
}

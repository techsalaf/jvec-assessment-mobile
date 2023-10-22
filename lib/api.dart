

// api.dart

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token') ?? '';
}

Future<void> loginUser(String username, String password) async {
  final response = await http.post(
    'your_login_api_endpoint',
    body: {
      'username': username,
      'password': password,
    },
  );

  if (response.statusCode == 200) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', response.body);
  } else {
    print('Failed to login: ${response.statusCode}');
  }
}

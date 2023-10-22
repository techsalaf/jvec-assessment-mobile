

// test/api_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/api.dart';

void main() {
  test('getToken should return a token', () async {
    final token = await getToken();
    expect(token.isNotEmpty, true);
  });

  test('loginUser should set the token', () async {
    await loginUser('example_username', 'example_password');
    final token = await getToken();
    expect(token.isNotEmpty, true);
  });
}

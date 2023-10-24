import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:contact_app/contact_model.dart';

class ContactApi {
  final Dio _dio = Dio();

  // Adjust the API endpoint accordingly
  final String baseUrl = 'http://127.0.0.1:8000/';

  String get baseUrlContacts => '$baseUrl' + 'contacts/';
  String get baseUrlToken => '$baseUrl' + 'token/';
  String get baseUrlUsers => '$baseUrl' + 'users/';

  Future<List<Contact>> getContacts() async {
    try {
      final response = await _dio.get(baseUrlContacts);
      return (response.data as List).map((json) => Contact.fromJson(json)).toList();
    } catch (error) {
      print('Get contacts error: $error');
      return [];
    }
  }

  Future<Contact> createContact(Contact contact) async {
    try {
      final response = await _dio.post(baseUrlContacts, data: contact.toJson());
      return Contact.fromJson(response.data);
    } catch (error) {
      print('Create contact error: $error');
      rethrow; // Rethrow the error for higher-level error handling
    }
  }

  Future<Contact> updateContact(Contact contact) async {
    try {
      final response = await _dio.put('$baseUrlContacts/${contact.id}/', data: contact.toJson());
      return Contact.fromJson(response.data);
    } catch (error) {
      print('Update contact error: $error');
      rethrow; // Rethrow the error for higher-level error handling
    }
  }

  Future<void> deleteContact(int contactId) async {
    try {
      await _dio.delete('$baseUrlContacts/$contactId/');
    } catch (error) {
      print('Delete contact error: $error');
      rethrow; // Rethrow the error for higher-level error handling
    }
  }

  Future<Contact> getContactById(int contactId) async {
    try {
      final response = await _dio.get('$baseUrlContacts/$contactId/');
      return Contact.fromJson(response.data);
    } catch (error) {
      print('Get contact by ID error: $error');
      rethrow; // Rethrow the error for higher-level error handling
    }
  }

  Future<String?> loginUser(String username, String password) async {
    try {
      final response = await _dio.post(
        baseUrlToken,
        data: {'username': username, 'password': password},
      );

      final token = response.data['access_token'] as String?;
      return token;
    } catch (error) {
      print('Login error: $error');
      return null;
    }
  }

  Future<void> logoutUser() async {
    // Implement logout logic here, e.g., clear stored tokens, navigate to login screen
  }

  Future<bool> registerUser(String username, String password) async {
    try {
      final response = await _dio.post(baseUrlUsers, data: {'username': username, 'password': password});

      final success = response.statusCode == 201;
      if (success) {
        print('Registration successful!');
      } else {
        print('Registration failed: ${response.data}');
      }

      return success;
    } catch (error) {
      print('Registration error: $error');
      return false;
    }
  }
}

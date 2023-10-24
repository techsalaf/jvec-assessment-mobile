import 'package:flutter/material.dart';
import 'package:contact_app/contact_model.dart';
import 'package:contact_app/contact_api.dart';

class ContactProvider extends ChangeNotifier {
  final ContactApi _api = ContactApi();
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  Future<List<Contact>> getContacts() async {
    _contacts = await _api.getContacts();
    notifyListeners();
    return _contacts;  // Return the list of contacts
  }

  // Method to delete a contact by ID
  void deleteContact(int contactId) {
    _contacts.removeWhere((contact) => contact.id == contactId);
    notifyListeners();
  }

  // Implement other CRUD operations similarly
  // Example: Method to add a new contact
  void addContact(Contact newContact) {
    _contacts.add(newContact);
    notifyListeners();
  }
}

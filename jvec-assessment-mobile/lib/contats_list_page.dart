import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_app/contact_model.dart';
import 'package:contact_app/contact_details_page.dart';
import 'package:contact_app/contact_provider.dart';

class ContactsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the list of contacts using the ContactProvider
    List<Contact> contacts = Provider.of<ContactProvider>(context).contacts;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          Contact contact = contacts[index];
          return ListTile(
            title: Text('${contact.firstName} ${contact.lastName}'),
            subtitle: Text(contact.phoneNumber),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _showDeleteDialog(context, contact.id),
            ),
            // Implement navigation to contact details page on tile tap
            onTap: () {
              // Navigate to contact details page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactDetailsPage(contact: contact)),
              );
            },
          );
        },
      ),
    );
  }

  // Function to show a confirmation dialog before deleting the contact
  void _showDeleteDialog(BuildContext context, int contactId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Contact'),
          content: Text('Are you sure you want to delete this contact?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the delete method from the provider
                Provider.of<ContactProvider>(context, listen: false).deleteContact(contactId);

                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:contact_app/contact_api.dart';
import 'package:provider/provider.dart';
import 'package:contact_app/contact_provider.dart';
import 'package:contact_app/homepage.dart';
import 'package:contact_app/login_signup_page.dart';
import 'package:contact_app/contact_model.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ContactApi contactApi = ContactApi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact App'),
        ),
        body: FutureBuilder<List<Contact>>(
          future: Provider.of<ContactProvider>(context).getContacts(), // Change this line
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final contacts = snapshot.data ?? [];
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ListTile(
                    title: Text('${contact.firstName} ${contact.lastName}'),
                    subtitle: Text(contact.phoneNumber),
                    // Add onTap handler to navigate to contact details page or perform other actions
                  );
                },
              );
            }
          },
        ),
        // home: LoginSignupPage(), // Remove this line, it seems to be duplicated
      ),
    );
  }
}

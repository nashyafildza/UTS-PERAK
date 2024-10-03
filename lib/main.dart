import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contact_provider.dart'; // Import ContactProvider
import 'add_contact.dart'; // Import AddContactScreen
import 'contact_model.dart'; // Import ContactModel

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contact List',
      home: ContactScreen(),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider =
        Provider.of<ContactProvider>(context); // Access provider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contactProvider.contacts.length,
        itemBuilder: (context, index) {
          final contact = contactProvider.contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                contactProvider.removeContact(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactScreen(),
            ),
          );

          if (result != null && result is ContactModel) {
            contactProvider.addContact(result.name, result.phone);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

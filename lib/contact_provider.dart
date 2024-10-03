import 'package:flutter/material.dart';
import 'contact_model.dart'; // Import ContactModel

class ContactProvider with ChangeNotifier {
  final List<ContactModel> _contacts = []; // Updated to ContactModel

  List<ContactModel> get contacts => _contacts;

  void addContact(String name, String phone) {
    _contacts
        .add(ContactModel(name: name, phone: phone)); // Updated to ContactModel
    notifyListeners(); // Notifies the listeners when data changes
  }

  void removeContact(int index) {
    _contacts.removeAt(index);
    notifyListeners(); // Notifies the listeners when data changes
  }
}

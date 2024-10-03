import 'package:flutter/material.dart';
import 'contact_model.dart'; // Import ContactModel

class AddContactScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {
                  // Kembalikan data kontak baru ke halaman sebelumnya
                  Navigator.pop(
                    context,
                    ContactModel(
                        name: nameController.text,
                        phone: phoneController.text), // Updated to ContactModel
                  );
                }
              },
              child: const Text('Add Contact'),
            ),
          ],
        ),
      ),
    );
  }
}

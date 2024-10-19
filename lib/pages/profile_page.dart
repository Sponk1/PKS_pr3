import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController(text: 'Жлудов И.А.');
  final TextEditingController _phoneController = TextEditingController(text: '+7 999 999 99 99');
  final TextEditingController _emailController = TextEditingController(text: 'example@example.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save logic here
                setState(() {});  // Reflect the changes
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated!')));
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}


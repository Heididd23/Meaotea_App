import 'package:flutter/material.dart';

void main() {
  runApp(const AssignedOrderApp());
}

class AssignedOrderApp extends StatelessWidget {
  const AssignedOrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _isEditing = false;

  // Simulated existing user info
  String _userName = 'SELAB ARMY';
  String _userEmail = 'selabarmy12@gmail.com';
  String _userPhone = '+60123456789';

  // Controllers for editing
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current user info
    _nameController.text = _userName;
    _emailController.text = _userEmail;
    _phoneController.text = _userPhone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDA251C),
        title: const Text(
          'User Profile',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_isEditing) {
                // Save changes
                setState(() {
                  _userName = _nameController.text;
                  _userEmail = _emailController.text;
                  _userPhone = _phoneController.text;
                  _isEditing = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profile updated successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                // Enable editing
                setState(() {
                  _isEditing = true;
                });
              }
            },
            child: Text(
              _isEditing ? 'Save' : 'Edit',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),

            // Name Field
            _buildField(
              label: 'Name',
              isEditing: _isEditing,
              controller: _nameController,
              icon: Icons.person,
            ),
            const SizedBox(height: 20),

            // Email Field
            _buildField(
              label: 'Email',
              isEditing: _isEditing,
              controller: _emailController,
              icon: Icons.email,
            ),
            const SizedBox(height: 20),

            // Phone Field
            _buildField(
              label: 'Phone',
              isEditing: _isEditing,
              controller: _phoneController,
              icon: Icons.phone,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required bool isEditing,
    required TextEditingController controller,
    required IconData icon,
  }) {
    if (!isEditing) {
      return ListTile(
        leading: Icon(icon, color: const Color(0xFFDA251C)),
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          controller.text,
          style: const TextStyle(color: Colors.grey),
        ),
      );
    } else {
      return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFFDA251C)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFDA251C)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }
}

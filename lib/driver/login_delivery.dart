import 'package:flutter/material.dart';
import 'dart:convert'; // For utf8.encode
import 'package:crypto/crypto.dart';
import 'package:meaotea/driver/assigned_order.dart'; // For navigation

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  final String _validEmail = "driver01@gmail.com";
  final String _validPasswordHash =
      md5.convert(utf8.encode("selabarmy")).toString(); // Hash of "selabarmy"

  void _login() {
    String email = _emailController.text;
    String passwordHash =
        md5.convert(utf8.encode(_passwordController.text)).toString();

    print('Email: $email');
    print('Password Hash: $passwordHash');

    if (email == _validEmail && passwordHash == _validPasswordHash) {
      // Navigate to MainPage on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AssignedOrder()),
      );
    } else {
      // Show error message
      setState(() {
        _errorMessage = "Invalid email address or password. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Allow scrolling when keyboard appears
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 100),
              const SizedBox(height: 20),
              const Text(
                "Delivery Driver Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Button background color
                  foregroundColor: Colors.black, // Button text color (set to black)
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text("Login", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

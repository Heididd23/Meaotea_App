import 'package:flutter/material.dart';

class DriverSupportPage extends StatelessWidget {
  const DriverSupportPage({super.key}); // Using super parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Support'),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contact Support Information
            const Text(
              "Contact Support",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "For assistance, please use the following contact details:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "📞 Phone: +6012-345-6789",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "📧 Email: support@deliveryapp.com",
              style: TextStyle(fontSize: 16),
            ),
            const Divider(height: 30, thickness: 1),

            // Notice on How to Report Issues
            const Text(
              "Notice: How to Report Issues",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "To report any delivery issues, please follow these steps:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),

            const Text(
              "1. Provide detailed information about the issue, including order details and any relevant evidence in the report box below.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "2. Submit the report, and our support team will get back to you as soon as possible.",
              style: TextStyle(fontSize: 16),
            ),
            const Divider(height: 30, thickness: 1),

            // Feedback Section
            const Text(
              "Report issues",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Your Report',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Submit Report',
              style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Report submitted successfully!'),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DriverSupportPage(),
  ));
}

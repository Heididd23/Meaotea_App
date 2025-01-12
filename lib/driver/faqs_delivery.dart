import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key}); // Using super parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
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
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // FAQ Items
            const ExpansionTile(
              title: Text("How do I report a delivery issue?"),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "To report a delivery issue, navigate to the 'Support' page and fill out the report issue form with all relevant details.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1),

            const ExpansionTile(
              title: Text("What should I do if I can't reach the customer?"),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "If you cannot reach the customer, try contacting them through the app's communication tools or call the support team for assistance.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1),

            const ExpansionTile(
              title: Text("How can I update my availability status?"),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "You can update your availability status in the app's 'Profile' or 'Settings' section under 'Availability'.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1),

            const ExpansionTile(
              title: Text("What happens if a customer cancels the order?"),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "If a customer cancels the order, you will be notified through the app. Follow the instructions provided for next steps.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: FAQPage(),
  ));
}

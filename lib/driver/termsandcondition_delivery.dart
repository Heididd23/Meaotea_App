import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Terms and Conditions for Meaotea Delivery Drivers',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Acceptance of Terms\n\nBy signing up as a delivery driver for the Meaotea app, you agree to abide by these terms and conditions, as well as any applicable laws and regulations regarding delivery services.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '2. Delivery Responsibilities\n\nYou are responsible for timely and safe delivery of orders to customers, ensuring that all food and beverages are delivered in good condition. Drivers must follow traffic laws and ensure their vehicle is in good working condition.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '3. Payment and Earnings\n\nDrivers will receive payment based on the delivery fees, which may include bonuses or tips from customers. Payments will be processed weekly via the provided payment method. Drivers are responsible for their own taxes.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '4. Use of the App\n\nYou must use the Meaotea Delivery app to receive orders, track deliveries, and communicate with the support team. The app should be used for delivery-related activities only.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '5. Delivery Times\n\nYou agree to accept and deliver orders within the timeframe provided by the app. If you are unable to complete a delivery on time, you must notify the support team immediately.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '6. Safety and Insurance\n\nIt is the driver’s responsibility to ensure they have valid insurance coverage for their vehicle. Meaotea is not liable for any accidents or damages that occur during the course of delivery.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '7. Code of Conduct\n\nYou must maintain professionalism while interacting with customers, the Meaotea team, and other drivers. Discriminatory, offensive, or unethical behavior will result in termination of your delivery driver account.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '8. Privacy and Confidentiality\n\nAs a delivery driver, you will have access to customer data. You agree to keep all information confidential and not share or misuse any personal details provided by customers.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '9. Modifications\n\nMeaotea reserves the right to modify these terms and conditions at any time. Changes will be communicated via the app, and continued use of the service constitutes acceptance of the updated terms.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '10. Termination\n\nMeaotea reserves the right to terminate your delivery driver account at any time for breach of these terms and conditions or any actions that affect the operation of the service.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '11. Contact Information\n\nFor any questions or concerns regarding these terms, please contact Meaotea support at support@meaotea.com.\n\n',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

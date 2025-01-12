import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
          centerTitle: true,
          backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Policy for Meaotea Delivery Drivers',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Introduction\n\nThis Privacy Policy explains how Meaotea collects, uses, and protects the personal information of delivery drivers using the Meaotea Delivery app. By using our services, you consent to the collection and use of your information as described in this policy.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '2. Information We Collect\n\nWe collect personal information necessary for you to perform your duties as a delivery driver. This includes:\n\n- Name, email address, and phone number\n- Vehicle details (make, model, license plate)\n- Location data for navigation and order tracking\n- Payment details for processing earnings\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '3. How We Use Your Information\n\nYour personal information will be used for the following purposes:\n\n- To process and track deliveries\n- To communicate order details, updates, and feedback\n- To process payments and disburse earnings\n- To improve the delivery experience and provide support\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '4. Data Sharing\n\nWe do not share your personal information with third parties except in the following cases:\n\n- With service providers or partners that assist us in delivering our services (e.g., payment processors)\n- If required by law or to protect the rights, property, or safety of Meaotea or its users\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '5. Data Retention\n\nYour personal information will be retained only as long as necessary to fulfill the purposes outlined in this Privacy Policy. After that, it will be securely deleted unless required by law to retain certain data.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '6. Your Rights\n\nYou have the right to access, update, or delete your personal information at any time. To make any changes to your data or request its deletion, please contact us at support@meaotea.com.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '7. Security\n\nWe take the security of your personal information seriously and implement appropriate technical and organizational measures to protect it from unauthorized access, disclosure, alteration, or destruction.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '8. Cookies and Tracking Technologies\n\nWe may use cookies or similar technologies to enhance the functionality of the Meaotea Delivery app. These technologies help us track your activity for purposes such as improving performance and personalizing your experience.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '9. Changes to the Privacy Policy\n\nMeaotea reserves the right to update or modify this Privacy Policy at any time. Any changes will be reflected in the updated version of this document. We encourage you to review this policy periodically.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '10. Contact Information\n\nIf you have any questions or concerns about this Privacy Policy or how your personal information is handled, please contact us at support@meaotea.com.\n\n',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:meaotea/driver/FAQS_Delivery.dart';
import 'package:meaotea/driver/termsandcondition_delivery.dart';
import 'package:meaotea/driver/allottedarea_driver.dart';
import 'package:meaotea/driver/askforleave_delivery.dart';
import 'package:meaotea/driver/delivery_support.dart';
import 'package:meaotea/driver/privacypolicy_delivery.dart';
import 'edit_profile.dart';
import 'login_delivery.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.red,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Profile Section
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade300,
                        child: const Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(23, 0, 0, 0),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.star, color: Colors.red, size: 16),
                              SizedBox(width: 2),
                              Text(
                                '4.9',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'SElab Army',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '+60 1123478854',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    'selabArmy@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu Options
            _buildAccountOption(
              title: 'Edit Profile',
              icon: Icons.edit,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserProfilePage ()),
                );
              },
            ),
            _buildAccountOption(
              title: 'Allotted Area',
              icon: Icons.map,
              onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllottedAreaPage()),
                );
              },
            ),
            _buildAccountOption(
              title: 'Support',
              icon: Icons.support_agent,
              onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DriverSupportPage ()),
               );

              },
            ),
            _buildAccountOption(
              title: 'FAQ',
              icon: Icons.question_answer,
              onTap: () {
                                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FAQPage()),
               );
              },
            ),
            _buildAccountOption(
              title: 'Terms and Conditions',
              icon: Icons.description,
              onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TermsAndConditionsPage()),
               );
              },
            ),
            _buildAccountOption(
              title: 'Privacy Policy',
              icon: Icons.privacy_tip,
              onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()),
               );
              },
            ),
            _buildAccountOption(
              title: 'Ask For Leave',
              icon: Icons.calendar_today,
              onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LeaveRequestPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget to build account options
  Widget _buildAccountOption({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: onTap,
    );
  }
}

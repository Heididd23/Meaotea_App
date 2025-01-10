import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for navigation
import 'transaction.dart';
import 'activity.dart';
import 'favourite.dart';
import 'my_voucher.dart';
import 'loginpage.dart';  // Import your LoginPage

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Add settings logic here
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () async {
              // Clear any stored session data (e.g., token, preferences)
              // Example: Clearing shared preferences (if used)
              // SharedPreferences prefs = await SharedPreferences.getInstance();
              // prefs.remove('user_token'); // Remove stored user token

              // Navigate to login page and reset navigation stack
              Get.offAll(() => const LoginPage()); // This will remove all the previous screens and navigate to LoginPage
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Section
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.red.shade100,
                child: Icon(Icons.person, size: 40, color: Colors.red),
              ),
              SizedBox(height: 10),
              Text(
                'SELab Army',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'selabArmy5@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),

              // Wallet Section with Meaotea Logo, Member Tier, and Top-Up
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Meaotea Logo, Balance, and Top-Up Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/meaotea_logo.png', // Meaotea logo
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'RM 0.00',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Balance',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade400,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            ),
                            onPressed: () {
                              // Add Top-Up functionality here
                            },
                            child: Text(
                              'Top Up',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Points and Member Tier Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Points Section
                          Text(
                            '50 pts',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Points',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 12),

                          // Member Tier Section
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: const Color.fromARGB(255, 179, 136, 9), // Replace with dynamic color for tiers
                                    child: Text(
                                      'B', // First letter of the tier, e.g., "B" for Bronze
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Bronze Tier',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.swap_horiz, 'Transaction', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionHistoryPage(),
                      ),
                    );
                  }),
                  _buildActionButton(Icons.history, 'Order History', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Activity(),
                      ),
                    );
                  }),
                  _buildActionButton(Icons.favorite, 'Favourites', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoritesPage(),
                      ),
                    );
                  }),
                  _buildActionButton(Icons.percent, 'My Vouchers', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyVouchersPage(),
                      ),
                    );
                  }),
                ],
              ),

              SizedBox(height: 20),

              // Invite Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: () {
                  // Add invite logic here
                },
                child: Text(
                  'Invite Your Friends',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Help & Feedback Section
              ListTile(
                leading: Icon(Icons.help_outline, color: Colors.red),
                title: Text('Help Centre'),
                onTap: () {
                  // Add Help Centre logic here
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback_outlined, color: Colors.red),
                title: Text('Feedback'),
                onTap: () {
                  // Add Feedback logic here
                },
              ),

              // Footer Logo
              SizedBox(height: 30),
              Image.asset(
                'assets/images/meaotea_logo.png', // Replace with your logo asset
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 65, // Fixed width
          height: 65, // Fixed height
          decoration: BoxDecoration(
            color: Colors.red.shade50, // Light red background
            borderRadius: BorderRadius.circular(12), // Rounded rectangle
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.red, size: 28),
            onPressed: onPressed,
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: 80, // Match button width
          height: 18, // Fixed height for the text
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'redeem_rewards_page.dart';
import 'my_vouchers_page.dart';
import 'member_tier_page.dart';
import 'reward_faqs_page.dart';

class Reward extends StatefulWidget {
  const Reward({super.key});

  @override
  _RewardState createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Meaotea Rewards',
          style: TextStyle (
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Reward Info Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Meaotea Points',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '50 pts',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 24),
                            Text('Bronze', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'RM 0.50',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

                        // Action Buttons
            Expanded(
              child: ListView(
                children: [
                  CustomButton(
                    label: 'Redeem Rewards',
                    onPressed: () {
                      // Navigate to Redeem Rewards Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RedeemRewardsPage()),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'My Vouchers',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyVouchersPage()),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Member Tier',
                   onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MemberTierPage()),
                      );
                    },

                  ),
                  CustomButton(
                    label: 'Rewards FAQs',
                     onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RewardsFAQsPage()),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Footer Section
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FooterItem(
                  icon: Icons.card_giftcard,
                  label: 'Earn points\nfor every purchase',
                ),
                FooterItem(
                  icon: Icons.star,
                  label: 'Member\nExclusive Deals',
                ),
                FooterItem(
                  icon: Icons.card_membership,
                  label: 'Get vouchers\non your birth month',
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
  }
}

// Reusable Button Widget
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Footer Item Widget
class FooterItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const FooterItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.red),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}


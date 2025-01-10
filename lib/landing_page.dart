import 'package:flutter/material.dart';
import 'loginpage.dart'; // Import LoginPage for navigation
import 'package:get/get.dart'; // Ensure you add `get` package for navigation

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image grid
          Positioned.fill(
            child: Image.asset(
              'assets/background_grid.png', // Replace with your actual image path
              fit: BoxFit.cover,
            ),
          ),

          // Content positioned at the top left (welcome text)
          Positioned(
            top: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome To',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily:
                        'BubblegumSans', // Ensure this font is added in pubspec.yaml
                  ),
                ),
                Text(
                  'Meaotea',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'BubblegumSans',
                  ),
                ),
                SizedBox(height: 10), // Add spacing between text and slogan
                Text(
                  'Serve with various types of Bubble Tea,\nCoffee, Snacks & Cakes',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.2, // Line height for better readability
                  ),
                ),
              ],
            ),
          ),

          // Centered content (logo and button)
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.4, // Adjust based on screen size
            left: 0,
            right: 0, // Center horizontally
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/meaotea_logo.png', // Replace with your logo path
                    width: 180,
                    height: 180,
                  ),
                ),
                const SizedBox(
                    height: 100), // Add spacing between logo and button

                // Get Started button
                ElevatedButton(
                  onPressed: () {
                    Get.to(() =>
                        const LoginPage()); // Navigate to LoginPage using Get.to()
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.red.withOpacity(0.7), // Semi-transparent red
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'BubblegumSans', // Ensure consistency with the design theme
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(25.0), // Rounded button corners
                    ),
                  ),
                  child: const Text(
                    'GET STARTED',
                    style: TextStyle(
                        color: Colors.white), // White text for contrast
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

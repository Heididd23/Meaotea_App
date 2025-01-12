import 'package:flutter/material.dart';

class DeliveryMapPage extends StatelessWidget {
  const DeliveryMapPage({super.key});

  // Function to show the bottom sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Ensures the sheet size fits the content
            children: [
              const Text(
                'Driver Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(width: 8),
                  Text('Driver: Driver01'),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.phone),
                  SizedBox(width: 8),
                  Text('Phone: +60123456789'),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Customer Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(width: 8),
                  Text('Customer: Kelly '),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.location_on),
                  SizedBox(width: 8),
                  Text('Address: Kolej Cempaka Unimas'),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.phone),
                  SizedBox(width: 8),
                  Text('Phone: +60198765432'),
                ],
              ),
              const SizedBox(height: 16),
              // Centered "Start Delivery" button
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    // Action to start the delivery progress
                    Navigator.pop(context); // Close the bottom sheet after starting the delivery
                    // Add your delivery start logic here
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delivery Started'),
                          content: const Text('The delivery has started.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Start Delivery', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Delivery Map'),
      ),
      body: Center(
        child: Image.asset(
          'assets/map_images.jpg', // Path to your map image
          fit: BoxFit.cover, // Makes the image cover the screen
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      // Button to show the bottom sheet
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(context),
        backgroundColor: Colors.red,
        child: const Icon(Icons.info_outline),
      ),
    );
  }
}

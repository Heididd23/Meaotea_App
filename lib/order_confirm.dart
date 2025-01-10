import 'package:flutter/material.dart';
import 'track_order.dart';

class OrderSuccessPage extends StatefulWidget {
  const OrderSuccessPage({super.key});

  @override
  _OrderSuccessPageState createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage> {
  // Track the current step
  String orderStatus = 'Order received';
  Color preparingColor = Colors.grey;
  Color readyColor = Colors.grey;
  Color progressLineColor1 = Colors.grey;
  Color progressLineColor2 = Colors.grey;

  @override
  void initState() {
    super.initState();
    _simulateOrderProgress();
  }

  // Simulate the order progress
  void _simulateOrderProgress() {
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        orderStatus = 'Preparing';
        preparingColor = Colors.red;
        progressLineColor1 = Colors.red; // Update first progress line
      });

      // After another 5 seconds, mark the order as ready
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          orderStatus = 'Ready';
          readyColor = Colors.green;
          progressLineColor2 = Colors.red; // Update second progress line
        });

        // After another 3 seconds, navigate to Track Order Page
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrackOrderPage(), // Replace with your track order page widget
            ),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Success Icon
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 60),
            ),
            const SizedBox(height: 20),
            // Order Success Text
            const Text(
              'Order Successful!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // Order Status Header
            const Text(
              'Order Status',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            // Progress Tracker
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Step 1: Order Received
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.red,
                      child: const Text('1', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Order\nreceived',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                // Step Separator
                Expanded(
                  child: AnimatedContainer(
                    height: 4,
                    duration: const Duration(seconds: 2),
                    color: progressLineColor1,
                  ),
                ),
                // Step 2: Preparing
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: preparingColor,
                      child: const Text('2', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Preparing',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                // Step Separator
                Expanded(
                  child: AnimatedContainer(
                    height: 4,
                    duration: const Duration(seconds: 5),
                    color: progressLineColor2,
                  ),
                ),
                // Step 3: Ready
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: readyColor,
                      child: const Text('3', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Ready',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Button to Go Back or Continue Shopping
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Update this if a menu page is defined
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Back to Menu',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

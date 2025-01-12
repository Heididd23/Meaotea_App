import 'package:flutter/material.dart';
import 'order_page.dart';
import 'account_delivery.dart';

//void main() {
 // runApp(const AssignedOrderApp());
//}


class AssignedOrder extends StatelessWidget {
  const AssignedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AssignedOrderScreen(),
    );
  }
}

// Main Screen Widget
class AssignedOrderScreen extends StatefulWidget {
  const AssignedOrderScreen({super.key});

  @override
  State<AssignedOrderScreen> createState() => _AssignedOrderScreenState();
}

class _AssignedOrderScreenState extends State<AssignedOrderScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AssignedOrderScreenBody(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(218, 37, 28, 1),
        title: const Text(
          'Logged in as:\nMeaotea Delivery Driver',
          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primaryRed,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

// Assigned Orders Body
class AssignedOrderScreenBody extends StatelessWidget {
  const AssignedOrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(title: 'View Assigned Order'),
        Expanded(
          child: ListView(
            children: const [
              OrderCard(
                orderNumber: '#12345',
                status: 'Pickup Pending',
                productName: 'Cheesy Meaotea',
                imageUrl: 'assets/cheesy_meaotea.jpg',
                isDelivered: false,
              ),
              OrderCard(
                orderNumber: '#56789',
                status: 'Delivered',
                productName: 'Milktea Boba',
                imageUrl: 'assets/boba_milktea.jpg',
                isDelivered: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Header Text Widget
class HeaderText extends StatelessWidget {
  final String title;
  const HeaderText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryRed,
          ),
        ),
      ),
    );
  }
}

// Order Card Widget
class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String status;
  final String productName;
  final String? imageUrl;
  final bool isDelivered;

  const OrderCard({
    super.key,
    required this.orderNumber,
    required this.status,
    required this.productName,
    this.imageUrl,
    this.isDelivered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image or Placeholder
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.placeholderGrey,
                image: imageUrl != null
                    ? DecorationImage(
                        image: AssetImage(imageUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: imageUrl == null
                  ? const Icon(Icons.image, color: Colors.grey)
                  : null,
            ),
          ),
          // Order Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order $orderNumber',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        'Status:',
                        style: TextStyle(
                          color: AppColors.primaryRed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        status,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Details Button
          Padding(
            padding: const EdgeInsets.only(right: 12.0, top: 12.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    isDelivered ? Colors.transparent : AppColors.primaryRed,
                side: isDelivered
                    ? const BorderSide(color: AppColors.primaryRed)
                    : BorderSide.none,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderDetails()),
                );
              },
              child: Text(
                'Details',
                style: TextStyle(
                  color: isDelivered ? AppColors.primaryRed : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// App Colors
class AppColors {
  static const Color primaryRed = Color(0xFFDA251C);
  static const Color placeholderGrey = Color(0xFFE0E0E0);
}

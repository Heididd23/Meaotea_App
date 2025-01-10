import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Order History',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Sample Order 1
          _buildOrderCard('12 Jan 2025', 'Order #1234', '2 items', 'Delivered'),
          _buildOrderCard('11 Jan 2025', 'Order #1235', '1 item', 'Pending'),
          _buildOrderCard('10 Jan 2025', 'Order #1236', '3 items', 'Delivered'),
          _buildOrderCard('09 Jan 2025', 'Order #1237', '5 items', 'Cancelled'),
          _buildOrderCard('08 Jan 2025', 'Order #1238', '4 items', 'Delivery'),
        ],
      ),
    );
  }

  // Helper method to build an order card
  Widget _buildOrderCard(String date, String orderId, String items, String status) {
    Color statusColor;

    // Determine color based on order status
    switch (status) {
      case 'Delivered':
        statusColor = Colors.green;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Cancelled':
        statusColor = Colors.red;
        break;
      case 'Shipped':
        statusColor = Colors.blue;
        break;
      default:
        statusColor = Colors.black;
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        title: Text(
          orderId,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 4),
            Text(
              items,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
        trailing: Chip(
          label: Text(
            status,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: statusColor,
        ),
      ),
    );
  }
}

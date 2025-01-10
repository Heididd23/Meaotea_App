import 'package:flutter/material.dart';

class MyVouchersPage extends StatelessWidget {
  const MyVouchersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Vouchers',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Sample Voucher 1
          _buildVoucherCard('VOUCHER123', 'Get 20% off on your next purchase', 'Available'),
          _buildVoucherCard('VOUCHER124', 'Free delivery on orders above RM 50', 'Used'),
          _buildVoucherCard('VOUCHER125', 'RM 10 off on your next purchase', 'Expired'),
          _buildVoucherCard('VOUCHER126', 'Buy 1 Get 1 Free', 'Available'),
        ],
      ),
    );
  }

  // Helper method to build a voucher card
  Widget _buildVoucherCard(String code, String description, String status) {
    Color statusColor;

    // Determine color based on voucher status
    switch (status) {
      case 'Available':
        statusColor = Colors.green;
        break;
      case 'Used':
        statusColor = Colors.grey;
        break;
      case 'Expired':
        statusColor = Colors.red;
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
          code,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Status: $status',
              style: TextStyle(
                fontSize: 14,
                color: statusColor,
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

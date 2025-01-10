import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Transaction History',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Sample Transaction 1
          _buildTransactionCard('12 Jan 2025', 'Top-up', 50.00),
          _buildTransactionCard('11 Jan 2025', 'Payment', -20.00),
          _buildTransactionCard('10 Jan 2025', 'Top-up', 30.00),
          _buildTransactionCard('09 Jan 2025', 'Refund', 20.00),
          _buildTransactionCard('08 Jan 2025', 'Payment', -20.00),
        ],
      ),
    );
  }

  // Helper method to build a transaction card
  Widget _buildTransactionCard(String date, String type, double amount) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        title: Text(
          type,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: type == 'Top-up' ? Colors.green : Colors.red,
          ),
        ),
        subtitle: Text(
          date,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        trailing: Text(
          'RM ${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: amount > 0 ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}

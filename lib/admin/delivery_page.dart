import 'package:flutter/material.dart';

class DeliveryPage extends StatelessWidget {
  final List<Map<String, dynamic>> deliveries = [
    {
      "orderId": "#10112",
      "salesNo": "S1253",
      "driver": "Ariffudin",
      "date": "2025-01-11",
      "time": "12:30 PM",
      "status": "Completed",
    },
    {
      "orderId": "#12345",
      "salesNo": "S7726",
      "driver": "Siti Aminah",
      "date": "2025-01-11",
      "time": "1:15 PM",
      "status": "Out for Delivery",
    },
    {
      "orderId": "#56789",
      "salesNo": "S9376",
      "driver": "Danish",
      "date": "2025-01-11",
      "time": "2:45 PM",
      "status": "Pending",
    },
    {
      "orderId": "#45287",
      "salesNo": "S9126",
      "driver": "Alice",
      "date": "2025-01-11",
      "time": "3:30 PM",
      "status": "Picked Up",
    },
  ];

  DeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: deliveries.length,
        itemBuilder: (context, index) {
          final delivery = deliveries[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order ID: ${delivery['orderId']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text("Sales No.: ${delivery['salesNo']}"),
                  const SizedBox(height: 5),
                  Text("Driver: ${delivery['driver']}"),
                  const SizedBox(height: 5),
                  Text("Date: ${delivery['date']}"),
                  const SizedBox(height: 5),
                  Text("Time: ${delivery['time']}"),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Status:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Chip(
                        label: Text(
                          delivery['status'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: _getStatusColor(delivery['status']),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Out for Delivery":
        return Colors.orange;
      case "Pending":
        return Colors.red;
      case "Picked Up":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

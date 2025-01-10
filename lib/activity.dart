import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Sample list of orders
  final List<Order> orders = [
    Order(orderId: "12345678", salesNo: "S12345678", orderDate: "24 Nov 2024, 06:00 PM"),
    Order(orderId: "87654321", salesNo: "S87654321", orderDate: "23 Nov 2024, 03:30 PM"),
    Order(orderId: "11223344", salesNo: "S11223344", orderDate: "22 Nov 2024, 01:00 PM"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Activity',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.red,
          indicator: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          tabs: const [
            Tab(text: "All"),
            Tab(text: "Past 30 days"),
            Tab(text: "Past 60 days"),
            Tab(text: "Delivery"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(4, (index) => buildTabContent()),
      ),
    );
  }

  Widget buildTabContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: orders.length, // Dynamic count based on the orders list
        itemBuilder: (context, index) {
          return buildActivityCard(orders[index]);
        },
      ),
    );
  }

  Widget buildActivityCard(Order order) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Pickup completed",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Order ID: ${order.orderId}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              "Sales No: ${order.salesNo}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              order.orderDate,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {
                  // Handle "Reorder" button press
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  "Reorder",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model class for Order
class Order {
  final String orderId;
  final String salesNo;
  final String orderDate;

  Order({
    required this.orderId,
    required this.salesNo,
    required this.orderDate,
  });
}

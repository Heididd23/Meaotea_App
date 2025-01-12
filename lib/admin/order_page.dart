import 'package:flutter/material.dart';
import 'preparing_details_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        backgroundColor: Colors.red,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Manage Orders',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              'Logged in as: Admin/Staff',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[300],
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Incoming'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Incoming Tab Content
          ListView(
            children: [
              _buildOrderCard(
                context,
                "Order #12345",
                "Preparing",
                "Cheesy Meaotea",
                "https://images.deliveryhero.io/image/fd-my/Products/1425535362.jpg??width=400",
              ),
              _buildOrderCard(
                context,
                "Order #56789",
                "Preparing",
                "Salad Chicken Rice",
                "https://images.deliveryhero.io/image/fd-my/Products/1508929478.jpg??width=400",
              ),
            ],
          ),
          // Completed Tab Content
          ListView(
            children: [
              _buildCompletedOrderCard(
                "Order #10112",
                "Matcha Smoothie",
                "https://images.deliveryhero.io/image/fd-my/Products/1425535334.jpg??width=400",
              ),
              _buildCompletedOrderCard(
                "Order #13145",
                "Cheese Wedges",
                "https://images.deliveryhero.io/image/fd-my/Products/1425535384.jpg??width=400",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(
    BuildContext context,
    String orderId,
    String status,
    String itemName,
    String imageUrl,
  ) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(orderId),
        subtitle: Text(itemName),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PreparingDetailsPage(orderId: orderId),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            status,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompletedOrderCard(
    String orderId,
    String itemName,
    String imageUrl,
  ) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(orderId),
        subtitle: Text(itemName),
        trailing: const Text(
          'Completed',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

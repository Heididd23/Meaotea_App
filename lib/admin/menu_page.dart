import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Example menu items
  List<Map<String, dynamic>> drinks = [
    {
      "name": "Orange Juice Soda",
      "price": 13.9,
      "image":
          "https://images.deliveryhero.io/image/fd-my/Products/1435468480.jpg??width=400",
    },
    {
      "name": "Cheesy Meaotea",
      "price": 9.9,
      "image":
          "https://images.deliveryhero.io/image/fd-my/Products/1425535362.jpg??width=400",
    },
    {
      "name": "Thai Green Tea Pearl",
      "price": 10.9,
      "image":
          "https://images.deliveryhero.io/image/fd-my/Products/1526060526.jpg??width=400",
    },
    {
      "name": "Matcha Smoothie",
      "price": 12.9,
      "image":
          "https://images.deliveryhero.io/image/fd-my/Products/1425535334.jpg??width=400",
    },
    {
      "name": "Strawberry Green Tea",
      "price": 8.9,
      "image":
          "https://images.deliveryhero.io/image/fd-my/Products/1425535351.jpg??width=400",
    },
  ];

  List<Map<String, dynamic>> foods = [
    {
      "name": "Spaghetti Bolognese",
      "price": 10.9,
      "image":
          "https://images.deliveryhero.io/image/fd-my/Products/1508931688.jpg??width=400",
    },
    {
      "name": "Crispy Spicy Chicken With Rice",
      "price": 10.5,
      "image":
          "https://images.deliveryhero.io/image/fd-my/Products/1508929504.jpg??width=400",
    },
    {
      "name": "Crispy Chicken Spicy",
      "price": 9.9,
      "image":
          "https://images.deliveryhero.io/image/fd-my/Products/1508930931.jpg??width=400",
    },
    {
      "name": "Nuggets",
      "price": 8.9,
      "image":
          "https://images.deliveryhero.io/image/fd-my/Products/1433271941.jpg??width=400",
    },
    {
      "name": "Mccain Mozzarella",
      "price": 13.9,
      "image":
          "https://images.deliveryhero.io/image/fd-my/Products/1529874429.jpg??width=400",
    },
  ];

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
        title: const Text("Menu"),
        backgroundColor: Colors.red,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "Drinks"),
            Tab(text: "Foods"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMenuGrid(drinks, "drinks"),
          _buildMenuGrid(foods, "foods"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        onPressed: () {
          _showAddOrEditMenuDialog(context, category: "drinks");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMenuGrid(List<Map<String, dynamic>> menuItems, String category) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image.network(
                        item["image"],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          _showAddOrEditMenuDialog(
                            context,
                            category: category,
                            existingItem: item,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "RM ${item["price"].toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddOrEditMenuDialog(BuildContext context,
      {String category = "drinks",
      Map<String, dynamic>? existingItem,
      int? index}) {
    final isEdit = existingItem != null;

    final TextEditingController nameController =
        TextEditingController(text: isEdit ? existingItem["name"] : "");
    final TextEditingController priceController = TextEditingController(
        text: isEdit ? existingItem["price"].toString() : "");
    final TextEditingController imageController =
        TextEditingController(text: isEdit ? existingItem["image"] : "");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEdit ? "Edit Menu" : "Add New Menu"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Menu Name"),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: "Price (RM)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(labelText: "Image URL"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              final newItem = {
                "name": nameController.text,
                "price": double.tryParse(priceController.text) ?? 0.0,
                "image": imageController.text,
              };

              setState(() {
                if (isEdit) {
                  // Update existing item
                  if (category == "drinks") {
                    drinks[index!] = newItem;
                  } else {
                    foods[index!] = newItem;
                  }
                } else {
                  // Add new item
                  if (category == "drinks") {
                    drinks.add(newItem);
                  } else {
                    foods.add(newItem);
                  }
                }
              });

              Navigator.of(context).pop();
            },
            child: Text(isEdit ? "Update" : "Add"),
          ),
        ],
      ),
    );
  }
}

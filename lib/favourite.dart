import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Favorites',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Sample Favorite Item 1
          _buildFavoriteCard('Cheesy Meaotea', 'A rich, creamy blend of cheeses and spices, served with crispy, golden-brown tortilla chips.', Icons.favorite),
          _buildFavoriteCard('Thai Green Tea Pearl', 'Delightful Thai green tea infused with chewy tapioca pearls.', Icons.favorite),
          _buildFavoriteCard('Oreo Chocolate Smoothie', 'Indulge in a creamy, chocolatey smoothie with crunchy cookie bits.', Icons.favorite),
          _buildFavoriteCard('Mango Smoothie', 'Fresh mango blended with yogurt, milk & ice.', Icons.favorite),
        ],
      ),
    );
  }

  // Helper method to build a favorite card
  Widget _buildFavoriteCard(String title, String description, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        trailing: Icon(
          icon,
          color: Colors.red,
        ),
      ),
    );
  }
}

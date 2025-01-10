import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class ItemDetailPage extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final String description;
  final bool customizable;
  final List<Map<String, dynamic>> variations;
  final List<String> sugarLevels;
  final String selectedSugarLevel;

  const ItemDetailPage({
    required this.name,
    required this.image,
    required this.price,
    this.description = "",
    required this.customizable,
    required this.variations,
    required this.sugarLevels,
    required this.selectedSugarLevel,
    Key? key,
  }) : super(key: key);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int selectedVariationIndex = 0;
  String _selectedSugarLevel = '';
  int _quantity = 1; // Initialize quantity to 1

  @override
  void initState() {
    super.initState();
    _selectedSugarLevel = widget.selectedSugarLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.image,
                width: 290,
                height: 295,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.name,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Color(0xffDA251C),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'RM ${widget.customizable ? widget.variations[selectedVariationIndex]['price'].toStringAsFixed(2) : widget.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            if (widget.description.isNotEmpty) ...[
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
            ],
            if (widget.customizable && widget.variations.isNotEmpty) ...[
              Text(
                'Variation:',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: widget.variations.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> variation = entry.value;
                  bool isSelected = index == selectedVariationIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedVariationIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xffDA251C) : Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? const Color(0xffDA251C) : Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        variation['name'],
                        style: TextStyle(
                          fontSize: 16.0,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
            if (widget.customizable && widget.sugarLevels.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Sugar Level:',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: widget.sugarLevels.map((sugarLevel) {
                  bool isSelected = _selectedSugarLevel == sugarLevel;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSugarLevel = sugarLevel;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xffDA251C) : Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? const Color(0xffDA251C) : Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        sugarLevel,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity:',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_quantity > 1) _quantity--;
                        });
                      },
                      icon: const Icon(Icons.remove, color: Color(0xffDA251C)),
                    ),
                    Text(
                      _quantity.toString(),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                      icon: const Icon(Icons.add, color: Color(0xffDA251C)),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffDA251C),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to cart!'),
                  ),
                );

                final priceToAdd = widget.customizable
                    ? widget.variations[selectedVariationIndex]['price']
                    : widget.price;

                Provider.of<CartProvider>(context, listen: false).addItem(
                  _quantity,
                  priceToAdd,
                  _selectedSugarLevel,
                  widget.name,
                  widget.image,
                  widget.customizable ? widget.variations[selectedVariationIndex]['name'] : '',
                );
              },
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

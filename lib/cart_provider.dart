import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  String? _deliveryAddress; // Store the delivery address
  String? deliveryTime;
  List<CartItem> _items = [];
  String _voucherCode = ''; // Store the voucher code
  double _voucherDiscount = 0.0; // Store the applied discount
  String _selectedPaymentMethod = '';

  String? get deliveryAddress => _deliveryAddress;

  List<CartItem> get items => _items;

  // Get the voucher code
  String get voucherCode => _voucherCode;

  // Get the applied voucher discount
  double get voucherDiscount => _voucherDiscount; // Getter for the voucher discount

  String get selectedPaymentMethod => _selectedPaymentMethod; // Getter for payment method

  // Get the total number of items in the cart
  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  // Get the total price of items in the cart (before discount and delivery fee)
  double get totalPrice {
    double priceWithoutDiscount = _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
    return priceWithoutDiscount - _voucherDiscount;
  }

  // Get the total price after including delivery fee and applying voucher discount
  double get grandTotal {
    double priceWithoutDiscount = _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
    double totalAmount = priceWithoutDiscount + 3.00; // Adding delivery fee
    return totalAmount - _voucherDiscount;
  }

  // Setter for deliveryAddress
  set deliveryAddress(String? address) {
    _deliveryAddress = address;
    notifyListeners(); // Notify listeners to rebuild UI when address changes
  }

  // Set delivery time
  void setDeliveryTime(String time) {
    deliveryTime = time;
    notifyListeners();
  }

  // Add item to the cart
  void addItem(
    int quantity,
    double price,
    String sugarLevel,
    String name,
    String image,
    String selectedVariation,
  ) {
    final existingItemIndex = _items.indexWhere((item) =>
        item.price == price && item.sugarLevel == sugarLevel && item.name == name);

    if (existingItemIndex >= 0) {
      _items[existingItemIndex].quantity += quantity;
    } else {
      _items.add(CartItem(
        quantity: quantity,
        price: price,
        sugarLevel: sugarLevel,
        name: name,
        image: image,
        selectedVariation: selectedVariation,
      ));
    }
    notifyListeners();
  }

  // Update the quantity of an item in the cart
  void updateQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _items.length) {
      if (newQuantity > 0) {
        _items[index].quantity = newQuantity;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  // Remove an item from the cart
  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  // Clear the entire cart
  void clearCart() {
    _items.clear();
    _voucherCode = ''; // Clear the voucher code
    _voucherDiscount = 0.0; // Reset the voucher discount
    notifyListeners();
  }

  // Apply the voucher and calculate the discount
  void applyVoucher(String voucherCode) {
    _voucherCode = voucherCode.trim();

    // Example: Apply a fixed discount
    if (_voucherCode == 'DISCOUNT5') {
      _voucherDiscount = 5.00;
    } else if (_voucherCode == 'DISCOUNT10') {
      _voucherDiscount = 10.00;  
    } else if (_voucherCode == 'DISCOUNT12') {
      _voucherDiscount = 12.00;    
    } else {
      _voucherDiscount = 0.0; // No discount
    }

    notifyListeners();
  }

  // Set the selected payment method
  void setPaymentMethod(String paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }
}

class CartItem {
  int quantity;
  final String name;
  final String image;
  final double price;
  final String sugarLevel;
  final bool isCustomizable;
  final String selectedVariation;

  CartItem({
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    this.sugarLevel = '',
    this.isCustomizable = true,
    this.selectedVariation = '',
  });
}

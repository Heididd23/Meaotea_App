import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart'; // Import your CartProvider
import 'payment_method.dart'; // Import the Payment Methods Page
import 'order_confirm.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the delivery address from CartProvider
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Order Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Adjust the font weight
          ),
        ),
        centerTitle: true, // Ensures the title is centered
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Free Delivery Banner
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: const Color(0xffDA251C),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: const Text(
                      "Spend RM12.00 more for FREE DELIVERY",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Delivery Section
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      child: ListTile(
                        leading: const Icon(Icons.delivery_dining, color: Color(0xffDA251C), size: 40),
                        title: const Text("Delivery To"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display delivery address from CartProvider
                            Text('Delivery Address: ${cartProvider.deliveryAddress ?? "Not Set"}'),
                            SizedBox(height: 5),
                            // Display estimated delivery time
                            Text(
                              "Estimated Delivery: ${cartProvider.deliveryTime ?? "ASAP (15 - 30 mins)"}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Order Summary
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Order Summary",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 10),

                        // Display cart items dynamically
                        Consumer<CartProvider>(
                          builder: (context, cartProvider, child) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cartProvider.items.length,
                              itemBuilder: (context, index) {
                                final cartItem = cartProvider.items[index];

                                return Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage(cartItem.image),
                                    ),
                                    title: Text(cartItem.name),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if (cartItem.isCustomizable) ...[
                                          if (cartItem.selectedVariation.isNotEmpty) ...[
                                            Text(
                                                "Variation: ${cartItem.selectedVariation}"),
                                            Text("Sugar Level: ${cartItem.sugarLevel}"),
                                          ],
                                        ],
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.remove,
                                                  color: Color(0xffDA251C)),
                                              onPressed: () {
                                                if (cartItem.quantity > 1) {
                                                  cartProvider.updateQuantity(
                                                      index, cartItem.quantity - 1);
                                                } else {
                                                  cartProvider.removeItem(index);
                                                }
                                              },
                                            ),
                                            Text(
                                              "${cartItem.quantity}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.add,
                                                  color: Color(0xffDA251C)),
                                              onPressed: () {
                                                cartProvider.updateQuantity(
                                                    index, cartItem.quantity + 1);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    trailing: Text(
                                        "RM ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}"),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Pricing Breakdown with Voucher Button
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                        double voucherDiscount = cartProvider.voucherDiscount; // Accessing the voucher discount using the getter

                        double totalAmount = cartProvider.totalPrice + 3.00; // Delivery Fee
                        double grandTotal = totalAmount - voucherDiscount;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Amount Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Amount"),
                                Text("RM ${cartProvider.totalPrice.toStringAsFixed(2)}"),
                              ],
                            ),
                            // Voucher Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Voucher"),
                                Text("- RM ${voucherDiscount.toStringAsFixed(2)}"),
                              ],
                            ),
                            // Delivery Fee Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Delivery Fee"),
                                Text("RM 3.00"),
                              ],
                            ),
                            const Divider(),
                            // Grand Total Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Grand Total", 
                                  style: TextStyle(
                                    color: Color(0xffDA251C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                ),
                                Text(
                                  "RM ${grandTotal.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Color(0xffDA251C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Add Voucher Button
                            SizedBox(
                              width: double.infinity, // Makes the button stretch to full width
                              height: 45, // Sets a fixed height for the button
                              child: ElevatedButton(
                                onPressed: () {
                                  // Show a dialog or bottom sheet to enter a voucher
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      TextEditingController voucherController = TextEditingController();
                                      return AlertDialog(
                                        title: const Text("Enter Voucher Code"),
                                        content: TextField(
                                          controller: voucherController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter voucher code here",
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // Apply voucher
                                              final voucherCode = voucherController.text.trim();
                                              if (voucherCode.isNotEmpty) {
                                                cartProvider.applyVoucher(voucherCode); // Apply voucher
                                              }
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Apply"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffDA251C),
                                ),
                                child: const Text(
                                  "Add Voucher",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // Payment and Checkout Section 
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            // Navigate to Payment Method Page and get the result
                            final selectedPaymentMethod = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentMethodsPage(),
                              ),
                            );

                            // If a payment method is selected, update CartProvider
                            if (selectedPaymentMethod != null) {
                              Provider.of<CartProvider>(context, listen: false)
                                  .setPaymentMethod(selectedPaymentMethod);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            side: const BorderSide(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Consumer<CartProvider>(
                                builder: (context, cartProvider, child) {
                                  return Text(
                                    cartProvider.selectedPaymentMethod.isEmpty
                                        ? 'Select Payment Method'
                                        : cartProvider.selectedPaymentMethod, // Display selected payment method
                                    style: TextStyle(fontSize: 16),
                                  );
                                },
                              ),
                              const Spacer(), // Adds space to push the icon to the right
                              const Icon(Icons.arrow_forward_ios, size: 16), // Icon on the right
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Additional Request",
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ), 
            ),
          ),

          // "Order Now" button always fixed at the bottom
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // After the order is placed, navigate to the OrderSuccessPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderSuccessPage(),  // Navigate to OrderSuccessPage
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffDA251C),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Order Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatefulWidget {
  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  String? _selectedPaymentMethod;

  // List to track the expansion state of each ExpansionTile
  List<bool> _expansionStates = [false, false, false];

  // Method to handle selecting a payment method
  void _selectPaymentMethod(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
  }

  // Method to reset the expansion state of the tiles
  void _resetExpansionState() {
    setState(() {
      _expansionStates = [false, false, false]; // Collapse all tiles
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Methods",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context, _selectedPaymentMethod),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15.0),
              children: [
                // Meaotea Balance Section
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet, color: Colors.red),
                  title: const Text("Meaotea Balance (RM 0.00)"),
                  subtitle: const Text("Recommended", style: TextStyle(color: Colors.red)),
                  trailing: TextButton(
                    onPressed: () {
                      // Add top-up functionality here
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    child: const Text("+ Top Up"),
                  ),
                  onTap: () => _selectPaymentMethod("Meaotea Balance"),
                ),
                const Divider(),

                // Online Banking Section
                ExpansionTile(
                  initiallyExpanded: _expansionStates[0], // Set initial expansion state
                  leading: const Icon(Icons.online_prediction, color: Colors.red),
                  title: const Text("Online Banking"),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _expansionStates[0] = expanded; // Update the expansion state
                    });
                  },
                  children: [
                    ListTile(
                      title: const Text("Maybank2U"),
                      onTap: () => _selectPaymentMethod("Maybank2U"),
                    ),
                    ListTile(
                      title: const Text("CIMB Clicks"),
                      onTap: () => _selectPaymentMethod("CIMB Clicks"),
                    ),
                    ListTile(
                      title: const Text("RHB Now"),
                      onTap: () => _selectPaymentMethod("RHB Now"),
                    ),
                    ListTile(
                      title: const Text("Bank Rakyat"),
                      onTap: () => _selectPaymentMethod("Bank Rakyat"),
                    ),
                    ListTile(
                      title: const Text("Bank Islam"),
                      onTap: () => _selectPaymentMethod("Bank Islam"),
                    ),
                  ],
                ),

                // E-Wallet Section
                ExpansionTile(
                  initiallyExpanded: _expansionStates[1], // Set initial expansion state
                  leading: const Icon(Icons.account_balance_wallet_outlined, color: Colors.red),
                  title: const Text("E-Wallet"),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _expansionStates[1] = expanded; // Update the expansion state
                    });
                  },
                  children: [
                    ListTile(
                      title: const Text("GrabPay"),
                      onTap: () => _selectPaymentMethod("GrabPay"),
                    ),
                    ListTile(
                      title: const Text("Touch 'n Go"),
                      onTap: () => _selectPaymentMethod("Touch 'n Go"),
                    ),
                    ListTile(
                      title: const Text("Boost"),
                      onTap: () => _selectPaymentMethod("Boost"),
                    ),
                  ],
                ),

                // Credit Card Section
                ExpansionTile(
                  initiallyExpanded: _expansionStates[2], // Set initial expansion state
                  leading: const Icon(Icons.credit_card, color: Colors.red),
                  title: const Text("Credit Card"),
                  subtitle: const Text("Credit / Debit Card"),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _expansionStates[2] = expanded; // Update the expansion state
                    });
                  },
                  children: [
                    ListTile(
                      title: const Text("Add New Card"),
                      onTap: () => _selectPaymentMethod("Add New Card"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Payment Method Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: Text(
              _selectedPaymentMethod == null
                  ? 'No payment method selected.'
                  : 'Selected Payment Method: $_selectedPaymentMethod',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _selectedPaymentMethod == null ? Colors.grey : Colors.black,
              ),
            ),
          ),

          // Confirm Button
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _resetExpansionState(); // Collapse all tiles
                  Navigator.pop(context, _selectedPaymentMethod); // Pass selected payment method back to CartPage
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

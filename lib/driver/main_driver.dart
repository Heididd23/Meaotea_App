import 'package:flutter/material.dart';
import 'login_delivery.dart';

void main() {
  runApp((const MeaoteaDelivery()));
}

class MeaoteaDelivery extends StatelessWidget {
  const MeaoteaDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
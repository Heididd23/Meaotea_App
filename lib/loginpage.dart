import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'otp_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Login or Sign Up',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/cat_logo.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter your phone number',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  errorStyle: const TextStyle(color: Colors.red),
                ),
                initialCountryCode: 'MY',
                onChanged: (phone) {
                  setState(() {
                    phoneNumber = phone.completeNumber;
                  });
                },
                dropdownIcon:
                    const Icon(Icons.arrow_drop_down, color: Colors.grey),
                flagsButtonMargin: const EdgeInsets.only(left: 10),
                validator: (phone) {
                  if (phone == null || phone.number.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  String number =
                      phone.completeNumber.replaceAll(RegExp(r'[^0-9]'), '');
                  if (number.length != 11) {
                    return 'Phone number must be 9 digits';
                  }
                  if (!number.startsWith('60')) {
                    return 'Invalid country code';
                  }
                  return null;
                },
                disableLengthCheck: true,
              ),
              const SizedBox(height: 10),
              const Text(
                "We'll confirm your mobile number with a One-Time Password (OTP)",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey),
              ),
              const Spacer(),
              Text.rich(
                TextSpan(
                  text: 'By Logging in registering, you agree to our ',
                  style: TextStyle(color: Colors.grey[600]),
                  children: const [
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(text: ', '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(text: ', and '),
                    TextSpan(
                      text: 'Personal Data Protection Policy',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(
                          () => OTPVerificationPage(phoneNumber: phoneNumber));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: const Text(
                    'Request OTP',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet? ",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RegisterPage());
                    },
                    child: const Text(
                      'Sign up now',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

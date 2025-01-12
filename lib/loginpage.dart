import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'otp_page.dart';
import 'register_page.dart';
import 'admin/main_admin.dart';
import 'driver/main_driver.dart';
import 'landing_page.dart';  // Assuming you have a landing page.

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = '';
  bool isPhoneNumberValid = false; // Flag to track if phone number is valid

  // Assume user logout state for the example
  bool isLoggedOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (isLoggedOut) {
              // If logged out, clear the navigation stack and go to the landing page
              Get.offAll(() => const LandingPage());  // Assuming `LandingPage` is your login/landing page.
            } else {
              // If not logged out, go back to the previous page
              Navigator.pop(context);
            }
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
                  // Validate the phone number format as soon as it changes
                  _validatePhoneNumber(phone);
                },
                dropdownIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                flagsButtonMargin: const EdgeInsets.only(left: 10),
                validator: (phone) {
                  if (phone == null || phone.number.isEmpty) {
                    setState(() {
                      isPhoneNumberValid = false; // Invalid if no phone number
                    });
                    return 'Please enter a phone number';
                  }

                  // Validate the phone number based on criteria
                  return _validatePhoneNumber(phone);
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
                  onPressed: isPhoneNumberValid
                      ? () {
                          // Normalize the phone number by removing "+" and non-numeric characters
                          String normalizedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

                          // Check the normalized phone number for redirection
                          if (normalizedPhoneNumber == '6011111') {
                            // Redirect to driver page if phoneNumber is '11111' (with Malaysia country code)
                            Get.offAll(() => const MeaoteaDelivery());
                          } else if (normalizedPhoneNumber == '6022222') {
                            // Redirect to admin page if phoneNumber is '22222' (with Malaysia country code)
                            Get.offAll(() => const MyApp());
                          } else {
                            // Redirect to OTP page for other valid phone numbers
                            Get.to(() => OTPVerificationPage(phoneNumber: phoneNumber));
                          }
                        }
                      : null, // Disable button if phone number is invalid
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

  // Function to validate the phone number
  String? _validatePhoneNumber(phone) {
    if (phone == null || phone.number.isEmpty) {
      setState(() {
        isPhoneNumberValid = false; // Invalid if no phone number
      });
      return 'Please enter a phone number';
    }

    // Normalize the phone number by removing "+" and non-numeric characters
    String number = phone.completeNumber.replaceAll(RegExp(r'[^0-9]'), '');

    // Check if the phone number is one of the exceptions
    if (number == '6011111' || number == '6022222') {
      setState(() {
        isPhoneNumberValid = true; // Valid for exception numbers
      });
      return null; // Skip further validation
    }

    // Check if the phone number is in the correct length range
    if (number.length < 10 || number.length > 11) {
      setState(() {
        isPhoneNumberValid = false; // Invalid length
      });
      return 'Phone number must be 9 digits';
    }

    // Check if the phone number starts with the correct country code
    if (!number.startsWith('60')) {
      setState(() {
        isPhoneNumberValid = false; // Invalid country code
      });
      return 'Invalid country code';
    }

    setState(() {
      isPhoneNumberValid = true; // Valid phone number
    });
    return null; // No error
  }
}

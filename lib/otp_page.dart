import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'main.dart'; // Import the MainPage

class OTPVerificationPage extends StatefulWidget {
  final String phoneNumber;
  const OTPVerificationPage({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  Timer? _timer;
  int _timeLeft = 60;
  bool _otpComplete = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_timeLeft == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _timeLeft--;
        });
      }
    });
  }

  void _checkOtpCompletion() {
    // Check if all OTP fields are filled.
    setState(() {
      _otpComplete = _controllers.every((controller) => controller.text.isNotEmpty);
    });

    // If OTP is complete, simulate a delay (e.g., for OTP validation), then navigate.
    if (_otpComplete) {
      Future.delayed(const Duration(seconds: 2), () {
        // Navigate to MainPage and replace the current page (OTP verification) with MainPage.
        Get.offAll(() => const MainPage());  // Replaces the current page and prevents going back
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // No back button in the AppBar (by default, no 'leading' button)
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/cat_logo.png',
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your code',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "We've sent your 4-digit code to ${widget.phoneNumber}",
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  child: TextFormField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        if (index < 3) {
                          _focusNodes[index + 1].requestFocus();
                        }
                        // Check if OTP is complete after each entry.
                        _checkOtpCompletion();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: _timeLeft == 0
                  ? () {
                      setState(() {
                        _timeLeft = 30;
                        startTimer();
                      });
                    }
                  : null,
              child: Text(
                _timeLeft > 0 ? 'Resend code in $_timeLeft' : 'Resend code',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

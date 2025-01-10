import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart'; // For managing the system UI
import 'package:get/get.dart';
import 'home.dart';
import 'menu.dart';
import 'activity.dart';
import 'reward.dart';
import 'account.dart';
import 'cart_provider.dart';

void main() {
  // Ensure the status bar is styled as required
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MeaoteaApp(),
    ),
  );
}

class MeaoteaApp extends StatelessWidget {
  const MeaoteaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Meaotea',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Default to 'Home' tab

  // List of pages to navigate between
  final List<Widget> _pages = [
    Home(),
    Menu(),
    Activity(),
    Reward(),
    Account(),
  ];

  // Handle BottomNavigationBar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Prevent going back to the OTP/Login page
        return Future.value(false); // Return false to prevent the back action
      },
      child: Scaffold(
        body: _pages[_selectedIndex], // Display the selected page
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade300, // Bottom border color
                width: 1.0, // Border thickness
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Ensure labels are always shown
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/home.png',
                  width: 25.0,
                  height: 24.0,
                  color: _selectedIndex == 0 ? const Color(0xffDA251C) : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/menu.png',
                  width: 30.0,
                  height: 26.0,
                  color: _selectedIndex == 1 ? const Color(0xffDA251C) : Colors.grey,
                ),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/activity.png',
                  width: 23.0,
                  height: 23.0,
                  color: _selectedIndex == 2 ? const Color(0xffDA251C) : Colors.grey,
                ),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/reward.png',
                  width: 21.0,
                  height: 23.0,
                  color: _selectedIndex == 3 ? const Color(0xffDA251C) : Colors.grey,
                ),
                label: 'Reward',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/account.png',
                  width: 27.0,
                  height: 29.0,
                  color: _selectedIndex == 4 ? const Color(0xffDA251C) : Colors.grey,
                ),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xffDA251C),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

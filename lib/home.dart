import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:meaotea/menu.dart';

class BalanceOfferSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Balance Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Balance',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'RM 0.00',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          Container(
            width: 1.0,
            height: 50.0,
            color: Colors.grey[300],
          ),

          // Points Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Mpoints',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '50 pts',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> adImages = [
    'assets/ads.png',
    'assets/ads2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Hello, ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'SELab Army!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xffDA251C),
          centerTitle: false,
          titleSpacing: 10.0,
        ),
        body: Stack(
          children: [
            // Background Container
            Container(
              color: Color(0xffC4C4C4).withOpacity(0.3),
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              children: [
                // Advertisement Section with Swiper
                SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          adImages[index],
                          width: 320,
                          height: 300,
                        ),
                      );
                    },
                    itemCount: adImages.length,
                    autoplay: true,
                    autoplayDelay: 5000,
                    duration: 800,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.red,
                        size: 8.0,
                        activeSize: 10.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Balance/Offer Section
                BalanceOfferSection(),
                const SizedBox(height: 16),
                // Delivery and Pickup Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Delivery Button
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Menu screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Menu()),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/delivery.png',
                          width: 154,
                          height: 156,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Pickup Button
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/pickup.png',
                        width: 154,
                        height: 156,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
            // Footer Text
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Serve with various types of Bubble Tea, Coffee, Snacks & Cakes',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

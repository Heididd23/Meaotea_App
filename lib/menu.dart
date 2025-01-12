import 'package:flutter/material.dart';
import 'item_detail_page.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'cart_page.dart';


class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isDeliverySelected = true; // Default to Delivery
  String? deliveryAddress = "Deliver to?";
  var store = ['Meaotea (Kota Samarahan)', 'Meaotea (Serian)'];
  var firststore = 'Order from?';
  String selectedTimeOption = 'ASAP'; // Default to 'ASAP'

  // Selected menu category
  String selectedCategory = 'Popular';

  final Map<String, List<Map<String, dynamic>>> menuItems = {
    'Popular': [
      {
        'image': 'assets/menu/jumbo.png',
        'name': 'Jumbo Cheesy Sausage',
        'price': 'RM 9.40',
        'customizable': false,
      },
      {
        'image': 'assets/menu/matcha.png',
        'name': 'Matcha Smoothie',
        'price': 'RM 12.90',
        'customizable': true,
        'variations': [
          {'name': 'Medium', 'price':  12.90},
          {'name': 'Large', 'price':  14.90},
        ],
        'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
        'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/cheesy.png',
      'name': 'Cheesy Meaotea',
      'price': 'RM 9.90',
      'description': 'A rich, creamy blend of cheeses and spices, served with crispy, golden-brown tortilla chips.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level  
      },
      {
      'image': 'assets/menu/brown_sugar.png',
      'name': 'Brown Sugar Meaotea',
      'price': 'RM 9.90',
      'description': 'Indulge in the rich, caramelized flavors of brown sugar blended perfectly with refreshing tea for a delightful beverage experience.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/signature_coco.png',
      'name': 'Signature Coco',
      'price': 'RM 9.90',
      'description': 'A rich coconut-infused dish, featuring tender chicken and vibrant vegetables in a savory sauce.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/thai_greenTea.png',
      'name': 'Thai Green Tea Pearl',
      'price': 'RM 9.90',
      'description': 'Delightful Thai green tea infused with chewy tapioca pearls.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90}, 
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level 
      },
    ],
    'Pip Pop Series': [
      {
      'image': 'assets/menu/orange.png',
      'name': 'Orange Juice Soda',
      'price': 'RM 13.90',
      'description': 'Orange juice with a soda fizz.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  13.90},
        {'name': 'Large', 'price':  15.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/grape.png',
      'name': 'Pip Pop Grape Juice',
      'price': 'RM 13.90',
      'description': 'A refreshing blend of vibrant fruits and herbs, perfect for a revitalizing boost.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  13.90},
        {'name': 'Large', 'price':  15.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/mango.png',
      'name': 'Mango Juice',
      'price': 'RM 13.90',
      'description': 'Refreshing mango juice, bursting with tropical flavor and natural sweetness, perfect for any occasion.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  13.90},
        {'name': 'Large', 'price':  15.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/passion.png',
      'name': 'Passion Orange Juice',
      'price': 'RM 13.90',
      'description': 'Refreshing blend of sweet passion fruit and zesty orange, perfect for a tropical escape.',
      'customizable': false,
      },
      {
      'image': 'assets/menu/strawberry.png',
      'name': 'Pip Pop Strawberry Juice',
      'price': 'RM 13.90',
      'description': 'Refreshing strawberry juice bursting with flavor, perfect for a sunny day or a sweet treat.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  13.90},
        {'name': 'Large', 'price':  15.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/soda_green.png',
      'name': 'Soda Green Apple',
      'price': 'RM 12.90',
      'description': 'A crisp and zesty soda bursting with the tart taste of green apple.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  12.90},
        {'name': 'Large', 'price':  14.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/soda_lemon.png',
      'name': 'Soda Lemon Juice',
      'price': 'RM 13.90',
      'description': 'Soda with a tangy lemon flavor.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  13.90},
        {'name': 'Large', 'price':  15.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
    ],
    'Smoothies': [
      {
      'image': 'assets/menu/vanilla_oreo.png',
      'name': 'Vanilla Oreo Smoothie',
      'price': 'RM 12.90',
      'description': 'A creamy and delicious blend of vanilla ice cream and Oreo cookies, perfect for a sweet treat.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  12.90},
        {'name': 'Large', 'price':  14.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/matcha.png',
      'name': 'Matcha Smoothie',
      'price': 'RM 12.90',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  12.90},
        {'name': 'Large', 'price':  14.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/oreo_chocolate.png',
      'name': 'Oreo Chocolate Smoothie',
      'price': 'RM 12.90',
      'description': 'Indulge in a creamy, chocolatey smoothie with crunchy cookie bits.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  12.90},
        {'name': 'Large', 'price':  14.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/mango_smoothie.png',
      'name': 'Mango Smoothie',
      'price': 'RM 12.90',
      'description': 'Fresh mango blended with yogurt, milk & ice.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  12.90},
        {'name': 'Large', 'price':  14.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/vanilla.png',
      'name': 'Vanilla Smoothie',
      'price': 'RM 11.90',
      'description': 'A creamy and refreshing blend of vanilla, ice, and milk, perfect for a deliciously cool treat.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  11.90},
        {'name': 'Large', 'price':  13.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/peppermint.png',
      'name': 'Peppermint Smoothie',
      'price': 'RM 11.90',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  11.90},
        {'name': 'Large', 'price':  13.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/yam.png',
      'name': 'Yam Smoothie',
      'price': 'RM 12.90',
      'description': 'A creamy and nutritious blend of yam, milk, and flavorings, offering a delightful taste experience.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  12.90},
        {'name': 'Large', 'price':  14.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/strawberry_smoothie.png',
      'name': 'Strawberry Smoothie',
      'price': 'RM 13.90',
      'description': 'Creamy and refreshing blend of fresh strawberries and yogurt, offering a sweet, fruity flavor.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  13.90},
        {'name': 'Large', 'price':  15.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/cappuccino.png',
      'name': 'Cappuccino Smoothie',
      'price': 'RM 13.90',
      'description': 'A creamy blend of espresso, frothy milk, and banana, topped with a sprinkle of cocoa.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  13.90},
        {'name': 'Large', 'price':  15.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/chocolate.png',
      'name': 'Chocolate Smoothie',
      'price': ' RM 11.90',
      'description': 'Ice blended drink with chocolate and milk.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  11.90},
        {'name': 'Large', 'price':  13.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/passion_smoothie.png',
      'name': 'Passion Smoothie',
      'price': 'RM 10.90',
      'description': 'Smoothie made with passion fruit.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  10.90},
        {'name': 'Large', 'price':  11.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/mocha.png',
      'name': 'Mocha Smoothie',
      'price': 'RM 13.90',
      'description': 'Rich chocolate and coffee blend, creamy texture, topped with whipped cream and a hint of vanilla.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  13.90},
        {'name': 'Large', 'price':  15.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/honeydew.png',
      'name': 'Honeydew Smoothie',
      'price': 'RM 12.90',
      'description': 'Smoothie with honeydew melon, delivering a refreshing, creamy, and subtly sweet drink.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  12.90},
        {'name': 'Large', 'price':  14.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/oreo_yam.png',
      'name': 'Oreo Yam',
      'price': 'RM 13.90',
      'description': 'Dessert with Oreo and yam flavors.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  13.90},
        {'name': 'Large', 'price':  15.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/caramel.png',
      'name': 'Caramel Smoothie',
      'price': 'RM 16.90',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  16.90},
        {'name': 'Large', 'price':  18.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
    ],
    'Coffee': [
      {
      'image': 'assets/menu/americano_coffee.png',
      'name': 'Americano',
      'price': 'RM 11.90',
      'description': 'For red only: Coffee drink made with espresso and hot water, usually served black without milk or sugar.',
      'customizable': true,
      'variations': [
        {'name': 'Hot', 'price':  11.90},
        {'name': 'Iced', 'price':  12.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/latte_coffee.png',
      'name': 'Latte',
      'price': 'RM 13.90',
      'description': 'For ref only: Coffee made with espresso and steamed milk, often topped with frothed milk.',
      'customizable': true,
      'variations': [
        {'name': 'Hot', 'price':  13.90},
        {'name': 'Iced', 'price':  14.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/cappuccino_coffee.png',
      'name': 'Cappuccino',
      'price': 'RM 13.90',
      'description': 'For ref only: Foamy espresso-based coffee.',
      'customizable': true,
      'variations': [
        {'name': 'Hot', 'price':  13.90},
        {'name': 'Iced', 'price':  14.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/mocha_coffee.png',
      'name': 'Mocha',
      'price': 'RM 13.90',
      'description': 'Your favourite coffee-based chocolate drink.',
      'customizable': true,
      'variations': [
        {'name': 'Hot', 'price':  13.90},
        {'name': 'Iced', 'price':  14.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
    ],
    'Milk Tea': [
      {
      'image': 'assets/menu/signature_meaotea.png',
      'name': 'Signature Meaotea',
      'price': 'RM 8.90',
      'description': 'A delightful blend of premium teas infused with exotic flavors, creating a refreshing, aromatic experience.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  8.90},
        {'name': 'Large', 'price':  9.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/grass_jelly.png',
      'name': 'Grass Jelly Meaotea',
      'price': 'RM 8.90',
      'description': 'Refreshing grass jelly drink blended with sweet syrup and topped with creamy coconut milk.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  8.90},
        {'name': 'Large', 'price':  9.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/green_tea_grass.png',
      'name': 'Green Tea Grass Jelly Meaotea',
      'price': 'RM 8.90',
      'description': 'A refreshing and flavorful green tea drink with chewy grass jelly.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  8.90},
        {'name': 'Large', 'price':  9.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/cheesy.png',
      'name': 'Cheesy Meaotea',
      'price': 'RM 9.90',
      'description': 'A rich, creamy blend of cheeses and spices, served with crispy, golden-brown tortilla chips.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/cheesy_grass.png',
      'name': 'Cheesy Grass Jelly Meaotea',
      'price': 'RM 9.90',
      'description': 'Grass jelly tea blended with cheesy flavors.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/green_tea_meaotea.png',
      'name': 'Green Tea Meaotea',
      'price': 'RM 8.90',
      'description': 'A refreshing blend of green tea and aromatic herbs, perfect for a revitalizing experience.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  8.90},
        {'name': 'Large', 'price':  9.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/brown_sugar.png',
      'name': 'Brown Sugar Meaotea',
      'price': 'RM 9.90',
      'description': 'Indulge in the rich, caramelized flavors of brown sugar blended perfectly with refreshing tea for a delightful beverage experience.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/signature_coco.png',
      'name': 'Signature Coco',
      'price': 'RM 9.90',
      'description': 'A rich coconut-infused dish, featuring tender chicken and vibrant vegetables in a savory sauce.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/thai_milkTea_pearl.png',
      'name': 'Thai Milk Tea With Pearl',
      'price': 'RM 9.90',
      'description': 'Creamy Thai milk tea infused with aromatic spices, served with chewy tapioca pearls for a delightful treat.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/thai_milkTea_grass.png',
      'name': 'Thai Milk Tea With Grass Jelly',
      'price': 'RM 9.90',
      'description': 'Sweet Thai milk tea with chewy grass jelly.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/thai_greenTea.png',
      'name': 'Thai Green Tea Pearl',
      'price': 'RM 9.90',
      'description': 'Delightful Thai green tea infused with chewy tapioca pearls.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level
      },
      {
      'image': 'assets/menu/coffee_jelly.png',
      'name': 'Coffee Jelly With Signature',
      'price': 'RM 9.90',
      'description': 'Delightful coffee jelly topped with our signature cream, offering a refreshing and indulgent treat.',
      'customizable': true,
      'variations': [
        {'name': 'Medium', 'price':  9.90},
        {'name': 'Large', 'price':  10.90},
      ],
      'sugarLevels': ['None', 'Less', 'Normal', 'Extra'], // Add sugar levels
      'selectedSugarLevel': 'Normal', // Default sugar level  
      },
    ],
    'Snacks': [
      {
      'image': 'assets/menu/chesse_wedges.png',
      'name': 'Cheese Wedges',
      'price': 'RM 9.90',
      'description': 'Deep fried potato wedges with cheese on top.',
      },
      {
      'image': 'assets/menu/fries.png',
      'name': 'French Fries',
      'price': 'RM 7.90',
      'description': 'Golden, crispy and perfectly salted, our classic french fries are the perfect side for any meal.',
      },
      {
      'image': 'assets/menu/nuggets.png',
      'name': 'Nuggets',
      'price': 'RM 8.90',
      'description': 'Breaded chicken nuggets.',
      },
      {
      'image': 'assets/menu/popcorn.png',
      'name': 'Popcorn',
      'price': 'RM 8.90',
      'description': 'Fluffy, freshly popped kernels seasoned to perfection.',
      },
      {
      'image': 'assets/menu/tofu.png',
      'name': 'Cheesy Tofu',
      'price': 'RM 8.90',
      'description': 'Creamy, savory tofu infused with rich cheese flavors, perfect for a delightful plant-based experience.',
      },
      {
      'image': 'assets/menu/twister_fries.png',
      'name': 'Twister Fries',
      'price': 'RM 8.90',
      'description': 'Crispy, spiral-cut fries seasoned to perfection, offering a delightful crunch in every bite.',
      },
      {
      'image': 'assets/menu/crisscut.png',
      'name': 'Crisscut Fries',
      'price': 'RM 8.90',
      'description': 'Crispy, golden crisscut fries seasoned to perfection, served hot and ready for dipping delight.',
      },
      {
      'image': 'assets/menu/mccain.png',
      'name': 'Mccain Mozzarella',
      'price': 'RM 13.90',
      'description': 'Crispy, golden-brown bites filled with gooey mozzarella cheese, perfect for dipping and sharing.',
      },
      {
      'image': 'assets/menu/jumbo.png',
      'name': 'Jumbo Cheesy Sausage',
      'price': 'RM 9.40',
      },
    ],
    'Lunch': [
      {
      'image': 'assets/menu/spaghetti.png',
      'name': 'Spaghetti Bolognese',
      'price': 'RM 11.40',
      },
      {
      'image': 'assets/menu/crispy.png',
      'name': 'Crispy Chicken Spicy',
      'price': 'RM 10.40',
      },
      {
      'image': 'assets/menu/fish_chip.png',
      'name': 'Fish & Chip',
      'price': 'RM 14.40',
      },
      {
      'image': 'assets/menu/crispy_rice.png',
      'name': 'Crispy Spicy Chicken With Rice',
      'price': 'RM 10.50',
      },
      {
      'image': 'assets/menu/salad_chicken.png',
      'name': 'Salad Chicken Rice',
      'price': 'RM 10.50',
      },
      {
      'image': 'assets/menu/fried_wing.png',
      'name': 'Chicken Wing With Rice',
      'price': 'RM 10.50',
      },
      {
      'image': 'assets/menu/fried_chicken.png',
      'name': 'Fried Chicken With Rice',
      'price': 'RM 10.50',
      },
    ],
  };

  // Method to show Time Picker
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final String formattedTime = pickedTime.format(context); // Format time as string (e.g., '9:30 AM')
      
      // Update the selected time option and CartProvider
      setState(() {
        selectedTimeOption = formattedTime;
      });
      
      // Update the CartProvider with the selected time
      Provider.of<CartProvider>(context, listen: false)
          .setDeliveryTime(formattedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Container
            Container(
              color: const Color(0xffC4C4C4).withAlpha((0.3 * 255).toInt()),
              width: double.infinity,
              height: double.infinity,
            ),
            // Sidebar Menu
            Positioned(
              top: 100,
              left: 0,
              bottom: 70,
              child: Container(
                width: 95,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      _buildSidebarIcon('Popular', 'assets/popular.png', selectedCategory == 'Popular'),
                      const SizedBox(height: 18),
                      _buildSidebarIcon('Pip Pop Series', 'assets/pip pop.png', selectedCategory == 'Pip Pop Series'),
                      const SizedBox(height: 18),
                      _buildSidebarIcon('Smoothies', 'assets/smoothie.png', selectedCategory == 'Smoothies'),
                      const SizedBox(height: 18),
                      _buildSidebarIcon('Coffee', 'assets/coffee.png', selectedCategory == 'Coffee'),
                      const SizedBox(height: 18),
                      _buildSidebarIcon('Milk Tea', 'assets/milk tea.png', selectedCategory == 'Milk Tea'),
                      const SizedBox(height: 18),
                      _buildSidebarIcon('Snacks', 'assets/snacks.png', selectedCategory == 'Snacks'),
                      const SizedBox(height: 18),
                      _buildSidebarIcon('Lunch', 'assets/rice.png', selectedCategory == 'Lunch'),
                    ],
                  ),
                ),
              ),
            ),
            // Dynamic Header
            Positioned(
              top: 145, // Adjust the position as needed
              left: 120,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 50.0,
                child: Text(
                  selectedCategory, // Dynamically display the selected category
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffDA251C), // Header text color
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // Main Menu Grid
            Positioned(
              top: 170,
              left: 100,
              right: 0,
              bottom: 70,
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 5 / 6,
                ),
                itemCount: menuItems[selectedCategory]!.length,
                itemBuilder: (context, index) {
                  final item = menuItems[selectedCategory]![index];
                  return GestureDetector(
                    onTap: () {
                      // Extract price by removing "RM" and then parsing to double
                      String priceString = item['price']!;
                      double price = double.parse(priceString.replaceAll('RM', '').trim());
                      
                      // Navigate to ItemDetailPage with item details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailPage(
                            name: item['name']!,
                            image: item['image']!,
                            price: price, 
                            description: item['description'] ?? "",
                            customizable: item['customizable'] ?? false, // Make sure this is a boolean
                            variations: item['customizable'] == true ? item['variations'] ?? [] : [], // Pass an empty list if not customizable
                            sugarLevels: item['sugarLevels'] ?? [], // Pass the sugarLevels
                            selectedSugarLevel: item['selectedSugarLevel'] ?? 'Normal',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['image']!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['name']!,
                            style: const TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            item['price']!,
                            style: const TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 10,
              left: 19,
              right: 19,
              child: Container(
                width: 367,
                height: 28.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            // Toggle buttons in Positioned widget
            Positioned(
              top: 10,
              right: 19,
              child: Container(
                width: 168,
                height: 28.0,
                decoration: BoxDecoration(
                  color: Color(0xffDA251C).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Delivery Button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isDeliverySelected = true; // Set Delivery as selected
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: isDeliverySelected ? const Color(0xffDA251C) : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Delivery',
                            style: TextStyle(
                              color: isDeliverySelected ? Colors.white : Colors.black,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Pickup Button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isDeliverySelected = false; // Set Pickup as selected
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: !isDeliverySelected ? const Color(0xffDA251C) : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Pickup',
                            style: TextStyle(
                              color: !isDeliverySelected ? Colors.white : Colors.black,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 13,
              left: 25,
              child: Image.asset(
                'assets/address.png',
                width: 25,
                height: 23,
              ),
            ),
            Positioned(
              top: 15.5,
              left: 55,
              child: GestureDetector(
                onTap: () async {
                  // Show a dialog or bottom sheet to get the address
                  final result = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      String address = "";
                      return AlertDialog(
                        title: Text('Deliver to?'),
                        content: TextField(
                          onChanged: (value) {
                            address = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your address',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(address); // Return the entered address
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  if (result != null && result.isNotEmpty) {
                    // Update the delivery address in the CartProvider
                    cartProvider.deliveryAddress = result; // Update the provider
                  }
                },
                child: Text(
                  cartProvider.deliveryAddress ?? 'Deliver to?', // Display address from CartProvider
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 51,
              left: 27,
              child: Image.asset(
                'assets/store.png',
                width: 20,
                height: 20,
              ),
            ),
            Positioned(
              top: 35,
              left: 55,
              child: Row(
                children: [
                  // Dropdown Button for Store selection
                  DropdownButton<String>(
                    value: firststore == 'Order from?' ? null : firststore,
                    hint: const Text(
                      'Order from?',
                      style: TextStyle(fontSize: 11.0),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        firststore = newValue!;
                      });
                    },
                    items: store.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: const TextStyle(fontSize: 11.0),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              right: 100,
              child: Image.asset(
                'assets/clock.png',
                width: 20,
                height: 20,
              ),
            ),
            // Time Picker or 'ASAP' Section
            Positioned(
              top: 35,
              right: 17,
              child: Column(
                children: [
                  // Dropdown for selecting time or 'ASAP'
                  DropdownButton<String>(
                    value: selectedTimeOption, // Use selectedTimeOption to track value
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue == 'Pick Time') {
                          _selectTime(context); // Show time picker when 'Pick Time' is selected
                        } else {
                          selectedTimeOption = newValue!; // Update selected time
                          // Update CartProvider with the selected time (if it's 'ASAP' or a custom time)
                          if (selectedTimeOption != 'Pick Time') {
                            Provider.of<CartProvider>(context, listen: false)
                                .setDeliveryTime(selectedTimeOption);
                          }
                        }
                      });
                    },
                    items: <String>['ASAP', 'Pick Time']
                        .map((String option) {
                      return DropdownMenuItem<String>(
                        value: option, // Keep 'ASAP' and 'Pick Time' as valid options
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 11.0, // Adjust the font size here
                          ),
                        ),
                      );
                    }).toList() +
                    // Dynamically add the selected time to the list after picking a time
                    (selectedTimeOption != 'ASAP' && selectedTimeOption != 'Pick Time'
                        ? [
                            DropdownMenuItem<String>(
                              value: selectedTimeOption, // Set value to the selected time
                              child: Text(
                                selectedTimeOption,
                                style: TextStyle(
                                  fontSize: 11.0, // Adjust the font size for selected time
                                ),
                              ),
                            ),
                          ]
                        : []),
                  ),
                ],
              ),
            ),
            // Promotion Bar
            Positioned(
              top: 82,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: const Color(0xffDA251C).withAlpha((0.9 * 255).toInt()),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '11.11 Promotion: RM11.11 for 2 Cup!!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: 132, // Adjust this position according to where you want the vertical line
              left: 85, // You can set this to the desired X-position where you want the line
              bottom: 70, // Adjust the bottom value to make the divider the desired height
              child: VerticalDivider(
                color: Color(0xffC4C4C4),
                thickness: 1,
              ),
            ),
            // Bottom Container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 70.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 14,
              left: 260,
              right: 36,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(), // Navigate to the CartPage
                    ),
                  );
                },
                child: Container(
                  width: 20,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: const Color(0xffDA251C),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'View Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 35,
              left: 28,
              child: Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return Text(
                    '${cart.totalItems} items',
                    style: const TextStyle(
                      color: Color(0xffDA251C),
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10,
              left: 28,
              child: Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return Text(
                    'RM ${cart.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to build sidebar icons
  Widget _buildSidebarIcon(String label, String assetPath, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Image.asset(
              assetPath,
              width: 30,
              height: 30,
              color: isSelected ? const Color(0xffDA251C) : Colors.grey,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isSelected ? const Color(0xffDA251C) : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

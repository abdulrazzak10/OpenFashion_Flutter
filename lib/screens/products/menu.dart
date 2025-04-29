// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openfashion/screens/products/category.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  void p_category() {
    // Define what p_category does here
    print("Navigating to p_category screen");
    // Example navigation (uncomment and replace with your actual screen)
    // Navigator.push(context, MaterialPageRoute(builder: (context) => PCategoryScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20),
            MenuItem(
              'New',
              Icons.new_releases,
              onTap: p_category,
            ),
            MenuItem(
              'Apparel',
              Icons.shopping_cart,
              onTap: p_category,
            ),
            MenuItem(
              'Bag',
              Icons.shopping_bag,
              onTap: p_category,
            ),
            MenuItem(
              'Shoes',
              Icons.shop,
              onTap: p_category,
            ),
            MenuItem(
              'Beauty',
              Icons.face,
              onTap: p_category,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 120),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Center(child: SvgPicture.asset('assets/menu_logo.svg')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;

  // Add a function callback
  final VoidCallback onTap;

  const MenuItem(this.text, this.icon, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
         onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => p_category()),
          );
        }, // Handle click event here
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 10),
            Text(text,
                style: TextStyle(
                    color: Colors.black, fontSize: 16, fontFamily: 'TenorSans')),
            Spacer(),
            Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

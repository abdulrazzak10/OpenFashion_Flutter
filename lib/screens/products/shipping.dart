// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:openfashion/screens/products/cart.dart';
import 'package:openfashion/screens/products/payment.dart';
import 'package:openfashion/widget/bottombar.dart';
import 'package:openfashion/widget/enum.dart';

class Shipping extends StatefulWidget {
  const Shipping({super.key, required this.title});

  final String title;

  @override
  State<Shipping> createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
   SelectedTab _selectedTab = SelectedTab.cart;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = SelectedTab.values[index];
    });
  }

  void _navigateToHome() {
    // If using named routes, replace '/home' with the correct route name.
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _navigateTocat() {
    // If using named routes, replace '/home' with the correct route name.
    Navigator.pushReplacementNamed(context, '/cat');
  }

  void _navigateTofav() {
    // If using named routes, replace '/home' with the correct route name.
    Navigator.pushReplacementNamed(context, '/fav');
  }

  void _navigateTocart() {
    // If using named routes, replace '/home' with the correct route name.
    Navigator.pushReplacementNamed(context, '/cart');
  }
  
  void _navigateToaccountinfo() {
    // If using named routes, replace '/home' with the correct route name.
    Navigator.pushReplacementNamed(context, '/account');
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
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CartScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: SvgPicture.asset(
            'assets/openfashion_logo.svg',
            height: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Image widget added below the AppBar
            SvgPicture.asset(
              'assets/shipping.svg', // Replace with your image path
              fit: BoxFit.cover, // Cover the space
            ),

            // Space between the image and text fields
            const SizedBox(height: 10),

            // Form fields below the image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'First name',
                          ),
                          style: const TextStyle(
                            fontFamily: 'TenorSans', // Apply TenorSans font
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Last name',
                          ),
                          style: const TextStyle(
                            fontFamily: 'TenorSans', // Apply TenorSans font
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16), // Space between text fields
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Address',
                    ),
                    style: const TextStyle(
                      fontFamily: 'TenorSans', // Apply TenorSans font
                    ),
                  ),
                  const SizedBox(height: 16), // Space between text fields
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'City',
                    ),
                    style: const TextStyle(
                      fontFamily: 'TenorSans', // Apply TenorSans font
                    ),
                  ),
                  const SizedBox(height: 16), // Space between text fields
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'State',
                          ),
                          style: const TextStyle(
                            fontFamily: 'TenorSans', // Apply TenorSans font
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'ZIP code',
                          ),
                          style: const TextStyle(
                            fontFamily: 'TenorSans', // Apply TenorSans font
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16), // Space between text fields
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Phone number',
                    ),
                    style: const TextStyle(
                      fontFamily: 'TenorSans', // Apply TenorSans font
                    ),
                  ),
                  // SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const Payment(
                              title: 'hello',
                            ),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'ADD',
                        style: TextStyle(
                          fontFamily: 'TenorSans',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )),
                                const SizedBox(height: 40),

                ],
              ),
            ),
          ],
        ),
      ),
            bottomNavigationBar: BottomNavBar(
        selectedTab: _selectedTab,
        onTabChanged: (index) => _handleIndexChanged(index),
        onNavigateToHome: _navigateToHome,
        onNavigateTomenu: _navigateTocat, // Pass the navigation callback
        onNavigateTofav: _navigateTofav,
        onNavigateTocart: _navigateTocart,
        onnavigateToaccountinfo: _navigateToaccountinfo, // Pass the navigation callback
      ),
    );
  }
}

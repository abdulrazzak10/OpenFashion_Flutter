// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:openfashion/screens/products/finalcheckout.dart';
import 'package:openfashion/screens/products/shipping.dart';
import 'package:openfashion/widget/bottombar.dart';
import 'package:openfashion/widget/enum.dart';

class Payment extends StatefulWidget {
  const Payment({super.key, required this.title});

  final String title;

  @override
  State<Payment> createState() => _ShippingState();
}

class _ShippingState extends State<Payment> {
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
                    Shipping(
                  title: 'hi',
                ),
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
              'assets/addcard.svg', // Replace with your image path
              fit: BoxFit.cover, // Cover the space
            ),
            const SizedBox(height: 10),

            Image.asset(
              'assets/atmcard.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // Space between the image and text fields
            const SizedBox(height: 6),

            // Form fields below the image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  //  Image.asset('assets/atmcard.png',
                  //    width: double.infinity,
                  //     fit: BoxFit.cover,),
                  const SizedBox(height: 1), // Space between text fields
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Name on Card',
                    ),
                    style: const TextStyle(
                      fontFamily: 'TenorSans', // Apply TenorSans font
                    ),
                  ),
                  const SizedBox(height: 16), // Space between text fields
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Card Number',
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
                            labelText: 'Exp Month',
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
                            labelText: 'Exp date',
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
                      labelText: 'CCV',
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
                                      Finalcheckout(),
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
                          'ADD CARD',
                          style: TextStyle(
                            fontFamily: 'TenorSans',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      )),
                                        SizedBox(height: 180),

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

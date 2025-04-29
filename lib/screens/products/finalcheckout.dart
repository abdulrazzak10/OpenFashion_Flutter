// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:openfashion/screens/products/payment.dart';
import 'package:openfashion/widget/bottombar.dart';
import 'package:openfashion/widget/cartwidget.dart';
import 'package:openfashion/widget/enum.dart';

class Finalcheckout extends StatefulWidget {
  const Finalcheckout({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<Finalcheckout> {
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

void _showOrderPlacedPopup() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          _navigateToHome();
        },
        child: Dialog(
          child: Image.asset(
            'assets/orderconfirmed.png', // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);

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
                    const Payment(
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
      body: cartState.cartItems.isEmpty
          ? const Center(
              child: Text(
              'No items in cart !',
              style: TextStyle(
                fontFamily: 'TenorSans',
                fontSize: 25,
              ),
            ))
          : Column(
              children: [
                SizedBox(height: 20),
                SvgPicture.asset('assets/checkout.svg'),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartState.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartState.cartItems[index];
                      return Dismissible(
                        key: ValueKey(item.imagePath +
                            item.title), // Use a combination of properties
                        background: Container(
                          color: Colors.red, // Background color for swipe
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            cartState
                                .removeFromCart(item); // Remove item from cart
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Row(
                            children: [
                              // Image widget with increased size
                              SizedBox(
                                width: 100, // Increased width
                                height: 100, // Increased height
                                child: Image.asset(
                                  item.imagePath, // Display product image
                                  fit: BoxFit.fill, // No cropping
                                ),
                              ),
                              SizedBox(
                                  width: 16), // Space between image and text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          '\$${item.price}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal:',
                        style: TextStyle(fontSize: 18, fontFamily: 'TenorSans'),
                      ),
                      Text(
                        '\$${cartState.totalPrice}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                    onPressed: () {
           _showOrderPlacedPopup();
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
                        'PLACE ORDER',
                        style: TextStyle(
                          fontFamily: 'TenorSans',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 90,
                )
              ],
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

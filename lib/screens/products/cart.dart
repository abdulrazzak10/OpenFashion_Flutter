import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:openfashion/screens/home.dart';
import 'package:openfashion/screens/products/shipping.dart';
import 'package:openfashion/widget/bottombar.dart';
import 'package:openfashion/widget/cartwidget.dart';
import 'package:openfashion/widget/enum.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  SelectedTab _selectedTab = SelectedTab.cart;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = SelectedTab.values[index];
    });
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _navigateTocat() {
    Navigator.pushReplacementNamed(context, '/cat');
  }

  void _navigateTofav() {
    Navigator.pushReplacementNamed(context, '/fav');
  }

  void _navigateTocart() {
    Navigator.pushReplacementNamed(context, '/cart');
  }
  
  void _navigateToaccountinfo() {
    // If using named routes, replace '/home' with the correct route name.
    Navigator.pushReplacementNamed(context, '/account');
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
                    const Home(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
              ),
            )
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
                        key: ValueKey(item.imagePath + item.title),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          cartState.removeFromCart(item);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                  item.imagePath,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 16),
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
                                        IconButton(
                                          icon: Icon(Icons.remove_circle),
                                          onPressed: () {
                                            cartState.decrementQuantity(item);
                                          },
                                        ),
                                        Text('${item.quantity}'),
                                        IconButton(
                                          icon: Icon(Icons.add_circle),
                                          onPressed: () {
                                            cartState.incrementQuantity(item);
                                          },
                                        ),
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
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '\$${cartState.totalPrice}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const Shipping(title: 'hello'),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'CHECK OUT',
                      style: TextStyle(
                        fontFamily: 'TenorSans',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 90),
              ],
            ),
      bottomNavigationBar: BottomNavBar(
        selectedTab: _selectedTab,
        onTabChanged: (index) => _handleIndexChanged(index),
        onNavigateToHome: _navigateToHome,
        onNavigateTomenu: _navigateTocat,
        onNavigateTofav: _navigateTofav,
        onNavigateTocart: _navigateTocart,
        onnavigateToaccountinfo: _navigateToaccountinfo,
      ),
    );
  }
}

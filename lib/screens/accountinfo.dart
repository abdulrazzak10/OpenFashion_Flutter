import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openfashion/screens/auth/login.dart';
import 'package:openfashion/screens/products/menu.dart';
import 'package:openfashion/widget/bottombar.dart';
import 'package:openfashion/widget/enum.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({super.key});

  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  SelectedTab _selectedTab = SelectedTab.profile;

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
      extendBody: true, // Make body extend behind the bottom navigation bar
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    MyMenu(), // Ensure you have the MyMenu widget
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
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: SvgPicture.asset(
            'assets/openfashion_logo.svg', // Replace with your SVG logo path
            height: 40, // Adjust the height to fit your logo
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
      body: Column(
        children: [
          // Horizontal Buttons
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildHorizontalButton(
                  context,
                  icon: Icons.person,
                  label: 'Details',
                  routeName: '/account-details',
                ),
                _buildHorizontalButton(
                  context,
                  icon: Icons.shopping_bag,
                  label: 'Orders',
                  routeName: '/your-orders',
                ),
                _buildHorizontalButton(
                  context,
                  icon: Icons.star,
                  label: 'Reviews',
                  routeName: '/reviews', // Ensure you have this route
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(1.0),
            child: SvgPicture.asset(
                'assets/accountinfo.svg'), // Replace with your SVG image path
          ),

          const SizedBox(
            height: 40,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height *
                0.3, // Adjust based on screen height
            left: MediaQuery.of(context).size.width *
                0.25, // Center the button horizontally
            right: MediaQuery.of(context).size.width *
                0.25, // Center the button horizontally
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Login(),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Transparent background
                side: BorderSide(
                  color: Colors.grey,
                  width: 1, // Border color and width
                ),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height *
                      0.015, // Smaller height
                  horizontal:
                      MediaQuery.of(context).size.width * 0.3, // Smaller width
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12), // Border radius for the button
                ),
                elevation: 0, // Remove elevation
                shadowColor: Colors.transparent, // Remove any shadow
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width *
                        0.04, // Smaller font size
                    color: Colors.black,
                    fontFamily: 'TenorSans' // Text color
                    ),
              ),
            ),
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
        onnavigateToaccountinfo:
            _navigateToaccountinfo, // Pass the navigation callback
      ),
    );
  }

  Widget _buildHorizontalButton(BuildContext context,
      {required IconData icon,
      required String label,
      required String routeName}) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Colors.white, // Replace with your desired background color
        foregroundColor: Colors.black, // Replace with your desired text color
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(color: Colors.black), // Border color
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}

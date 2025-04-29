// lib/screens/home.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openfashion/screens/products/category.dart';
import 'package:openfashion/screens/products/menu.dart';
import 'package:openfashion/widget/bottombar.dart';
import 'package:openfashion/widget/enum.dart';
import 'package:openfashion/widget/product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SelectedTab _selectedTab = SelectedTab.home;

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
        backgroundColor: const Color(0xffE7EAEF),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    MyMenu(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Image Section
            Stack(
              children: [
                Image.asset(
                  'assets/Banner_pn.png', // Replace with your hero image path
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            // New Arrivals Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/Title.svg',
                      height:
                          50, // Adjust the height to match the original text size
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Manually added products in a vertical layout
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: ProductCard(
                          imagePath: 'assets/product1.png',
                          title: '21WN reversible angora cardigan',
                          price: '29.99', id: '',
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: ProductCard(
                          imagePath: 'assets/product2.png',
                          title: '21WN reversible angora cardigan',
                          price: '39.99', id: '2',
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: ProductCard(
                          imagePath: 'assets/product3.png',
                          title: '21WN reversible angora cardigan',
                          price: '49.99', id: '3',
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: ProductCard(
                          imagePath: 'assets/product4.png',
                          title: 'Oblong bag',
                          price: '59.99', id: '4',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Button and other sections that need to be responsive
                  Center(
                     child: Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => p_category()),
          );
        },
        child: SvgPicture.asset(
          'assets/Button.svg',
          width: MediaQuery.of(context).size.width * 0.8,
          fit: BoxFit.cover,
        ),
      ),
      // Add more widgets here if needed
    ],
  ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SvgPicture.asset(
                      'assets/Brand.svg',
                      width: MediaQuery.of(context).size.width *
                          0.8, // Adjust width
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            // Responsive Image Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Image.asset(
                'assets/Collection.png',
                fit: BoxFit.cover,
                width: double.infinity, // Ensure the image spans the width
              ),
            ),
            const SizedBox(height: 20),
            // Horizontal scroll products section
            const SizedBox(height: 20),
            Center(
              child: SvgPicture.asset(
                'assets/foryou.svg',
                width: MediaQuery.of(context).size.width * 0.8, // Adjust width
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 410, // Reduce height to avoid overflow
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.6, // Dynamically adjust width
                        child: ProductCard(
                          imagePath: 'assets/product1.png',
                          title: '21WN reversible angora cardigan',
                          price: '29.99', id: '1',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ProductCard(
                          imagePath: 'assets/product2.png',
                          title: '21WN reversible angora cardigan',
                          price: '39.99', id: '2',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ProductCard(
                          imagePath: 'assets/product3.png',
                          title: '21WN reversible angora cardigan',
                          price: '49.99', id: '3',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // End Home Image
            Center(
              child: SvgPicture.asset(
                'assets/endhome.svg',
                width: MediaQuery.of(context).size.width * 1, // Adjust width
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


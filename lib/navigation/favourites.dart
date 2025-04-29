import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:openfashion/screens/home.dart';
import 'package:openfashion/widget/bottombar.dart';
import 'package:openfashion/widget/favourites_manager.dart';
import 'package:openfashion/widget/enum.dart';

class ProductFavorite extends StatefulWidget {
  const ProductFavorite({super.key});

  @override
  _ProductFavoriteState createState() => _ProductFavoriteState();
}

class _ProductFavoriteState extends State<ProductFavorite> {
  SelectedTab _selectedTab = SelectedTab.favourite;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = SelectedTab.values[2];
    });
  }

  void _navigateTomenu() {
    // If using named routes, replace '/home' with the correct route name.
    Navigator.pushReplacementNamed(context, '/menu');
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(
        context, '/home'); // Adjust route name as needed
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
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => Home(),
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
            Icons.arrow_back,
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
      
      body: FavouritesManager.favouriteProducts.isEmpty
          ? const Center(child: Text('No favorites yet.'))
          : ListView.builder(
            
              itemCount: FavouritesManager.favouriteProducts.length,
              itemBuilder: (context, index) {
                final product = FavouritesManager.favouriteProducts[index];
                return ListTile(
                  leading: Image.asset(product.imagePath),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        FavouritesManager.favouriteProducts.remove(product);
                      });
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavBar(
        selectedTab: _selectedTab,
        onTabChanged: (index) => _handleIndexChanged(index),
        onNavigateToHome: _navigateToHome,
        onNavigateTomenu: _navigateTomenu,
        onNavigateTofav: _navigateTofav,
        onNavigateTocart: _navigateTocart,
        onnavigateToaccountinfo: _navigateToaccountinfo,
      ),
    );
  }
}

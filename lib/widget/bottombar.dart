import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart'; // Assuming you are using the Iconly package
import 'package:openfashion/navigation/favourites.dart';
import 'package:openfashion/screens/accountinfo.dart';
import 'package:openfashion/screens/home.dart'; // Import Profile Screen
import 'package:openfashion/screens/products/cart.dart';
import 'package:openfashion/screens/products/category.dart';
import 'package:openfashion/widget/enum.dart';

class BottomNavBar extends StatelessWidget {
  final SelectedTab selectedTab;
  final Function(int) onTabChanged;

  const BottomNavBar({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
    required void Function() onNavigateToHome,
    required void Function() onNavigateTomenu,
    required void Function() onNavigateTofav,
    required void Function() onNavigateTocart,
    required void Function() onnavigateToaccountinfo,

  });

  @override
  Widget build(BuildContext context) {
    return CrystalNavigationBar(
      currentIndex: SelectedTab.values.indexOf(selectedTab),
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.transparent, // Make background transparent
      onTap: (index) {
        onTabChanged(index);
        switch (SelectedTab.values[index]) {
          case SelectedTab.home:
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Home(), // Replace with your HomeScreen widget
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
            break;
          case SelectedTab.favourite:
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ProductFavorite(), // Replace with your FavouritesScreen widget
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
            break;
          case SelectedTab.category:
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    p_category(), // Replace with your MenuScreen widget
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );

          case SelectedTab.cart:
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CartScreen(), // Replace with your MenuScreen widget
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          // TODO: Handle this case.
          case SelectedTab.profile:
          Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    AccountInfoPage(), // Replace with your MenuScreen widget
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          // TODO: Handle this case.
        }
      },
      items: [
        CrystalNavigationBarItem(
          icon: IconlyBold.home,
          unselectedIcon: IconlyLight.home,
          selectedColor: Colors.blue,
        ),
        CrystalNavigationBarItem(
          icon: IconlyBold.heart,
          unselectedIcon: IconlyLight.heart,
          selectedColor: Colors.red,
        ),
        CrystalNavigationBarItem(
          icon: IconlyBold.category,
          unselectedIcon: IconlyLight.plus,
          selectedColor: const Color.fromARGB(255, 215, 66, 109),
        ),
        CrystalNavigationBarItem(
          icon: IconlyBold.buy,
          unselectedIcon: IconlyLight.buy,
          selectedColor: Colors.green,
        ),
        CrystalNavigationBarItem(
          icon: IconlyBold.user_2,
          unselectedIcon: IconlyLight.user,
          selectedColor: const Color.fromARGB(255, 125, 244, 121),
        ),
      ],
    );
  }
}

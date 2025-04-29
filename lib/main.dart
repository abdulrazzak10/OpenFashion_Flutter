// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:openfashion/navigation/favourites.dart';
import 'package:openfashion/screens/accountinfo.dart';
import 'package:openfashion/screens/home.dart';
import 'package:openfashion/screens/products/cart.dart';
import 'package:openfashion/screens/products/category.dart';
import 'package:openfashion/screens/splash.dart';
import 'package:openfashion/widget/cartwidget.dart'; // Import the cart state

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartState()), // Provide CartState here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const splashscreen(),
        // initialRoute: '/home',
        routes: {
          '/home': (context) => Home(),
          '/cat': (context) => p_category(),
          '/fav': (context) => ProductFavorite(),
          '/cart': (context) => CartScreen(),
          '/account':(context)=> AccountInfoPage(),
        },
      ),
    );
  }
}

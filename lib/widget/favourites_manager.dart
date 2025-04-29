import 'package:flutter/material.dart';

class FavouritesManager {
  static final List<Product> _favoriteProducts = [];

  static List<Product> get favouriteProducts => _favoriteProducts;

  static bool contains(String title) {
    return _favoriteProducts.any((product) => product.title == title);
  }

  static void addProduct(Product product) {
    if (!_favoriteProducts.contains(product)) {
      _favoriteProducts.add(product);
    }
  }

  static void removeProduct(Product product) {
    _favoriteProducts.remove(product);
  }
}

class Product {
  final String title;
  final String imagePath;
  final String price;
  final Widget description;

  Product({
    required this.title,
    required this.imagePath,
    required this.price,
    required this.description, required String id,
  });
}

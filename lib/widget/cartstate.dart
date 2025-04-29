// cart_state.dart
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class CartItem {
  final String id; // Ensure this is unique for each item
  final String title;
  final String imagePath;
  final double price;
  int quantity; // Add quantity here

  CartItem({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.price,
    this.quantity = 1, // Default quantity is 1
  });
}

class CartState with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  double get totalPrice => _cartItems.fold(
        0.0,
        (previousValue, item) => previousValue + item.price * item.quantity,
      );

  void addToCart(CartItem item) {
    final existingItemIndex =
        _cartItems.indexWhere((cartItem) => cartItem.id == item.id);

    if (existingItemIndex != -1) {
      // Item already exists, update quantity
      _cartItems[existingItemIndex].quantity += item.quantity;
    } else {
      // Item does not exist, add new item
      _cartItems.add(item);
    }

    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.removeWhere((cartItem) => cartItem.id == item.id);
    notifyListeners();
  }

  void incrementQuantity(CartItem item) {
    final existingItemIndex =
        _cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(CartItem item) {
    final existingItemIndex =
        _cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (existingItemIndex != -1 && _cartItems[existingItemIndex].quantity > 1) {
      _cartItems[existingItemIndex].quantity--;
      notifyListeners();
    }
  }
}

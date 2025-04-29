import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 12.0 : 8.0,
      height: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.cyan : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

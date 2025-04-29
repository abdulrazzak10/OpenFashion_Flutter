import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openfashion/widget/ProductDetailPage.dart'; // Correct import
class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String id; // Add ID field

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.id, // Initialize ID
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              imagePath: imagePath,
              title: title,
              price: price,
              description: SvgPicture.asset('assets/p_detials.svg'),
              id: id, // Pass the ID
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'TenorSans',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      fontFamily: 'TenorSans',
                      fontSize: 17,
                      color: Color(0xffDD8560),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

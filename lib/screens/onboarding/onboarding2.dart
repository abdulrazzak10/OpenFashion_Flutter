// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:openfashion/screens/onboarding/onboarding3.dart';
import 'package:openfashion/widget/dot.dart';
class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return SafeArea(
            child: Stack(
              children: [
                // Background Container with Image
                Positioned(
                  top: screenHeight * 0.05, // Adjust based on screen height
                  left: (screenWidth - (screenWidth * 0.8)) /
                      2, // Center horizontally
                  child: Container(
                    width: screenWidth * 0.8, // Responsive width
                    height: screenHeight * 0.5, // Responsive height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the border radius as needed
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/on2.png'), // Replace with your image path
                        // Adjust as needed
                      ),
                    ),
                    // child: Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(16.0), // Padding for the arrow icon
                    //     child: Icon(
                    //       Icons.arrow_back, // Replace with your arrow icon
                    //       color: Colors.white,
                    //       size: 30,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),

                // Text Below the Image
                Positioned(
                  top: screenHeight * 0.55, // Adjust based on screen height
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Unlock exclusive offers and discounts', // Your text here
                        style: TextStyle(
                          fontFamily: 'NerkoOne',
                          color: Colors.black,
                          fontSize: screenWidth * 0.07, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: screenHeight *
                              0.02), // Space between text elements
                      Text(
                        'Get access to limited-time deals and special promotions available only to our valued customers.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.03, // Responsive font size
                        ),
                      ),
                    ],
                  ),
                ),

                // Next Button
                Positioned(
                  bottom: 63, // Adjust based on screen height
                  left: 20,
                  right: 20,
                  child: ElevatedButton(
                     onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Onboarding3(),
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
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.1,
                      ), // Responsive padding
                      minimumSize: Size(double.infinity,
                          screenHeight * 0.07), // Minimum width and height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12), // Border radius for the button
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05, // Responsive font size
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Progress Indicator
                Positioned(
                  bottom: screenHeight * 0.05, // Adjust based on screen height
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Dot(isActive: false), // Change based on the current step
                      Dot(isActive: true),
                      Dot(isActive: false),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

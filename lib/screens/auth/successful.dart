import 'package:flutter/material.dart';
import 'package:openfashion/screens/home.dart';

class SuccessfulPage extends StatelessWidget {
  const SuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/successfull.png',
              width: 300,
              height: 300,
            )),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Home(),
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
                      vertical: MediaQuery.of(context).size.height * 0.01,
                      horizontal: MediaQuery.of(context).size.width * 0.08,
                    ),
                     minimumSize: Size(MediaQuery.of(context).size.width * 0.7,
                        MediaQuery.of(context).size.height * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Start Shopping',
                    style: TextStyle(
                      fontFamily: 'TenorSans',
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

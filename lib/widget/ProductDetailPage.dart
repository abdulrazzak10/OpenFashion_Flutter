// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:openfashion/screens/home.dart';
import 'package:openfashion/widget/bottombar.dart';
import 'package:openfashion/widget/cartwidget.dart';
import 'package:openfashion/widget/enum.dart';
import 'package:openfashion/widget/favourites_manager.dart';
import 'package:openfashion/widget/product_card.dart';

class ProductDetailPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;
  final Widget description;
  final String id; // Add ID field

  const ProductDetailPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
    required this.id, // Initialize ID
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  SelectedTab _selectedTab = SelectedTab.category;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = FavouritesManager.contains(widget.title);
  }

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = SelectedTab.values[index];
    });
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _navigateTomenu() {
    Navigator.pushReplacementNamed(context, '/menu');
  }

  void _navigateTofav() {
    Navigator.pushReplacementNamed(context, '/fav');
  }

  void _navigateTocart() {
    Navigator.pushReplacementNamed(context, '/cart');
  }
  
  void _navigateToaccountinfo() {
    // If using named routes, replace '/home' with the correct route name.
    Navigator.pushReplacementNamed(context, '/account');
  }

  void _toggleFavorite() {
    setState(() {
      final product = Product(
        title: widget.title,
        imagePath: widget.imagePath,
        price: widget.price,
        description: widget.description, id: widget.id,
      );
      if (isFavorite) {
        FavouritesManager.removeProduct(product);
      } else {
        FavouritesManager.addProduct(product);
      }
      isFavorite = !isFavorite;
      FavouritesManager();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: SvgPicture.asset(
            'assets/openfashion_logo.svg',
            height: 40,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: index == 0 ? Colors.black : Colors.grey,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: const TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '\$${widget.price}',
                style: const TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 18,
                  color: Color(0xffDD8560),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final product = CartItem(
                    id: widget.id, // Pass the unique ID
                    title: widget.title,
                    imagePath: widget.imagePath,
                    price: double.parse(widget.price),
                  );
                  Provider.of<CartState>(context, listen: false)
                      .addToCart(product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.add, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'ADD TO BASKET',
                          style: TextStyle(
                            fontFamily: 'TenorSans',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: _toggleFavorite,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              widget.description,
              const SizedBox(height: 20),
              SvgPicture.asset('assets/p_details.svg'),
              SizedBox(height: 20),
              ExpansionTile(
                title: const Text(
                  'Free Flat Rate Shipping',
                  style: TextStyle(
                    fontFamily: 'TenorSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Estimated to be delivered on\n09/11/2021 - 12/11/2021.',
                      style: const TextStyle(
                        fontFamily: 'TenorSans',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text(
                  'COD Policy',
                  style: TextStyle(
                    fontFamily: 'TenorSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Cash on Delivery is available for select regions, with exact cash required at delivery.',
                      style: const TextStyle(
                        fontFamily: 'TenorSans',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text(
                  'Return Policy',
                  style: TextStyle(
                    fontFamily: 'TenorSans',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Returns are accepted within 30 days of delivery for unused items in original packaging.',
                      style: const TextStyle(
                        fontFamily: 'TenorSans',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(child: SvgPicture.asset('assets/p_title.svg')),
              const SizedBox(height: 30),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    child: ProductCard(
                      imagePath: 'assets/product1.png',
                      title: '21WN reversible angora cardigan',
                      price: '29.99',
                      id: 'product1',
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    child: ProductCard(
                      imagePath: 'assets/product2.png',
                      title: '21WN reversible angora cardigan',
                      price: '39.99',
                      id: 'product2',
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    child: ProductCard(
                      imagePath: 'assets/product3.png',
                      title: '21WN reversible angora cardigan',
                      price: '49.99',
                      id: 'product3',
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    child: ProductCard(
                      imagePath: 'assets/product4.png',
                      title: 'Oblong bag',
                      price: '59.99',
                      id: 'product4',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SvgPicture.asset('assets/p_end.svg')
            ],
          ),
        ),
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

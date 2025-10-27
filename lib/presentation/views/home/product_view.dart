import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../element/product_card.dart';
import 'home_view.dart';

class Brand {
  final String name;
  final String logoPath;

  Brand({
    required this.name,
    required this.logoPath,
  });
}

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  final List<ProductModel> products = [
    ProductModel(
      id: 1,
      name: 'Wheat Grain Bag',
      image: 'assets/image/image 1 (8).png',
      // Add your image to assets
      price: 1200,
      discountPrice: 1600,
      backgroundColor: '#EEF0F6',
    ),
    ProductModel(
      id: 1,
      name: 'Wheat Grain Bag',
      image: 'assets/image/image 1 (8).png',
      // Add your image to assets
      price: 1200,
      discountPrice: 1600,
      backgroundColor: '#EEF0F6',
    ),
    ProductModel(
      id: 1,
      name: 'Wheat Grain Bag',
      image: 'assets/image/image 1 (8).png',
      // Add your image to assets
      price: 1200,
      discountPrice: 1600,
      backgroundColor: '#EEF0F6',
    ),
    ProductModel(
      id: 2,
      name: 'Rice Grain Bag',
      image: 'assets/image/image 1 (8).png',
      price: 1500,
      discountPrice: 2000,
      backgroundColor: '#EEF0F6',
    ),
  ];

  int selectedIndex = -1;

  List<Brand> brands = [
    Brand(name: 'Brand', logoPath: 'assets/image/image 1 (9).png'),
    Brand(name: 'Brand', logoPath: 'assets/image/image 1 (10).png'),
    Brand(name: 'Neon', logoPath: 'assets/image/image 1 (11).png'),
    Brand(name: 'Brand', logoPath: 'assets/image/image 1 (12).png'),
    Brand(name: 'Brand', logoPath: 'assets/image/image 1 (13).png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF121212)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/image/image 2.png",
                        width: 60,
                        height: 60,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.image, color: Colors.grey),
                          );
                        },
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Wheat',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: const Color(0xFF121212),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Choose Brands',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: const Color(0xFF121212),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: BrandItem(
                      brand: brands[index],
                      isSelected: isSelected,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    "Neon’s Wheat",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: const Color(0xFF121212),
                    ),
                  ),
                  const SizedBox(height: 14),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 160.5 / 289,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: products[index],
                        onBuyNow: () {},
                        onFavorite: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

class BrandItem extends StatelessWidget {
  final Brand brand;
  final bool isSelected;

  const BrandItem({
    super.key,
    required this.brand,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isSelected ? const Color(0x3DFF5934) : const Color(0xFFEEF0F6);
    final Color textColor =
        isSelected ? const Color(0xFFFF5934) : const Color(0xFF121212);

    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 80,
            decoration:
                BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
            child: Center(
              child: Image.asset(
                brand.logoPath,
                width: 38,
                height: 38,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            brand.name,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

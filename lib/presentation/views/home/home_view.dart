import 'package:dokan_retailer_app/navigation_helper/navigation_helper_view.dart';
import 'package:dokan_retailer_app/presentation/element/custom_text_field.dart';
import 'package:dokan_retailer_app/presentation/views/home/product_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../element/product_card.dart';

class ProductCategory {
  final String name;
  final String imagePath;

  ProductCategory({
    required this.name,
    required this.imagePath,
  });
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
        id: 2,
        name: 'Rice Grain Bag',
        image: 'assets/image/image 1 (8).png',
        price: 1500,
        discountPrice: 2000,
        backgroundColor: '#EEF0F6',
      ),
    ];
    final List<ProductCategory> categories = [
      ProductCategory(name: "Rice", imagePath: "assets/image/image 1.png"),
      ProductCategory(name: "Wheat", imagePath: "assets/image/image 1 (1).png"),
      ProductCategory(name: "Oats", imagePath: "assets/image/image 1 (2).png"),
      ProductCategory(
          name: "Barley", imagePath: "assets/image/image 1 (3).png"),
      ProductCategory(name: "Corn", imagePath: "assets/image/image 1 (4).png"),
      ProductCategory(name: "Wheat", imagePath: "assets/image/image 1 (5).png"),
      ProductCategory(name: "Oats", imagePath: "assets/image/image 1 (6).png"),
      ProductCategory(
          name: "Barley", imagePath: "assets/image/image 1 (7).png"),
      ProductCategory(name: "Corn", imagePath: "assets/image/image 1 (7).png"),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage(
                          "assets/icon/streamline_interface-dashboard-layout-circle-app-application-dashboard-home-layout-circle (1).png"),
                      size: 24,
                    ),
                    Text(
                      "Dokan",
                      style: GoogleFonts.kronaOne(
                        color: const Color(0xffFF5934),
                        fontWeight: FontWeight.w400,
                        fontSize: 21.18,
                      ),
                    ),
                    ImageIcon(
                      AssetImage("assets/icon/ph_bell-light.png"),
                      size: 24,
                    ),
                  ],
                ),
              ),
              Image.asset(
                "assets/icon/Frame 55.png",
                height: 198,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  hintText: 'Search',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Image.asset(
                      "assets/icon/iconoir_search.png",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // ✅ Fixed: GridView for 2 rows with horizontal scrolling
              SizedBox(
                height: 230, // Increased height to prevent overflow
                child: GridView.builder(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 rows
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2, // Adjusted to give more vertical space
                  ),
                  itemCount: categories.length + 1,
                  itemBuilder: (context, index) {
                    if (index == categories.length) {
                      return GestureDetector(
                        onTap: () {
                          NavigationHelper.push(
                              context: context,
                              targetClass: ProductViewScreen());
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 62,
                              height: 62,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFF0ED),
                              ),
                              alignment: Alignment.center,
                              child: ImageIcon(
                                AssetImage(
                                    "assets/icon/streamline_interface-dashboard-layout-circle-app-application-dashboard-home-layout-circle (1).png"),
                                size: 24,
                                color: Color(0xffFF5934),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Show All",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffFF5934),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        // Handle category tap
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 62,
                            height: 62,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffEEF0F6),
                            ),
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7.0, vertical: 13),
                                child: Image.asset(
                                  category.imagePath,
                                  width: 56,
                                  height: 42,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            category.name,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Divider(
                height: 1,
                color: Color(0xffEEF0F6),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Recommended for you",
                  style: GoogleFonts.inter(
                    color: const Color(0xff121212),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
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
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductModel {
  final int id;
  final String name;
  final String image;
  final double price;
  final double discountPrice;
  final String backgroundColor;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.discountPrice,
    required this.backgroundColor,
  });
}

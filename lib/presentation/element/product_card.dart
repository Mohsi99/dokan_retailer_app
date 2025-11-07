import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../provider/favorites_provider.dart';
import '../views/home/home_view.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onBuyNow;
  final VoidCallback? onTap; // For card navigation

  const ProductCard({
    super.key,
    required this.product,
    this.onBuyNow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate to product detail screen
      child: Container(
        width: 160.5,
        decoration: BoxDecoration(
          color: Color(0xffEEF0F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                product.image,
                width: 144,
                height: 129,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 3),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 5.0, top: 6, bottom: 6, left: 8),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    width: 160.5,
                    height: 81,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFFFFF).withOpacity(0.8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          product.name,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: const Color(0xFFEEF0F6),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${product.price.toInt()} Rs',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFFF6B35),
                                    ),
                                  ),
                                  Text(
                                    '${product.discountPrice.toInt()} Rs',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF9E9E9E),
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Consumer<FavoritesProvider>(
                              builder: (context, favoritesProvider, child) {
                                final isFavorite = favoritesProvider
                                    .isFavorite(product.id);
                                return GestureDetector(
                                  onTap: () {
                                    favoritesProvider.toggleFavorite(product);

                                    // Show snackbar feedback
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          isFavorite
                                              ? 'Removed from favorites'
                                              : 'Added to favorites',
                                          style: GoogleFonts.inter(),
                                        ),
                                        duration: Duration(seconds: 1),
                                        backgroundColor: Color(0xff121212),
                                      ),
                                    );
                                  },
                                  child: Image.asset("assets/icon/Heart.png",
                                    height: 24,
                                    width:24,

                                    color: isFavorite
                                        ? Color(0xFFFF5934)
                                        : Color(0xFF9E9E9E),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: SizedBox(
                    width: 144,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: onBuyNow,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF121212),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                      ),
                      child: Text(
                        'Buy Now',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
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
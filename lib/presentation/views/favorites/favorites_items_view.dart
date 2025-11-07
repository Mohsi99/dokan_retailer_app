import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../provider/favorites_provider.dart';
import '../../element/custom_text_field.dart';
import '../../element/product_card.dart';

class SavedItemsScreen extends StatelessWidget {
  const SavedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'SavedItems',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff121212),
          ),
        ),
        centerTitle: true,
      ),

      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          final favoriteItems = favoritesProvider.favoriteItems;

          return Column(
            children: [
              Divider(
                color: Color(0xffEEF0F6),
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
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

              // Products Grid
              Expanded(
                child: favoriteItems.isEmpty
                    ? _buildEmptyState()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 160.5 / 289,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: favoriteItems.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              product: favoriteItems[index],
                              onBuyNow: () {
                                // Handle buy now action
                              },
                              onTap: () {
                                // Navigate to product detail if needed
                                // NavigationHelper.push(
                                //   context: context,
                                //   targetClass: ProductDetailScreen(
                                //     product: favoriteItems[index],
                                //   ),
                                // );
                              },
                            );
                          },
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: Color(0xffEEF0F6),
          ),
          const SizedBox(height: 16),
          Text(
            'No Saved Items',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff9E9E9E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start adding items to your favorites',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff9E9E9E),
            ),
          ),
        ],
      ),
    );
  }
}

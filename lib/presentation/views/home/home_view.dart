import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../navigation_helper/navigation_helper_view.dart';
import '../../../provider/banner_provider.dart';
import '../../element/custom_text_field.dart';
import '../../element/product_card.dart';
import '../favorites/favorites_items_view.dart';
import 'product_view.dart';

class ProductCategory {
  final String name;
  final String imagePath;

  ProductCategory({
    required this.name,
    required this.imagePath,
  });
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isAutoSliding = false;

  @override
  void initState() {
    super.initState();

    // Fetch banners when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('📱 HomeView: Fetching banners...');
      final bannerProvider =
          Provider.of<BannerProvider>(context, listen: false);
      bannerProvider.fetchBanners().then((_) {
        print('📱 HomeView: Banners loaded: ${bannerProvider.banners.length}');
        if (bannerProvider.banners.isNotEmpty && !_isAutoSliding) {
          _startAutoSlide();
        }
      });
    });
  }

  void _startAutoSlide() {
    if (_isAutoSliding) return;
    _isAutoSliding = true;
    print('📱 HomeView: Starting auto-slide');
    Future.delayed(const Duration(seconds: 3), _autoSlide);
  }

  void _autoSlide() {
    if (!mounted || !_isAutoSliding) return;

    final bannerProvider = Provider.of<BannerProvider>(context, listen: false);

    if (bannerProvider.banners.isEmpty) {
      Future.delayed(const Duration(seconds: 3), _autoSlide);
      return;
    }

    _currentPage = (_currentPage + 1) % bannerProvider.banners.length;

    if (_pageController.hasClients) {
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }

    Future.delayed(const Duration(seconds: 3), _autoSlide);
  }

  @override
  void dispose() {
    _isAutoSliding = false;
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = [
      ProductModel(
        id: 1,
        name: 'Wheat Grain Bag',
        image: 'assets/image/image 1 (8).png',
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
              // Header
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ImageIcon(
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
                    Stack(
                      children: [
                        IconButton(
                          icon: const ImageIcon(
                            AssetImage("assets/icon/ph_bell-light.png"),
                            size: 24,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Banner Carousel
              Consumer<BannerProvider>(
                builder: (context, bannerProvider, child) {
                  print(
                      '📱 Banner Widget: isLoading=${bannerProvider.isLoading}, bannerCount=${bannerProvider.banners.length}, error=${bannerProvider.errorMessage}');

                  // Loading state
                  if (bannerProvider.isLoading) {
                    return Container(
                      height: 198,
                      width: double.infinity,
                      color: const Color(0xffEEF0F6),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFFF5934),
                          strokeWidth: 3,
                        ),
                      ),
                    );
                  }

                  // Error state
                  if (bannerProvider.errorMessage != null) {
                    print('📱 Banner Error: ${bannerProvider.errorMessage}');
                    return Container(
                      height: 198,
                      width: double.infinity,
                      color: const Color(0xffEEF0F6),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 48,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Failed to load banners',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                print('📱 Retry button pressed');
                                bannerProvider.fetchBanners();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF5934),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                              ),
                              child: Text(
                                'Retry',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // Empty state - show default banner
                  if (bannerProvider.banners.isEmpty) {
                    print('📱 No banners available, showing default');
                    return Image.asset(
                      "assets/icon/Frame 55.png",
                      height: 198,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }

                  // Success state - show banners
                  print(
                      '📱 Displaying ${bannerProvider.banners.length} banners');
                  return Column(
                    children: [
                      SizedBox(
                        height: 198,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemCount: bannerProvider.banners.length,
                          itemBuilder: (context, index) {
                            final banner = bannerProvider.banners[index];
                            print('📱 Loading banner $index: ${banner.image}');

                            return ClipRRect(
                              child: Image.network(
                                banner.image,
                                width: double.infinity,
                                height: 198,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    print(
                                        '✅ Banner $index loaded successfully');
                                    return child;
                                  }

                                  final progress = loadingProgress
                                              .expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null;

                                  return Container(
                                    color: const Color(0xffEEF0F6),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: progress,
                                        color: const Color(0xFFFF5934),
                                        strokeWidth: 3,
                                      ),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  print(
                                      '❌ Banner $index failed to load: $error');
                                  return Container(
                                    color: const Color(0xffEEF0F6),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.broken_image_outlined,
                                            size: 48,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Image failed to load',
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Indicator dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          bannerProvider.banners.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? const Color(0xFFFF5934)
                                  : const Color(0xffBDBDBD),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 20),

              // Search Field
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

              // Categories
              SizedBox(
                height: 230,
                child: GridView.builder(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2,
                  ),
                  itemCount: categories.length + 1,
                  itemBuilder: (context, index) {
                    if (index == categories.length) {
                      return GestureDetector(
                        onTap: () {
                          NavigationHelper.push(
                              context: context,
                              targetClass: const ProductViewScreen());
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
                              child: const ImageIcon(
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
                      onTap: () {},
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

              const SizedBox(height: 20),
              const Divider(
                height: 1,
                color: Color(0xffEEF0F6),
              ),
              const SizedBox(height: 20),

              // Recommended Products
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended for you",
                      style: GoogleFonts.inter(
                        color: const Color(0xff121212),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigationHelper.push(
                          context: context,
                          targetClass: const SavedItemsScreen(),
                        );
                      },
                      child: const Icon(
                        Icons.favorite_border,
                        color: Color(0xffFF5934),
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
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
                      onTap: () {},
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
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

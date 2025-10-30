import 'dart:ui';

import 'package:dokan_retailer_app/navigation_helper/navigation_helper_view.dart';
import 'package:dokan_retailer_app/presentation/views/cart_views/widget/cart_item.dart';
import 'package:dokan_retailer_app/presentation/views/cart_views/widget/check_out_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      id: '1',
      name: 'Wheat Grain Bag',
      weight: 'x 10 Kg',
      price: 1200,
      originalPrice: 1600,
      quantity: 3,
      image: 'assets/image/image 1 (14).png',
    ),
    CartItem(
      id: '2',
      name: 'Wheat Grain Bag',
      weight: 'x 10 Kg',
      price: 1200,
      originalPrice: 1600,
      quantity: 1,
      image: 'assets/image/image 1 (14).png',
    ),
    CartItem(
      id: '3',
      name: 'Wheat Grain Bag',
      weight: 'x 10 Kg',
      price: 1200,
      originalPrice: 1600,
      quantity: 1,
      image: 'assets/image/image 1 (14).png',
    ),
    CartItem(
      id: '4',
      name: 'Wheat Grain Bag',
      weight: 'x 10 Kg',
      price: 1200,
      originalPrice: 1600,
      quantity: 2,
      image: 'assets/image/image 1 (14).png',
    ),
  ];

  void incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      setState(() {
        cartItems[index].quantity--;
      });
    }
  }

  void deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  int getTotalAmount() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Cart',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff121212),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Divider(
            color: Color(0xffEEF0F6),
            height: 1,
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Dismissible(
                    key: Key(cartItems[index].id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      deleteItem(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Item removed from cart'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x00FF5934).withValues(alpha: 0),
                            // left: #FF593400 (0% opacity)
                            Color(0xFFFF0000),
                            // right: #FF0000
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              "assets/icon/ic_round-delete.png",
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Text(
                              "Delete",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    child: CartItemWidget(
                      item: cartItems[index],
                      onIncrement: () => incrementQuantity(index),
                      onDecrement: () => decrementQuantity(index),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.black.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 19,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000).withValues(alpha: 0.4),
                            ),
                          ),
                          Text(
                            '${getTotalAmount()} Rs',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffFF5934),
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: SizedBox(
                            width: 86,
                            height: 38,
                            child: ElevatedButton(
                              onPressed: () {
                                NavigationHelper.push(
                                    context: context,
                                    targetClass: CheckOutView());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF121212),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String id;
  final String name;
  final String weight;
  final int price;
  final int originalPrice;
  int quantity;
  final String image;

  CartItem({
    required this.id,
    required this.name,
    required this.weight,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.image,
  });
}

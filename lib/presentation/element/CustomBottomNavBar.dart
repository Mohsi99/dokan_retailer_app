import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [
      'assets/icon/solar_home-2-broken.png',
      'assets/icon/solar_cart-broken.png',
      'assets/icon/solar_document-broken.png',
      'assets/icon/ph_heart.png',
    ];

    return Container(
      height: 72,
      padding: const EdgeInsets.only(top: 6, bottom: 16, left: 24, right: 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.93),
        border: const Border(
          top: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.2), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(icons.length, (index) {
            final isSelected = index == currentIndex;
            return GestureDetector(
              onTap: () => onItemTapped(index),
              child: Image.asset(icons[index],
                  height: 28,
                  width: 28,
                  color: isSelected ? Color(0xffFF5934) : Color(0xffBDBDBD)),
            );
          }),
          GestureDetector(
            onTap: () => onItemTapped(4),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: const AssetImage(
                  'assets/icon/streamline_interface-dashboard-layout-circle-app-application-dashboard-home-layout-circle.png'),

            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../element/CustomBottomNavBar.dart';
import '../cart_views/cart_screen.dart';
import '../home/home_view.dart';
import '../order/oders_view.dart';
import '../profile/profile_view.dart';

class MainBottomNavigationView extends StatefulWidget {
  const MainBottomNavigationView({super.key});

  @override
  State<MainBottomNavigationView> createState() =>
      _MainBottomNavigationViewState();
}

class _MainBottomNavigationViewState extends State<MainBottomNavigationView> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeView(),
    CartScreen(),
    OrdersView(),
    SizedBox(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

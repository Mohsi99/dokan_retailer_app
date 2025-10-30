import 'package:dokan_retailer_app/presentation/views/0oder/oders_view.dart';
import 'package:dokan_retailer_app/presentation/views/bottom_navigation_view/main_bottom_navigation_view.dart';
import 'package:dokan_retailer_app/presentation/views/notifications/notifications_view.dart';
import 'package:dokan_retailer_app/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home:MainBottomNavigationView()
    );
  }
}



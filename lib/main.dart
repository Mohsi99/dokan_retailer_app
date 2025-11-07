import 'package:dokan_retailer_app/presentation/views/bottom_navigation_view/main_bottom_navigation_view.dart';
import 'package:dokan_retailer_app/provider/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MaterialApp(
        title: 'Dokan Retailer App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

        ),
        home: MainBottomNavigationView(),
      ),
    );
  }
}
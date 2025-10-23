import 'package:dokan_retailer_app/presentation/views/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5934),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            Column(
              children: [
                Text(
                  'Dokan',
                  style: GoogleFonts.kronaOne(
                    fontSize: 46,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    letterSpacing: -3.78,
                    height: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Retailer App',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                'Sky Pulse Solution',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

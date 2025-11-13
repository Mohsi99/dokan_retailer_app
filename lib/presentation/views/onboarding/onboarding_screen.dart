import 'package:dokan_retailer_app/navigation_helper/navigation_helper_view.dart';
import 'package:dokan_retailer_app/presentation/views/auth/create_account_view.dart';
import 'package:dokan_retailer_app/presentation/views/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 229,
            width: double.infinity,
            color: const Color(0xffEEF0F6),
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 115),
                Image.asset(
                  'assets/icon/Frame 27 (1).png',
                  height: 30.8,
                  width: 121,
                ),
              ],
            ),
          ),

          // Content area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Welcome to Dokan!',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff121212),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildFeatureRow(
                    "assets/icon/shopping-cart 1.png",
                    "We make shopping for your business easier than ever before",
                  ),
                  const SizedBox(height: 18),
                  buildFeatureRow(
                    "assets/icon/shopping-cart 1 (1).png",
                    "Our app offers extensive product listings",
                  ),
                  const SizedBox(height: 18),
                  buildFeatureRow(
                    "assets/icon/shopping-cart 1 (2).png",
                    "Our ordering system is user-friendly",
                  ),
                  const SizedBox(height: 18),
                  buildFeatureRow(
                    "assets/icon/shopping-cart 1 (3).png",
                    "Find everything you need to keep your business running smoothly",
                  ),
                  const SizedBox(height: 18),
                  buildFeatureRow(
                    "assets/icon/shopping-cart 1 (4).png",
                    "Start shopping now and experience the convenience!",
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        NavigationHelper.push(
                            context: context, targetClass: CreateAccountView());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5934),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Create Account',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: () {
                        NavigationHelper.push(
                            context: context, targetClass: LoginView());
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        side: const BorderSide(
                            color: Color(0xFFBDBDBD), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Have an account?",
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffBDBDBD)),
                          ),
                          Text(
                            'Login',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFF5934),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeatureRow(String iconPath, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          iconPath,
          height: 28,
          width: 28,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: const Color(0xff949494),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

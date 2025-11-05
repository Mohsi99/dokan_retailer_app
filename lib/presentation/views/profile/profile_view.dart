import 'package:dokan_retailer_app/navigation_helper/navigation_helper_view.dart';
import 'package:dokan_retailer_app/presentation/views/profile/account_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 237,
                width: double.infinity,
                color: Color(0xffEEF0F6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff121212),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: Color(0xff121212),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 110,
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 9),
                        decoration: BoxDecoration(
                          color: Color(0xffF8F9FB),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xffEEF0F6),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xffE8E8E8),
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/image/Ellipse 229.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Color(0xff121212).withOpacity(0.4),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Muhammad Wajahat',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff121212),
                                        ),
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          color: Color(0xffFF5934),
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'mwajahat.038@gmail.com',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFF5934),
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    '+44 647886434',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    ProfileMenuItem(
                      title: 'Account Settings',
                      onTap: () {
                        NavigationHelper.push(context: context, targetClass: AccountSettingsView());
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileMenuItem(
                      title: 'Terms & Conditions',
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileMenuItem(
                      title: 'Privacy Policy',
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileMenuItem(
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileMenuItem(
                      title: 'Rate Our App',
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          _showLogoutDialog(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 12),
                          decoration: BoxDecoration(
                              color: Color(0xffEEF0F6),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Text(
                                'Logout',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFF5934),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.chevron_right,
                                color: Color(0xffADADAF),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Logout',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff121212),
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000).withOpacity(0.6),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff121212),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Logout',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFF5934),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
          decoration: BoxDecoration(
              color: Color(0xffEEF0F6),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff121212),
                ),
              ),
              Spacer(),
              Icon(
                Icons.chevron_right,
                color: Color(0xffADADAF),
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

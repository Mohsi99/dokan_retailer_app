import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSettingsView extends StatefulWidget {
  const AccountSettingsView({super.key});

  @override
  State<AccountSettingsView> createState() => _AccountSettingsViewState();
}

class _AccountSettingsViewState extends State<AccountSettingsView> {
  final TextEditingController nameController =
      TextEditingController(text: "Muhammad Wajahat");
  final TextEditingController phoneController =
      TextEditingController(text: "+92 3140090925");
  final TextEditingController storeController =
      TextEditingController(text: "Karwaan General Store");
  final TextEditingController addressController =
      TextEditingController(text: "SD-21, North Nazimabad, Karachi");

  String selectedCategory = "Parchoon";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account Settings",
                  style: GoogleFonts.inter(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff121212),
                  ),
                ),
                Text(
                  "Please provide following details below",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff949494),
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(nameController),
                const SizedBox(height: 16),
                _buildTextField(phoneController,
                    prefixIcon: const Icon(Icons.flag_circle,
                        color: Color(0xff1FAF38), size: 22)),
                const SizedBox(height: 16),
                _buildTextField(storeController),
                const SizedBox(height: 16),
                _buildTextField(addressController),
                const SizedBox(height: 16),
                Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F9FB),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xffEEF0F6)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCategory,
                      items: const [
                        DropdownMenuItem(
                            value: "Parchoon", child: Text("Parchoon")),
                        DropdownMenuItem(
                            value: "Wholesale", child: Text("Wholesale")),
                        DropdownMenuItem(
                            value: "Distributor", child: Text("Distributor")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black54),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff121212),
                      ),
                      dropdownColor: Colors.white,
                      isExpanded: true,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.93),
          border: Border(
            top: BorderSide(
              color: Colors.black.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: SizedBox(
                  width: 160,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff121212),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Discard",
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
            const SizedBox(width: 6),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: SizedBox(
                  width: 160,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // Save logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xffFF0000).withValues(alpha: 0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Save Changes",
                      maxLines: 1,
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
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller,
      {Widget? prefixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 54,
          decoration: BoxDecoration(
            color: const Color(0xffF8F9FB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffEEF0F6)),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              prefixIcon: prefixIcon,
            ),
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xff121212),
            ),
          ),
        ),
      ],
    );
  }
}

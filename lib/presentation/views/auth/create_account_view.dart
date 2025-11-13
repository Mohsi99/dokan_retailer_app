import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../navigation_helper/navigation_helper_view.dart';
import '../../../provider/auth_provider.dart';
import '../../element/custom_text_field.dart';
import 'login_view.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _shopAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _shopNameController.dispose();
    _emailController.dispose();
    _shopAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number must contain only digits';
    }
    return null;
  }

  String? _validateShopName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Shop name is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validateShopAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Shop address is required';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _handleCreateAccount() async {
    // Clear any previous errors
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.clearError();

    // Validate all fields
    if (_formKey.currentState!.validate()) {
      // Format phone number with country code
      final phoneNumber = '+92${_phoneController.text}';

      // Call register method
      final success = await authProvider.register(
        name: _fullNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        phoneNumber: phoneNumber,
        shopName: _shopNameController.text.trim(),
        shopAddress: _shopAddressController.text.trim(),
      );

      if (success && mounted) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Account created successfully!',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );

        // Navigate to home or main screen
        // Replace with your actual navigation logic
        NavigationHelper.push(context: context, targetClass: LoginView());
      } else if (mounted) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              authProvider.errorMessage ??
                  'Registration failed. Please try again.',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: SafeArea(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  "assets/icon/material-symbols_arrow-back.png",
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                'Create Account',
                                style: GoogleFonts.inter(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff121212),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Please provide following details to create an account',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff949494),
                                ),
                              ),
                              const SizedBox(height: 30),

                              // Full Name Field
                              CustomTextField(
                                hintText: 'Full Name',
                                controller: _fullNameController,
                                validator: _validateFullName,
                              ),
                              const SizedBox(height: 10),

                              // Phone Number Field
                              Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  color: const Color(0xffEEF0F6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 12),
                                    Image.asset(
                                      'assets/icon/emojione-v1_flag-for-pakistan.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '+92',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff121212),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      width: 1,
                                      height: 20,
                                      color: const Color(0xffBDBDBD),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _phoneController,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 10,
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff121212),
                                        ),
                                        decoration: InputDecoration(
                                          hintText: '3140090925',
                                          hintStyle: GoogleFonts.inter(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffBDBDBD),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 12,
                                          ),
                                          counterText: '',
                                          errorStyle:
                                              const TextStyle(height: 0),
                                        ),
                                        validator: _validatePhone,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (_formKey.currentState != null &&
                                  _validatePhone(_phoneController.text) !=
                                      null &&
                                  _phoneController.text.isNotEmpty)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, top: 4),
                                  child: Text(
                                    _validatePhone(_phoneController.text)!,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 10),

                              // Shop Name Field
                              CustomTextField(
                                hintText: 'Shop Name',
                                controller: _shopNameController,
                                validator: _validateShopName,
                              ),
                              const SizedBox(height: 10),

                              // Email Field
                              CustomTextField(
                                hintText: 'Email',
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: _validateEmail,
                              ),
                              const SizedBox(height: 10),

                              // Shop Address Field
                              CustomTextField(
                                hintText: 'Shop Address',
                                controller: _shopAddressController,
                                validator: _validateShopAddress,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    'assets/icon/ph_map-pin.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Password Field
                              CustomTextField(
                                hintText: 'Password',
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                validator: _validatePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: const Color(0xffBDBDBD),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 40),

                              // Create Account Button
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: authProvider.isLoading
                                      ? null
                                      : _handleCreateAccount,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFF5934),
                                    disabledBackgroundColor:
                                        const Color(0xFFFF5934)
                                            .withOpacity(0.6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: authProvider.isLoading
                                      ? const SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          ),
                                        )
                                      : Text(
                                          'Create Account',
                                          style: GoogleFonts.inter(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: OutlinedButton(
                                  onPressed: authProvider.isLoading
                                      ? null
                                      : () {
                                          NavigationHelper.push(
                                              context: context,
                                              targetClass: const LoginView());
                                        },
                                  style: OutlinedButton.styleFrom(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    side: const BorderSide(
                                        color: Color(0xFFBDBDBD), width: 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Have an account?",
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xffBDBDBD)),
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
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

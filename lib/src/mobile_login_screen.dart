import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/login_controller.dart';
import 'package:ghar_ka_sathi/src/login_components.dart';
import 'package:ghar_ka_sathi/src/verify_otp_for_mobile_login_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class MobileLoginScreen extends StatefulWidget {
  MobileLoginScreen({
    super.key,
  });

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileNumberController = TextEditingController();
  final controller = Get.put(LoginController());

  void _validateAndSubmit() {
    Get.to(VerifyOtpForMobileLoginScreen());
    if (_formKey.currentState?.validate() ?? false) {
      // If valid, proceed with the next steps
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Validation successful!')), // Debug purposes
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: AppColors.appBarColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Image.asset(
                  'assets/gks/horizontal_logo.PNG',
                  height: 70,
                  width: 50,
                ).marginOnly(left: 5),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appBarColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign in to continue',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  Form(
                    key: _formKey,
                    child: CustomTextField(
                      controller: _mobileNumberController,
                      label: 'Mobile Number',
                      prefixIcon: const Text(
                        '+91',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your mobile number';
                        } else if (value.length != 10 ||
                            !RegExp(r'^\d{10}\$').hasMatch(value)) {
                          return 'Enter a valid 10-digit mobile number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: 'Continue',
                    onPressed: _validateAndSubmit,
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: 'login with email',
                    onPressed: (){
                      Get.to(LoginComponents());
                    },
                  ),
                  const SizedBox(height: 16),
                  // Guest Login Button
                  OutlinedButton.icon(
                    onPressed: () {
                      controller.guestLogin(context);
                    },
                    icon: Icon(Icons.person_outline, color: Colors.grey[600]),
                    label: const Text("Continue as Guest"),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      side: BorderSide(color: Colors.grey[400]!),
                      foregroundColor: Colors.grey[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'By continuing, you agree to our Terms of Service and Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  // const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelStyle: TextStyle(
          color: AppColors.appBarColor,
        ),
        // labelStyle: TextStyle(
        //   color: AppColors.grey,
        // ),
        prefixIcon: prefixIcon != null
            ? Container(
          padding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          constraints: const BoxConstraints(minWidth: 50),
          child: prefixIcon,
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.appBarColor,
          ),
        ),
      ),
      validator: validator,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appBarColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
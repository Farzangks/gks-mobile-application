import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/controller/login_controller.dart';
import 'package:ghar_ka_sathi/src/already_have_an_account_check.dart';
import 'package:ghar_ka_sathi/src/forgot_password.dart';
import 'package:ghar_ka_sathi/src/user_register_components.dart';
import 'package:ghar_ka_sathi/src/verify_otp_for_mobile_login_screen.dart';
import 'package:ghar_ka_sathi/utils/custom_app_stack_loader.dart';
import 'package:itq_utils/itq_utils.dart';

import '../utils/colors_res.dart';


class LoginComponents extends StatelessWidget {
  LoginComponents({super.key});

  final emailOrMobile = TextEditingController();

  final password = TextEditingController();

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => CustomAppStackLoader(
        visible: controller.isLoading.value,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Welcome to Our Service",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color:
                  AppColors.appBarColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Discover a world of seamless connectivity and efficient solutions crafted just for you. Log in to explore more!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 40),
              Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                          AppColors.appBarColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: emailOrMobile,
                        decoration: InputDecoration(
                          labelText: "Mobile",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        controller: password,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          print(emailOrMobile.text);
                          print(password.text);
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (emailOrMobile.text.isEmpty) {
                            toast('email or mobile no. can"t be empty');
                          } else if (password.text.isEmpty) {
                            toast('email or mobile no. can"t be  empty');
                          } else if (password.text.length < 8) {
                            toast( "Password Length must be greater than or equal to 8 Characters");
                          } else if (!regex.hasMatch(password.text)) {
                            toast( "Password should be contain\nMinimum 1 Upper case \nMinimum 1 lowercase\nMinimum 1 Numeric Number\nMinimum 1 Special Character");

                          } else {
                            controller.userSignIn(
                                context,
                                emailOrMobile.text,
                                password.text
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          AppColors.appBarColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text("Login",style: TextStyle(color: AppColors.white),),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to( ForgotPassword());

                        },
                        child: const Text("Forgot Password?"),
                      ),
                      const SizedBox(height: 20),
                      OutlinedButton.icon(
                        onPressed: () {
                          Get.to(VerifyOtpForMobileLoginScreen());
                        },
                        icon: Icon(Icons.phone_android_outlined),
                        label: const Text("Login with Phone"),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          side: const BorderSide(color:
                          AppColors.appBarColor,),
                        ),
                      ),
                      16.height,
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
                        ),
                      ),
                      16.height,
                      AlreadyHaveAnAccountCheck(
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return  UserRegisterComponents();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
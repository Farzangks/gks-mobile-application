import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/login_controller.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:itq_utils/itq_utils.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key});
  final emailOrMobile = TextEditingController();
  final otp = TextEditingController();
  final newPassword = TextEditingController();
  final controller = Get.put(LoginController());

  final isResendEnabled = false.obs; // To manage resend button state
  final countdown = 60.obs; // Countdown for the button

  void startResendTimer() {
    isResendEnabled.value = false; // Disable the button
    countdown.value = 60; // Reset countdown to 60 seconds

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        isResendEnabled.value = true; // Enable the button
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/IMG_0742.PNG',
          height: 170,
        ).marginOnly(left: 5),
        backgroundColor: AppColors.appBarColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Welcome to Our Service",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.appBarColor,
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
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appBarColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: emailOrMobile,
                      decoration: InputDecoration(
                        labelText: "Email or Mobile Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: otp,
                      decoration: InputDecoration(
                        labelText: "Enter Otp",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: newPassword,
                      decoration: InputDecoration(
                        labelText: "New Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      return ElevatedButton(
                        onPressed: isResendEnabled.value
                            ? () {
                          controller.getOtp(
                              context, emailOrMobile.text);
                          startResendTimer(); // Start the timer
                        }
                            : null, // Disable the button if not enabled
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appBarColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: isResendEnabled.value
                            ? const Text(
                          "Resend Otp",
                          style: TextStyle(color: AppColors.white),
                        )
                            : Text(
                          "Resend in ${countdown.value}s",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (emailOrMobile.text.isEmpty) {
                          toast('Email or mobile no. can\'t be empty');
                        } else if (otp.text.isEmpty) {
                          toast('OTP can\'t be empty');
                        } else if (newPassword.text.isEmpty) {
                          toast('New Password can\'t be empty');
                        } else {
                          controller.verifyOtp(
                            context,
                            emailOrMobile.text,
                            otp.text,
                            newPassword.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appBarColor,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        "Change Password",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

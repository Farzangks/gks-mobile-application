import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/login_controller.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:itq_utils/itq_utils.dart';


class ForgotPassword extends StatelessWidget {
    ForgotPassword  ({super.key});
  final emailOrMobile = TextEditingController();
    final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/IMG_0742.PNG',
          height: 170,
        ).marginOnly(left: 5),
        backgroundColor:
        AppColors.appBarColor,
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
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                        AppColors.appBarColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                     TextField(

                      controller: emailOrMobile,
                      // obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Email or Mobile Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async {
                          print(emailOrMobile.text);
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (emailOrMobile.text.isEmpty) {
                            toast('email or mobile no. can"t be empty');
                          } else {
                            controller.getOtp(
                                context,
                                emailOrMobile.text
                            );
                          }
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        AppColors.appBarColor,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text("Send Otp",style: TextStyle(color: AppColors.white ),),
                    ),
                    16.height,
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

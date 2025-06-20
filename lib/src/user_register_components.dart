import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/login_controller.dart';
import 'package:ghar_ka_sathi/src/already_have_an_account_check.dart';
import 'package:ghar_ka_sathi/src/sign_in_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/custom_app_stack_loader.dart';
import 'package:itq_utils/itq_utils.dart';


class UserRegisterComponents extends StatelessWidget {
    UserRegisterComponents({super.key});

  final emailOrMobile = TextEditingController();

  final password = TextEditingController();
  final userName = TextEditingController();

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
      body: Obx(
            () => CustomAppStackLoader(
              visible: controller.isAddLoading.value,
              child: SingleChildScrollView(
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
                          "Register",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                            AppColors.appBarColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                         TextField(
                          keyboardType: TextInputType.text,
                          controller: userName,
                          decoration: InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                         TextField(
                          keyboardType: TextInputType.phone,
                          controller: emailOrMobile,
                          // obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Mobile Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                         TextField(
                          keyboardType: TextInputType.text,
                          controller: password,
                          obscureText: true,
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
                            if (userName.text.isEmpty) {
                              toast('userName can"t be empty');
                            } else if (emailOrMobile.text.isEmpty) {
                              toast('email or mobile no. can"t be empty');
                            } else if (password.text.isEmpty) {
                              toast('email or mobile no. can"t be  empty');
                            } else if (password.text.length < 8) {
                              toast( "Password Length must be greater than or equal to 8 Characters");
                            } else if (!regex.hasMatch(password.text)) {
                              toast( "Password should be contain\nMinimum 1 Upper case \nMinimum 1 lowercase\nMinimum 1 Numeric Number\nMinimum 1 Special Character");

                            } else {
                              controller.userRegistration(
                                  context,
                                  userName.text,
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
                          child: const Text("Register",style: TextStyle(color: AppColors.white       ),),
                        ),
                        16.height,
                        AlreadyHaveAnAccountCheck(login: false,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignInScreen();
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
      ),
    );
  }
}

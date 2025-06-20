

import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/src/login_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/responsive_widget.dart';
import 'package:ghar_ka_sathi/src/mobile_login_screen.dart';


class SignInScreen extends StatelessWidget {
  static String tag = '/SignInScreen';
  const  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.transparent,
        body: Responsive(
          mobile: MobileLoginScreen(),
          desktop:  Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: LoginComponents(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/custom_widget.dart';

class ViewAllSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ViewAllSectionTitle({super.key, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black),
          ),
          HcAppButton(
            onPressed: onTap,
            buttonColor: AppColors.transparent,
            text: "View all",
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 10,
              color: AppColors.appBarColor,
            ),
            // textColor: AppColors.white,
            textStyle: const TextStyle(fontSize: 10, color: AppColors.appBarColor),
            // color: AppColors.filterColor,
            // child: const Text(
            //   "View all",
            //   style: TextStyle(
            //       color: AppColors.btnDarkGreen
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

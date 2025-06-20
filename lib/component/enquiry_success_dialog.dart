// lib/widgets/enquiry_success_dialog.dart
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart' hide AppColors;
import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:lottie/lottie.dart';

class EnquirySuccessDialog extends StatelessWidget {
  final VoidCallback onClose;

  const EnquirySuccessDialog({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  static Future<void> show({
    required BuildContext context,
    required VoidCallback onClose,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return EnquirySuccessDialog(onClose: onClose);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 250,
            width: 250,
            child: Lottie.asset(
              'assets/animations/booking_success.json',
              fit: BoxFit.contain,
              repeat: false,
            ),
          ),
          const SizedBox(height: 15),
           Text(
            'Enquiry Submitted!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.appBarColor,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Your enquiry has been submitted successfully. Our team will get back to you soon.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: onClose,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appBarColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Great!',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
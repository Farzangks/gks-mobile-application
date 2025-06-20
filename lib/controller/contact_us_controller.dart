// contact_us_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/api/api_secvices.dart';
import 'package:ghar_ka_sathi/model/contact_us_model.dart';
import 'package:itq_utils/itq_utils.dart';

class ContactUsController extends GetxController {
  var isLoading = false.obs;
  var contactUsData = <ContactUsModel>[].obs;

  void contactUs(
    BuildContext context,
    String name,
    String mobile,
    String email,
    String query,
  ) async {
    try {
      isLoading(true);
      var data = await ApiServices.contactUs(name, mobile, email, query);
      if (data != null) {
        contactUsData.value = [data];
        toast('form submitted successfully');
      } else {
        toast('No data returned from server.');
      }
    } catch (e) {
      print("Error in ContactUsController: $e");
      toast('An error occurred. Please try again.');
    } finally {
      isLoading(false);
      Get.back(); // Adjust navigation as needed
      Get.back();
    }
  }
}

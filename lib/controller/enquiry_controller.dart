import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/api/api_secvices.dart';
import 'package:ghar_ka_sathi/component/enquiry_success_dialog.dart';
import 'package:ghar_ka_sathi/model/enquiry_model.dart';
import 'package:itq_utils/itq_utils.dart';

class EnquiryController extends GetxController {
  var isLoading = false.obs;
  var isEnabled = false.obs;
  var isDetailLoading = false.obs;
  var isAddLoading = false.obs;
  var isDeleteLoading = false.obs;
  var edit = false.obs;
  var errorMsg = ''.obs;
  var enquiryData = <EnquiryModel>[].obs;

  // Method to submit user enquiry
  void userEnquiry(
      BuildContext context,
      String name,
      String id,
      String Mobile,
      String email,
      String propertyId,
      ) async {
    try {
      isLoading(true);
      var data = await ApiServices.userEnquiry(
        name,
        id,
        Mobile,
        email,
        propertyId,
      );

      // Close any existing dialog
      Get.back();

      if (data != null) {
        enquiryData.value = [data];

        // Show success dialog instead of toast
        EnquirySuccessDialog.show(
          context: context,
          onClose: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        );
      } else {
        // Show error toast
        toast('Failed to submit enquiry. Please try again.');
      }
    } catch (e) {
      // Handle errors
      Get.back(); // Close loading dialog
      toast('An error occurred: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
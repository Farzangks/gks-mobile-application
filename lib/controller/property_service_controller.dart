import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/api/api_secvices.dart';
import 'package:ghar_ka_sathi/component/booking_success_dialog.dart';
import 'package:ghar_ka_sathi/model/sell_property_model.dart';
import 'package:ghar_ka_sathi/model/service_model.dart';
import 'package:ghar_ka_sathi/model/service_pricing_model.dart';
import 'package:itq_utils/itq_utils.dart';

class PropertyServiceController extends GetxController {
  var isLoading = false.obs;
  var isEnabled = false.obs;
  var isDetailLoading = false.obs;
  var isAddLoading = false.obs;
  var isDeleteLoading = false.obs;
  var edit = false.obs;
  var errorMsg = ''.obs;
  var serviceData = <ServiceModel>[].obs;
  var serviceByEmailData = <ServiceModel>[].obs;
  var getServicePricingList = <ServicePricingModel>[].obs;
  var sellPropertyData = <SellPropertyModel>[].obs;
  var showConfetti = false.obs;

  void propertyServices(
      BuildContext context,
      String name,
      String email,
      String mobile,
      String serviceType,
      String location,
      String date,
      String time,
      String category,
      String subCategory,
      String finalSelection,
      bool status, {
        Function? onSuccess,
        Function(String)? onError,
      }) async {
    try {
      isLoading(true);
      var data = await ApiServices.propertyServices(
          name,
          email,
          mobile,
          serviceType,
          location,
          date,
          time,
          category,
          subCategory,
          finalSelection,
          status
      );

      if (data != null) {
        serviceData.value = [data];
        // Don't show toast as we'll show a dialog instead
        Get.back(); // Close the current page

        // Show success dialog with confetti animation
        _showBookingSuccessDialog(
          context: context,
          serviceName: finalSelection,
          date: date,
          time: time,
        );

        if (onSuccess != null) onSuccess();
      } else {
        if (onError != null) onError('No data returned from server.');
        else toast('No data returned from server.');
      }
    } catch (e) {
      if (onError != null) onError(e.toString());
      else toast('An error occurred. Please try again.');
    } finally {
      isLoading(false);
    }
  }

  void _showBookingSuccessDialog({
    required BuildContext context,
    required String serviceName,
    required String date,
    required String time,
  }) {
    // Trigger confetti animation
    showConfetti(true);

    // Show the success dialog
    BookingSuccessDialog.show(
      context: context,
      serviceName: serviceName,
      date: date,
      time: time,
      onViewBookings: () {
        // Navigate to bookings page
        Get.back();
        Get.back();
        Get.back();
      },
      onClose: () {
        // Navigate back to home or main menu
        Get.until((route) => route.isFirst);
        showConfetti(false);
      },
    );

    // Stop confetti after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      showConfetti(false);
    });
  }

  void getPropertyServicesByEmail(
      BuildContext context,
      String email, {
        Function? onSuccess,
        Function(String)? onError,
      }) async {
    try {
      isLoading(true);
      var data = await ApiServices.getPropertyServicesByEmail(
        email,
      );

      if (data != null) {
        serviceByEmailData.value = data;
        if (onSuccess != null) onSuccess();
      } else {
        if (onError != null) onError('No data returned from server.');
        else toast('No data returned from server.');
      }
    } catch (e) {
      if (onError != null) onError(e.toString());
      else toast('An error occurred. Please try again.');
    } finally {
      isLoading(false);
    }
  }

  // Helper method to get the status from the service model
  String getBookingStatus(ServiceModel service) {
    DateTime bookingDate = DateTime.parse(service.date);
    DateTime now = DateTime.now();

    // If payment is pending, status is pending
    if (service.paymentStatus == "pending") {
      return "Pending";
    }

    // If payment is completed but date is in future
    if (service.paymentStatus == "completed" && bookingDate.isAfter(now)) {
      return "Upcoming";
    }

    // If date is today or in the past but not more than 1 day old
    if (bookingDate.isBefore(now.add(Duration(days: 1))) &&
        bookingDate.isAfter(now.subtract(Duration(days: 1)))) {
      return "Ongoing";
    }

    // If date is in the past and more than 1 day old
    if (bookingDate.isBefore(now.subtract(Duration(days: 1)))) {
      return "Completed";
    }

    // Default status
    return "Pending";
  }

  // Get the corresponding icon for service type
  IconData getServiceIcon(String serviceType) {
    switch (serviceType.toLowerCase()) {
      case 'cleaning services':
        return Icons.cleaning_services;
      case 'electronic appliances':
        return Icons.electrical_services;
      case 'plumbing services':
        return Icons.plumbing;
      case 'painting services':
        return Icons.format_paint;
      case 'carpentry work':
        return Icons.handyman;
      case 'electrical services':
        return Icons.electric_bolt;
      default:
        return Icons.home_repair_service;
    }
  }

  // Get color for status
  Color getStatusColor(String status) {
    switch (status) {
      case 'Ongoing':
        return Colors.green;
      case 'Completed':
        return Colors.grey;
      case 'Pending':
        return Colors.orange;
      case 'Canceled':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  void getServicePricing({
    Function? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      isLoading(true);
      var data = await ApiServices.getServicePricing();
      if (data != null) {
        getServicePricingList.value = [data];
        errorMsg.value = '';
        if (onSuccess != null) onSuccess();
      } else {
        errorMsg.value = 'Service pricing details not found!';
        if (onError != null) onError('Service pricing details not found!');
      }
    } catch (e) {
      errorMsg.value = e.toString();
      if (onError != null) onError(e.toString());
    } finally {
      isLoading(false);
      isAddLoading(false);
    }
  }

  void sellProperty(
      BuildContext context,
      String name,
      String email,
      String mobile,
      String serviceType,
      String location,
      String image, {
        Function? onSuccess,
        Function(String)? onError,
      }) async {
    try {
      isLoading(true);
      var data = await ApiServices.sellProperty(
          name,
          email,
          mobile,
          serviceType,
          location,
          image
      );

      if (data != null) {
        sellPropertyData.value = [data];
        toast('Property Listed Successfully');
        if (onSuccess != null) onSuccess();
      } else {
        if (onError != null) onError('Failed to list property. Please try again.');
        else toast('Failed to list property. Please try again.');
      }
    } catch (e) {
      if (onError != null) onError(e.toString());
      else toast('An error occurred. Please try again.');
    } finally {
      isLoading(false);
      Get.back();
    }
  }
}
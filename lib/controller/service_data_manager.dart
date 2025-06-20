// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/route_manager.dart';
// import 'package:ghar_ka_sathi/controller/property_service_controller.dart';
// import 'package:ghar_ka_sathi/model/service_model.dart';
// import 'package:ghar_ka_sathi/src/in_home_services/cleaning_details_screen.dart';
// import 'package:ghar_ka_sathi/src/in_home_services/service_bottom_sheet_components.dart';
// import 'package:ghar_ka_sathi/src/in_home_services/order_summary_screen.dart';
// import 'package:ghar_ka_sathi/utils/colors_res.dart';
// import 'package:ghar_ka_sathi/utils/constant.dart';
// import 'package:itq_utils/itq_utils.dart';
//
// // This is a utility class to handle data passing between screens
// class ServiceDataManager {
//   // Singleton pattern
//   static final ServiceDataManager _instance = ServiceDataManager._internal();
//   factory ServiceDataManager() => _instance;
//   ServiceDataManager._internal();
//
//   // Service booking data
//   final Rx<Map<String, dynamic>> bookingData = Rx<Map<String, dynamic>>({
//     'name': '',
//     'email': '',
//     'mobile': '',
//     'serviceType': '',
//     'location': '',
//     'date': DateTime.now().toString(),
//     'time': '',
//     'category': '',
//     'subCategory': '',
//     'finalSelection': '',
//     'status': false,
//     'price': 0.0,
//   });
//
//   // Update booking data
//   void updateBookingData(Map<String, dynamic> newData) {
//     bookingData.update((val) {
//       if (val != null) {
//         val.addAll(newData);
//       }
//       return val;
//     });
//   }
//
//   // Clear booking data
//   void clearBookingData() {
//     bookingData.value = {
//       'name': '',
//       'email': '',
//       'mobile': '',
//       'serviceType': '',
//       'location': '',
//       'date': DateTime.now().toString(),
//       'time': '',
//       'category': '',
//       'subCategory': '',
//       'finalSelection': '',
//       'status': false,
//       'price': 0.0,
//     };
//   }
//
//   // Format order data for the order summary screen
//   Map<String, dynamic> getOrderSummaryData() {
//     final data = bookingData.value;
//     return {
//       'serviceName': data['subCategory'] ?? 'Home Service',
//       'servicePrice': '₹${data['price'].toString()}',
//       'serviceCategory': data['category'] ?? 'Home Services',
//       'serviceSubcategory': data['subCategory'] ?? 'Cleaning Services',
//       'itemTotal': '₹${data['price'].toString()}',
//       'convenienceFee': '₹${(data['price'] * 0.03).toStringAsFixed(2)}',
//       'totalAmount': '₹${(data['price'] * 1.03).toStringAsFixed(2)}',
//       'advancePayment': '₹${(data['price'] * 0.2).toStringAsFixed(2)}',
//       'cashOnService': '₹${(data['price'] * 0.83).toStringAsFixed(2)}',
//       'cancellationPolicy': 'Free cancellation until 4 hours before the scheduled service. Cancellations made less than 4 hours before the service will incur a 50% charge.',
//     };
//   }
// }
//
// // Extension method to update ServiceCard
// extension ServiceCardExtension on ServiceCard {
//   // This method passes data from ServiceCard to ServiceBottomSheetComponents
//   void openServiceBottomSheet(BuildContext context) {
//     final dataManager = ServiceDataManager();
//
//     // Update the booking data with service card info
//     dataManager.updateBookingData({
//       'subCategory': title,
//       'category': serviceCategory,
//       'price': double.tryParse(price) ?? 0.0,
//     });
//
//     showModalBottomSheet(
//       useSafeArea: true,
//       isScrollControlled: true,
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (context) => ServiceBottomSheetComponents(
//         serviceCategoryItem: title,
//         serviceCategory: serviceCategory,
//         serviceType: serviceTypeList,
//         projectTypes: projectSizeList,
//       ),
//     );
//   }
// }
//
// // Extension method for ServiceBottomSheetComponents
// extension ServiceBottomSheetExtension on ServiceBottomSheetComponents {
//   // This method handles the booking action and data passing to OrderSummaryScreen
//   void handleBookService() {
//     final dataManager = ServiceDataManager();
//     final controller = PropertyServiceController();
//
//     // Format service type string
//     String finalServiceType = "${widget.serviceCategory ?? ''}:${widget.serviceCategoryItem ?? ''}";
//
//     if (_selectedServiceType != null) {
//       finalServiceType += "(${_selectedServiceType})";
//     }
//
//     if (_selectedProjectType != null) {
//       finalServiceType += "(${_selectedProjectType})";
//     }
//
//     // Update booking data with selection and user info
//     dataManager.updateBookingData({
//       'name': getStringAsync(userName),
//       'email': getStringAsync(emailMobile),
//       'mobile': getStringAsync(emailMobile),
//       'serviceType': finalServiceType,
//       'finalSelection': "${_selectedServiceType ?? ''} ${_selectedProjectType ?? ''}",
//       'date': _selectedDate.toString(),
//       'time': formatTimeOfDay(_selectedTime),
//       'price': _price,
//     });
//
//     // Navigate to OrderSummaryScreen
//     Get.to(() => OrderSummaryScreen(
//       orderData: dataManager.getOrderSummaryData(),
//     ));
//
//     if (widget.onActionPressed != null) {
//       widget.onActionPressed!(_selectedServiceType, _selectedProjectType);
//     }
//   }
// }
//
// // Extension method for OrderSummaryScreen
// extension OrderSummaryExtension on _OrderSummaryScreenState {
//   // This method finalizes the booking and sends data to API
//   void proceedToPayment() {
//     final dataManager = ServiceDataManager();
//     final controller = PropertyServiceController();
//     final data = dataManager.bookingData.value;
//
//     // Add the selected address to booking data
//     if (selectedAddress != null) {
//       dataManager.updateBookingData({
//         'location': selectedAddress!.fullAddress,
//       });
//     }
//
//     // Call the API service
//     // controller.propertyServices(
//     //   context,
//       data['name'],
//       data['email'],
//       data['mobile'],
//       data['serviceType'],
//       data['location'],
//       data['date'],
//       data['time'],
//       category: data['category'],
//       subCategory: data['subCategory'],
//       finalSelection: data['finalSelection'],
//     );
//
//     // Show success message
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Booking successful!')),
//     );
//
//     // Clear booking data after successful booking
//     dataManager.clearBookingData();
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarouselsController extends GetxController {
  final String apiUrl = 'https://backend-gharkasathi.onrender.com/api/properties/getAllCarousels';

  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var hasError = false.obs;

  // Observable lists for each carousel type
  var homeUrls = <String>[].obs;
  var builderUrls = <String>[].obs;
  var residentialUrls = <String>[].obs;
  var commercialUrls = <String>[].obs;
  var agriculturalUrls = <String>[].obs;
  var real_estateUrls = <String>[].obs;
  var in_houseUrls = <String>[].obs;
  var home_InteriorUrls = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCarouselData();
  }

  Future<void> fetchCarouselData() async {
    try {
      isLoading(true);
      hasError(false);
      errorMessage('');

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData['message'] == 'Carousel data retrieved successfully' &&
            jsonData['data'] != null) {
          final data = jsonData['data'];

          // Update the observable lists with validation (no fallback)
          _updateListSafely(homeUrls, data['homeUrls']);
          _updateListSafely(builderUrls, data['builderUrls']);
          _updateListSafely(residentialUrls, data['residentialUrls']);
          _updateListSafely(commercialUrls, data['commercialUrls']);
          _updateListSafely(agriculturalUrls, data['agriculturalUrls']);
          _updateListSafely(real_estateUrls, data['real_estateUrls']);
          _updateListSafely(in_houseUrls, data['in_houseUrls']);
          _updateListSafely(home_InteriorUrls, data['home_InteriorUrls']);

          print('✅ Carousel data loaded successfully');
        } else {
          throw Exception('Invalid API response format');
        }
      } else if (response.statusCode == 503) {
        throw Exception('Service temporarily unavailable (503)');
      } else {
        throw Exception('HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      hasError(true);
      errorMessage('Failed to load carousel data: $e');
      print('❌ Carousel API Error: $e');

      // Clear all lists when API fails - no fallback images
      _clearAllCarouselLists();
    } finally {
      isLoading(false);
    }
  }

  // Safely update lists with validation (no fallback)
  void _updateListSafely(RxList<String> targetList, dynamic sourceData) {
    if (sourceData != null && sourceData is List && sourceData.isNotEmpty) {
      // Validate URLs and filter out invalid ones
      final validUrls = sourceData
          .where((url) => url != null && url.toString().trim().isNotEmpty)
          .map((url) => url.toString())
          .toList();

      if (validUrls.isNotEmpty) {
        targetList.assignAll(validUrls);
      } else {
        targetList.clear(); // Clear if no valid URLs
      }
    } else {
      targetList.clear(); // Clear if source data is invalid
    }
  }

  // Clear all carousel lists when API fails
  void _clearAllCarouselLists() {
    homeUrls.clear();
    builderUrls.clear();
    residentialUrls.clear();
    commercialUrls.clear();
    agriculturalUrls.clear();
    real_estateUrls.clear();
    in_houseUrls.clear();
    home_InteriorUrls.clear();
  }

  // Retry mechanism
  Future<void> retryFetchCarouselData() async {
    await fetchCarouselData();
  }

  // Check if a specific carousel has data
  bool hasCarouselData(String carouselType) {
    switch (carouselType) {
      case 'home':
        return homeUrls.isNotEmpty;
      case 'in_house':
        return in_houseUrls.isNotEmpty;
      case 'home_interior':
        return home_InteriorUrls.isNotEmpty;
      case 'builder':
        return builderUrls.isNotEmpty;
      case 'residential':
        return residentialUrls.isNotEmpty;
      case 'commercial':
        return commercialUrls.isNotEmpty;
      case 'agricultural':
        return agriculturalUrls.isNotEmpty;
      case 'real_estate':
        return real_estateUrls.isNotEmpty;
      default:
        return false;
    }
  }

  // Get carousel URLs for a specific type
  List<String> getCarouselUrls(String carouselType) {
    switch (carouselType) {
      case 'home':
        return homeUrls.value;
      case 'in_house':
        return in_houseUrls.value;
      case 'home_interior':
        return home_InteriorUrls.value;
      case 'builder':
        return builderUrls.value;
      case 'residential':
        return residentialUrls.value;
      case 'commercial':
        return commercialUrls.value;
      case 'agricultural':
        return agriculturalUrls.value;
      case 'real_estate':
        return real_estateUrls.value;
      default:
        return [];
    }
  }
}
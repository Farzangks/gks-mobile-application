import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/model/rent_property_model.dart';
import 'package:ghar_ka_sathi/src/property_categories/property_list_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/custom_widget.dart';
import 'package:ghar_ka_sathi/src/section_title.dart';
import 'package:ghar_ka_sathi/src/search_filter_dropdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:itq_utils/itq_utils.dart';
import 'package:lottie/lottie.dart';

// Define property search controller
class PropertySearchController extends GetxController {
  var isLoading = false.obs;
  var searchResults = <dynamic>[].obs;
  var searchQuery = ''.obs;
  var searchCategory = 'All'.obs;
  var searchLocation = ''.obs;
  var errorMessage = ''.obs;
  var recentSearches = <String>[].obs;
  var showSearchResults = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some recent searches
    recentSearches.value = [
      'Residential Land',
      'House',
      'Apartment',
      'Commercial Space',
      'Office Space'
    ];
  }

  Future<void> searchProperties({
    String? name,
    String? category,
    String? location,
  }) async {
    try {
      isLoading(true);
      errorMessage('');
      showSearchResults(true);

      // Build the query parameters
      Map<String, String> queryParams = {};
      if (name != null && name.isNotEmpty) {
        queryParams['name'] = name;
        searchQuery.value = name;
      }
      if (category != null && category.isNotEmpty && category != 'All') {
        queryParams['category'] = category;
      }
      if (location != null && location.isNotEmpty) {
        queryParams['location'] = location;
      }

      // Save to recent searches if name is provided
      if (name != null && name.isNotEmpty) {
        if (!recentSearches.contains(name)) {
          if (recentSearches.length >= 5) {
            recentSearches.removeLast();
          }
          recentSearches.insert(0, name);
        }
      }

      // Build the URL with query parameters
      final Uri uri = Uri.parse('https://backend-gharkasathi.onrender.com/api/properties/search')
          .replace(queryParameters: queryParams);

      // Make the API call
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        searchResults.value = data;
        print("searchResults.value");
        print(searchResults.value);
        if (data.isEmpty) {
          errorMessage('No properties found matching your search.');
        }
      } else {
        errorMessage('Failed to load properties. Please try again.');
      }
    } catch (e) {
      errorMessage('An error occurred. Please check your internet connection.');
      print('Error searching properties: $e');
    } finally {
      isLoading(false);
    }
  }

  void clearSearch() {
    searchQuery.value = '';
    searchResults.clear();
    showSearchResults(false);
    errorMessage('');
  }
}
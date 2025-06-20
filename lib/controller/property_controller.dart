import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/api/api_secvices.dart';
import 'package:ghar_ka_sathi/model/property_by_categories_model.dart';
import 'package:ghar_ka_sathi/model/rent_property_model.dart';
import 'package:ghar_ka_sathi/utils/static_property_data.dart'; // Import the static data helper

class PropertyController extends GetxController {
  var isLoading = false.obs;
  var isEnabled = false.obs;
  var isDetailLoading = false.obs;
  var isAddLoading = false.obs;
  var isDeleteLoading = false.obs;
  var edit = false.obs;
  var errorMsg = ''.obs;
  var allPropertyList = <PropertyRentModel>[].obs;
  var propertyByCatList = <PropertyByCategoriesModel>[].obs;
  var isUsingStaticData = false.obs; // Track if we're using static data

  @override
  void onInit() {
    super.onInit();
    getAllProperties();
  }

  void getAllProperties() async {
    try {
      isLoading(true);
      isUsingStaticData(false);
      errorMsg.value = '';

      var data = await ApiServices.getAllProperties();

      if (data != null && data.data.isNotEmpty) {
        print('API Data loaded successfully: ${data.data.length} properties');
        allPropertyList.value = [data];
        errorMsg.value = '';
      } else {
        print('API data is empty or null, loading static data');
        // Load static data when API data is empty or null
        _loadStaticData();
      }
    } catch (e) {
      print('Error loading API data: $e, loading static data');
      // Load static data on error
      _loadStaticData();
    } finally {
      isLoading(false);
      isAddLoading(false);
    }
  }

  void _loadStaticData() {
    try {
      var staticData = StaticPropertyData.getStaticPropertyRentModel();
      allPropertyList.value = [staticData];
      isUsingStaticData(true);
      errorMsg.value = '';
      print('Static data loaded successfully: ${staticData.data.length} properties');
    } catch (e) {
      print('Error loading static data: $e');
      errorMsg.value = 'Unable to load property data';
    }
  }

  void getPropertiesByCategories(
      BuildContext context,
      String category) async {
    try {
      isLoading(true);
      print('Loading properties for category: $category');

      var data = await ApiServices.getPropertiesByCategories(category);
      if (data != null && data.isNotEmpty) {
        propertyByCatList.value = data;
        errorMsg.value = '';
        print('Category data loaded successfully: ${data.length} properties');
      } else {
        // Filter static data by category if API fails
        print('API category data is empty, loading static category data');
        _filterStaticDataByCategory(category);
      }
    } catch (e) {
      print('Error loading category data: $e, using static data');
      _filterStaticDataByCategory(category);
    } finally {
      isLoading(false);
      isAddLoading(false);
    }
  }

  void _filterStaticDataByCategory(String category) {
    try {
      var filteredProperties = StaticPropertyData.filterStaticPropertiesByCategory(category);

      if (filteredProperties.isNotEmpty) {
        propertyByCatList.value = filteredProperties;
        isUsingStaticData(true);
        errorMsg.value = '';
        print('Static category data loaded: ${filteredProperties.length} properties');
      } else {
        // If no properties match the category, load all static data as PropertyRentModel
        _loadStaticData();
        errorMsg.value = 'No properties found for category: $category';
      }
    } catch (e) {
      print('Error filtering static data: $e');
      errorMsg.value = 'Unable to load category data';
    }
  }

  // Method to refresh and try API again
  void refreshData() {
    print('Refreshing data...');
    getAllProperties();
  }

  // Method to force load static data (for testing)
  void loadStaticDataForTesting() {
    print('Loading static data for testing...');
    _loadStaticData();
  }

  // Check if data is available (either API or static)
  bool get hasData => allPropertyList.isNotEmpty;

  // Check if category data is available
  bool get hasCategoryData => propertyByCatList.isNotEmpty;

  // Get status message for UI
  String get dataSourceInfo {
    if (isUsingStaticData.value) {
      return 'Showing sample properties (offline mode)';
    }
    return '';
  }

  // Get total number of properties
  int get totalProperties {
    if (allPropertyList.isNotEmpty) {
      return allPropertyList.first.totalProperties;
    }
    return 0;
  }

  // Get current page info
  String get paginationInfo {
    if (allPropertyList.isNotEmpty) {
      final model = allPropertyList.first;
      return 'Page ${model.page} of ${model.totalPages} (${model.totalProperties} total)';
    }
    return '';
  }

  // Filter properties by type from current data
  List<PropertyRentResource> getPropertiesByType(String type) {
    if (allPropertyList.isEmpty) return [];

    return allPropertyList.first.data
        .where((property) => property.type.toLowerCase() == type.toLowerCase())
        .toList();
  }

  // Get property by ID
  PropertyRentResource? getPropertyById(String id) {
    if (allPropertyList.isEmpty) return null;

    try {
      return allPropertyList.first.data
          .firstWhere((property) => property.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search properties by name or location
  List<PropertyRentResource> searchProperties(String query) {
    if (allPropertyList.isEmpty) return [];

    final searchQuery = query.toLowerCase();
    return allPropertyList.first.data
        .where((property) =>
    property.name.toLowerCase().contains(searchQuery) ||
        property.location.toLowerCase().contains(searchQuery) ||
        property.detail.toLowerCase().contains(searchQuery)
    )
        .toList();
  }

  // Get properties within price range
  List<PropertyRentResource> getPropertiesByPriceRange(int minPrice, int maxPrice) {
    if (allPropertyList.isEmpty) return [];

    return allPropertyList.first.data
        .where((property) => property.price >= minPrice && property.price <= maxPrice)
        .toList();
  }

  // Clear all data
  void clearData() {
    allPropertyList.clear();
    propertyByCatList.clear();
    isUsingStaticData(false);
    errorMsg.value = '';
  }

  // Get formatted price string
  String getFormattedPrice(int price) {
    if (price >= 10000000) { // 1 crore
      double croreValue = price / 10000000;
      return '₹${croreValue.toStringAsFixed(1)} Cr';
    } else if (price >= 100000) { // 1 lakh
      double lakhValue = price / 100000;
      return '₹${lakhValue.toStringAsFixed(1)} L';
    } else if (price >= 1000) { // 1 thousand
      double thousandValue = price / 1000;
      return '₹${thousandValue.toStringAsFixed(1)} K';
    } else {
      return '₹$price';
    }
  }
}
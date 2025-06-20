import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/api/api_secvices.dart';
import 'package:ghar_ka_sathi/model/favorite_model.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:itq_utils/itq_utils.dart';

class FavoriteController extends GetxController {
  var isLoading = false.obs;
  var favorites = <FavoriteProperty>[].obs;
  var errorMsg = ''.obs;

  // Map to track favorite status of properties
  var favoritePropertyIds = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    getAllFavorites();
  }

  // Add a property to favorites
  Future<bool> addToFavorites(
      BuildContext context,
      String propertyId, {
        Function? onSuccess,
        Function(String)? onError,
      }) async {
    try {
      isLoading(true);
      String emailOrMobile = getStringAsync(emailMobile);

      var response = await ApiServices.addToFavorites(
        emailOrMobile,
        propertyId,
      );

      if (response != null && response.success) {
        favoritePropertyIds[propertyId] = true;
        getAllFavorites(); // Refresh the favorites list
        toast(response.message);
        if (onSuccess != null) onSuccess();
        return true;
      } else {
        if (onError != null) onError(response?.message ?? 'Failed to add to favorites');
        toast(response?.message ?? 'Failed to add to favorites');
        return false;
      }
    } catch (e) {
      if (onError != null) onError(e.toString());
      toast('An error occurred. Please try again.');
      return false;
    } finally {
      isLoading(false);
    }
  }

  // Remove a property from favorites
  Future<bool> removeFromFavorites(
      BuildContext context,
      String propertyId, {
        Function? onSuccess,
        Function(String)? onError,
      }) async {
    try {
      isLoading(true);
      String emailOrMobile = getStringAsync(emailMobile);

      var response = await ApiServices.removeFromFavorites(
        emailOrMobile,
        propertyId,
      );

      if (response != null && response.success) {
        favoritePropertyIds[propertyId] = false;
        favorites.removeWhere((property) => property.id == propertyId);
        toast(response.message);
        if (onSuccess != null) onSuccess();
        return true;
      } else {
        if (onError != null) onError(response?.message ?? 'Failed to remove from favorites');
        toast(response?.message ?? 'Failed to remove from favorites');
        return false;
      }
    } catch (e) {
      if (onError != null) onError(e.toString());
      toast('An error occurred. Please try again.');
      return false;
    } finally {
      isLoading(false);
    }
  }

  // Get all favorites
  Future<void> getAllFavorites() async {
    try {
      isLoading(true);
      String emailOrMobile = getStringAsync(emailMobile);

      if (emailOrMobile.isEmpty) {
        errorMsg.value = 'Please login to view favorites';
        return;
      }

      var response = await ApiServices.getAllFavorites(emailOrMobile);

      if (response != null && response.success && response.data != null) {
        favorites.value = response.data!;

        // Update favorite status map
        for (var favorite in favorites) {
          favoritePropertyIds[favorite.id] = true;
        }

        errorMsg.value = '';
      } else {
        favorites.clear();
        errorMsg.value = response?.message ?? 'No favorites found';
      }
    } catch (e) {
      if (kDebugMode) {
        print('GetAllFavorites Error: $e');
      }
      favorites.clear();
      errorMsg.value = e.toString();
    } finally {
      isLoading(false);
    }
  }

  // Check if a property is in favorites
  bool isPropertyFavorite(String propertyId) {
    return favoritePropertyIds[propertyId] ?? false;
  }

  // Toggle favorite status
  Future<void> toggleFavorite(BuildContext context, String propertyId) async {
    if (isPropertyFavorite(propertyId)) {
      await removeFromFavorites(context, propertyId);
    } else {
      await addToFavorites(context, propertyId);
    }
  }
}
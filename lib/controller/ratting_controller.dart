// lib/controllers/rating_controller.dart
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/api/api_secvices.dart';
import 'package:ghar_ka_sathi/model/ratting_model.dart';
import 'package:itq_utils/itq_utils.dart';

class RatingController extends GetxController {
  static RatingController get to => Get.find<RatingController>();

  // Observable variables
  final Map<String, Rx<RatingResponse?>> _ratingsCache = {};

  final RxBool isLoading = false.obs;
  final RxBool isSubmitting = false.obs;
  final RxString errorMessage = ''.obs;

  final RxDouble newRating = 4.0.obs;
  final RxInt currentPage = 1.obs;
  final RxBool hasMorePages = false.obs;

  // Getters for service-specific ratings
  RatingResponse? getRatingsForService(String serviceType) {
    if (!_ratingsCache.containsKey(serviceType)) {
      return null;
    }
    return _ratingsCache[serviceType]!.value;
  }

  double getAverageRatingForService(String serviceType) {
    if (!_ratingsCache.containsKey(serviceType) || _ratingsCache[serviceType]!.value == null) {
      return 0.0;
    }
    return _ratingsCache[serviceType]!.value!.averageRating;
  }

  int getTotalRatingsForService(String serviceType) {
    if (!_ratingsCache.containsKey(serviceType) || _ratingsCache[serviceType]!.value == null) {
      return 0;
    }
    return _ratingsCache[serviceType]!.value!.totalRatings;
  }

  List<Rating> getRatingListForService(String serviceType) {
    if (!_ratingsCache.containsKey(serviceType) || _ratingsCache[serviceType]!.value == null) {
      return [];
    }
    return _ratingsCache[serviceType]!.value!.ratings;
  }

  // Check if we have cached data for this service type
  bool hasCachedData(String serviceType) {
    return _ratingsCache.containsKey(serviceType) && _ratingsCache[serviceType]!.value != null;
  }

  // Load ratings for a specific service type
  Future<void> loadRatings(String serviceType, {bool refresh = false, int page = 1}) async {
    if (!refresh && hasCachedData(serviceType) && page == 1) {
      // Use cached data if available and not refreshing
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await ApiServices.getRatings(serviceType, page: page);

      if (result != null) {
        if (page == 1 || !_ratingsCache.containsKey(serviceType)) {
          // Initialize or replace the cache for this service type
          _ratingsCache[serviceType] = Rx<RatingResponse?>(result);
        } else {
          // Append new data to existing cache for pagination
          final existingData = _ratingsCache[serviceType]!.value!;
          final updatedRatings = [...existingData.ratings, ...result.ratings];

          final updatedResponse = RatingResponse(
            totalRatings: result.totalRatings,
            ratingSummary: result.ratingSummary,
            ratings: updatedRatings,
            currentPage: result.currentPage,
            totalPages: result.totalPages,
            averageRating: result.averageRating,
          );

          _ratingsCache[serviceType]!.value = updatedResponse;
        }

        currentPage.value = result.currentPage;
        hasMorePages.value = result.currentPage < result.totalPages;
      } else {
        if (page == 1) {
          // Only set error for initial load, not for pagination
          errorMessage.value = 'Failed to load ratings. Please try again.';
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading ratings: $e');
      }
      errorMessage.value = 'An error occurred while loading ratings.';
    } finally {
      isLoading.value = false;
    }
  }

  // Load more ratings (pagination)
  Future<void> loadMoreRatings(String serviceType) async {
    if (!hasMorePages.value || isLoading.value) return;

    await loadRatings(serviceType, page: currentPage.value + 1);
  }

  // Update these methods in your RatingController class
// lib/controller/ratting_controller.dart

// Submit a new rating
  Future<bool> submitRating({
    required String name,
    required String email,
    required String comments,
    required double rating,
    required String serviceType,
  }) async {
    try {
      isSubmitting.value = true;
      errorMessage.value = '';

      final result = await ApiServices.submitRating(
        name: name,
        email: email,
        comments: comments,
        rating: rating,
        serviceType: serviceType,
      );

      if (result != null) {
        // Check for success message
        if (result.containsKey('message')) {
          // Show success message
          toast(result['message'] ?? 'Rating submitted successfully!');

          // Refresh the ratings to include the new one
          await loadRatings(serviceType, refresh: true);
          return true;
        } else {
          // Handle other response formats
          toast('Rating submitted successfully!');
          await loadRatings(serviceType, refresh: true);
          return true;
        }
      } else {
        errorMessage.value = 'Failed to submit rating. Please try again.';
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error submitting rating: $e');
      }
      errorMessage.value = 'An error occurred while submitting your rating.';
      return false;
    } finally {
      isSubmitting.value = false;
    }
  }

// Update an existing rating
  Future<bool> updateRating({
    required String ratingId,
    required String name,
    required String email,
    required String comments,
    required double rating,
    required String serviceType,
  }) async {
    try {
      isSubmitting.value = true;
      errorMessage.value = '';

      final result = await ApiServices.updateRating(
        ratingId: ratingId,
        name: name,
        email: email,
        comments: comments,
        rating: rating,
        serviceType: serviceType,
      );

      if (result != null) {
        // Check for success message
        if (result.containsKey('message')) {
          // Show success message
          toast(result['message'] ?? 'Rating updated successfully!');

          // Refresh the ratings
          await loadRatings(serviceType, refresh: true);
          return true;
        } else {
          // Handle other response formats
          toast('Rating updated successfully!');
          await loadRatings(serviceType, refresh: true);
          return true;
        }
      } else {
        errorMessage.value = 'Failed to update rating. Please try again.';
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating rating: $e');
      }
      errorMessage.value = 'An error occurred while updating your rating.';
      return false;
    } finally {
      isSubmitting.value = false;
    }
  }

// Delete a rating
  Future<bool> deleteRating(String ratingId, String serviceType) async {
    try {
      isSubmitting.value = true;
      errorMessage.value = '';

      final result = await ApiServices.deleteRating(ratingId);

      if (result != null) {
        // Check for success message
        if (result.containsKey('message')) {
          // Show success message
          toast(result['message'] ?? 'Rating deleted successfully!');

          // Refresh the ratings
          await loadRatings(serviceType, refresh: true);
          return true;
        } else {
          // Handle other response formats
          toast('Rating deleted successfully!');
          await loadRatings(serviceType, refresh: true);
          return true;
        }
      } else {
        errorMessage.value = 'Failed to delete rating. Please try again.';
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting rating: $e');
      }
      errorMessage.value = 'An error occurred while deleting the rating.';
      return false;
    } finally {
      isSubmitting.value = false;
    }
  }

  // Clear cached data for testing or when needed
  void clearCache([String? serviceType]) {
    if (serviceType != null) {
      _ratingsCache.remove(serviceType);
    } else {
      _ratingsCache.clear();
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Could pre-load common service types here if needed
  }
}
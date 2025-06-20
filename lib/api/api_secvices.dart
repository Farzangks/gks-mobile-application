import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ghar_ka_sathi/api/api_strings.dart';
import 'package:ghar_ka_sathi/model/common_model.dart';
import 'package:ghar_ka_sathi/model/contact_us_model.dart';
import 'package:ghar_ka_sathi/model/enquiry_model.dart';
import 'package:ghar_ka_sathi/model/favorite_model.dart';
import 'package:ghar_ka_sathi/model/login_model.dart';
import 'package:ghar_ka_sathi/model/property_by_categories_model.dart';
import 'package:ghar_ka_sathi/model/ratting_model.dart';
import 'package:ghar_ka_sathi/model/rent_property_model.dart';
import 'package:ghar_ka_sathi/model/sell_property_model.dart';
import 'package:ghar_ka_sathi/model/send_otp_model.dart';
import 'package:ghar_ka_sathi/model/service_model.dart';
import 'package:ghar_ka_sathi/model/service_pricing_model.dart';
import 'package:ghar_ka_sathi/utils/globle_functions.dart';
import 'package:itq_utils/itq_utils.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// HTTP Status codes
class HttpStatus {
  static const int ok = 200;
  static const int created = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int tooManyRequests = 429;
  static const int internalServerError = 500;
}

class ApiServices {
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'https://backend-gharkasathi.onrender.com',
      validateStatus: (status) {
        return status! < 500;
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
      headers: {
        'Accept': 'application/json',
      },
    ),
  );

  static void init() {
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
      ));
    }
  }

  static Future<bool> _checkInternetConnection() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> _handleRequest(
      String path,
      Map<String, dynamic>? data,
      Options? options,
      String method, {
        FormData? formData,
        int maxRetries = 3,
        Duration retryDelay = const Duration(seconds: 2),
      }) async {
    if (!await _checkInternetConnection()) {
      toast('No internet connection. Please check your network settings.');
      return null;
    }
    int retryCount = 0;
    while (retryCount < maxRetries) {
      try {
        late Response response;
        final requestOptions = options ?? Options();
        requestOptions.headers ??= <String,String>{};
        requestOptions.headers!.addAll(<String,String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });

        switch (method) {
          case ApiMethods.get:
            response = await dio.get(path, options: requestOptions);
            break;
          case ApiMethods.post:
            response = await dio.post(
              path,
              data: data ?? formData,
              options: requestOptions,
            );
            break;
          case ApiMethods.put:
            response = await dio.put(
              path,
              data: data ?? formData,
              options: requestOptions,
            );
            break;
          case ApiMethods.delete:
            response = await dio.delete(
              path,
              data: data ?? formData,
              options: requestOptions,
            );
            break;
          default:

            throw Exception('Invalid HTTP method');
        }

        if (response.statusCode == 201 || response.statusCode == 200) {
          final result = response.data;
          return result != null
              ? result is String
              ? result
              : jsonEncode(result)
              : null;
        } else if (response.statusCode == 429) {
          if (retryCount < maxRetries - 1) {
            await Future.delayed(retryDelay * (retryCount + 1));
            retryCount++;
            continue;
          }
        } else if (response.statusCode == 400) {
          _handleBadRequestError(response.data);
        }
        return null;

      } on DioException catch (e) {
        if (kDebugMode) {
          print('DioException: ${e.message}');
          print('DioError Type: ${e.type}');
          print('DioError Response: ${e.response}');
        }

        if (_shouldRetry(e) && retryCount < maxRetries - 1) {
          await Future.delayed(retryDelay * (retryCount + 1));
          retryCount++;
          continue;
        }

        _handleDioError(e);
        return null;

      } catch (e) {
        if (kDebugMode) {
          print('Unexpected error: $e');
        }
        if (retryCount < maxRetries - 1) {
          await Future.delayed(retryDelay * (retryCount + 1));
          retryCount++;
          continue;
        }
        toast('An unexpected error occurred. Please try again.');
        return null;
      }
    }
    return null;
  }

  static bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.connectionError;
  }

  static void _handleDioError(DioException error) {
    String message;
    switch (error.type) {
      case DioExceptionType.connectionError:
        message = 'Connection failed. Please check your internet connection and try again.';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout. Please try again.';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Request timeout. Please try again.';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Server not responding. Please try again.';
        break;
      case DioExceptionType.badResponse:
        message = 'Server error. Please try again later.';
        break;
      default:
        message = 'Network error. Please try again.';
    }
    toast(message);
  }

  static void _handleBadRequestError(dynamic errorData) {
    if (errorData is Map<String, dynamic>) {
      final List<String> errorMessages = [];

      if (errorData.containsKey('email')) {
        errorMessages.add(errorData['email'][0]);
      }
      if (errorData.containsKey('phone_number')) {
        errorMessages.add(errorData['phone_number'][0]);
      }

      if (errorMessages.isNotEmpty) {
        toast(errorMessages.join(' and '));
      }
    }
  }

  // User Login/SignIn
  static Future<LoginModel?> userSignIn(
      String emailOrMobile,
      String password,
      ) async {
    final data = {
      ApiVariables.emailOrMobile: emailOrMobile,
      ApiVariables.password: password,
    };

    if (kDebugMode) {
      print('Login Request Data: $data');
    }

    try {
      final result = await _handleRequest(
        ApiStrings.userLogin,
        data,
        Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('Login Response: $result');
      }

      return result != null ? loginModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('Login Error: $e');
      }
      return null;
    }
  }

  static Future<SendOtpModel?> getOtp(String emailOrMobile) async {
    if (kDebugMode) {
      print('GetOTP Request Data: $emailOrMobile');
    }

    try {
      final data = {
        ApiVariables.emailOrMobile: emailOrMobile,
      };

      final result = await _handleRequest(
        ApiStrings.sentOtp,
        data,
        Options(headers: {
          'Content-Type': 'application/json',
        }),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('GetOTP Response: $result');
      }

      return result != null ? sendOtpModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('GetOTP Error: $e');
      }
      return null;
    }
  }
  static Future<SendOtpModel?> getOtpForLogin(
      String emailOrMobile,
      ) async {
    final data = {
      ApiVariables.emailOrMobile: emailOrMobile,
    };
    final result =
    await _handleRequest(ApiStrings.sentOtp, data, null, ApiMethods.post);
    return result != null ? sendOtpModelFromJson(jsonEncode(result)) : null;
  }
  static Future<CommonModel?> verifyOtp(
      String emailOrMobile,
      String otp,
      String newPassword,
      ) async {
    if (kDebugMode) {
      print('VerifyOTP Request Data: $emailOrMobile, $otp, $newPassword');
    }

    try {
      final data = {
        ApiVariables.emailOrMobile: emailOrMobile,
        ApiVariables.otp: otp,
        ApiVariables.newPassword: newPassword,
      };

      final result = await _handleRequest(
        ApiStrings.sentOtp,
        data,
        Options(headers: {
          'Content-Type': 'application/json',
        }),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('VerifyOTP Response: $result');
      }

      return result != null ? commonModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('VerifyOTP Error: $e');
      }
      return null;
    }
  }
  static Future<CommonModel?> verifyOtpForPhone(
      String otp,
      ) async {
    final data = {
      ApiVariables.otp: otp,
    };
    final result =
    await _handleRequest(ApiStrings.sentOtp, data, null, ApiMethods.post);
    return result != null ? commonModelFromJson(jsonEncode(result)) : null;
  }
  static Future<LoginModel?> userRegistration(
      String userName,
      String emailOrMobile,
      String password,
      ) async {
    if (kDebugMode) {
      print('Registration Request Data: $userName, $emailOrMobile');
    }

    try {
      final data = {
        ApiVariables.username: userName,
        ApiVariables.emailOrMobile: emailOrMobile,
        ApiVariables.password: password,
      };

      final result = await _handleRequest(
        ApiStrings.userRegistration,
        data,
        Options(headers: {
          'Content-Type': 'application/json',
        }),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('Registration Response: $result');
      }

      return result != null ? loginModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('Registration Error: $e');
      }
      return null;
    }
  }

  static Future<PropertyRentModel?> getAllProperties() async {
    if (kDebugMode) {
      print('GetAllProperties Request');
    }

    try {
      final result = await _handleRequest(
        ApiStrings.properties,
        null,
        Options(headers: GlobalFunction.setHeader()),
        ApiMethods.get,
      );

      if (kDebugMode && result != null) {
        print('GetAllProperties Response: $result');
      }

      return result != null ? propertyRentModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('GetAllProperties Error: $e');
      }
      return null;
    }
  }

  static Future<List<PropertyByCategoriesModel>?> getPropertiesByCategories(
      String category,
      ) async {
    if (kDebugMode) {
      print('GetPropertiesByCategories Request Data: $category');
    }

    try {
      final data = {
        ApiVariables.category: category,
      };

      final result = await _handleRequest(
        ApiStrings.PropertyByCategories,
        data,
        Options(headers: GlobalFunction.setHeader()),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('GetPropertiesByCategories Response: $result');
      }

      return result != null ? propertyByCategoriesModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('GetPropertiesByCategories Error: $e');
      }
      return null;
    }
  }

  static Future<ServiceModel?> propertyServices(
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
      bool status,
      ) async {
    if (kDebugMode) {
      print('PropertyServices Request Data: $name, $email, $serviceType');
    }

    try {
      final data = {
        ApiVariables.name: name,
        ApiVariables.email: email,
        ApiVariables.serviceMobile: mobile,
        ApiVariables.serviceType: serviceType,
        ApiVariables.location: location,
        ApiVariables.date: date,
        ApiVariables.time: time,
        ApiVariables.category: category,
        ApiVariables.subCategory: subCategory,
        ApiVariables.finalSelection: finalSelection,
        ApiVariables.status: status,
      };

      final result = await _handleRequest(
        ApiStrings.services,
        data,
        Options(headers: GlobalFunction.setHeader()),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('PropertyServices Response: $result');
      }

      return result != null ? serviceModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('PropertyServices Error: $e');
      }
      return null;
    }
  }

  static Future<List<ServiceModel>?> getPropertyServicesByEmail(String email) async {
    if (kDebugMode) {
      print('GetPropertyServicesByEmail Request Data: $email');
    }

    try {
      final data = {
        ApiVariables.email: email,
      };

      // Make sure we're sending the right email to the API
      if (kDebugMode) {
        print('Sending email to services-by-email API: $email');
      }

      final result = await _handleRequest(
        ApiStrings.getPropertyServicesByEmail,
        data,
        Options(headers: GlobalFunction.setHeader()),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('GetPropertyServicesByEmail Response: $result');
      }

      // If we get an empty array, return an empty list rather than null
      if (result == "[]") {
        return [];
      }

      return result != null ? serviceModelListFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('GetPropertyServicesByEmail Error: $e');
      }
      return null;
    }
  }

  static Future<ServicePricingModel?> getServicePricing() async {
    if (kDebugMode) {
      print('GetServicePricing Request');
    }

    try {
      final result = await _handleRequest(
        ApiStrings.servicesPricing,
        null,
        Options(headers: GlobalFunction.setHeader()),
        ApiMethods.get,
      );

      if (kDebugMode && result != null) {
        print('GetServicePricing Response: $result');
      }

      return result != null ? servicePricingModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('GetServicePricing Error: $e');
      }
      return null;
    }
  }

  static Future<SellPropertyModel?> sellProperty(
      String name,
      String email,
      String mobile,
      String propertyType,
      String location,
      String imagePath,
      ) async {
    if (kDebugMode) {
      print('SellProperty Request Data: $name, $email, $propertyType, $imagePath');
    }

    try {
      // Create MultipartFile from the image path
      final File imageFile = File(imagePath);
      if (!await imageFile.exists()) {
        if (kDebugMode) {
          print('Image file does not exist at path: $imagePath');
        }
        toast('Image file not found. Please select another image.');
        return null;
      }

      // Create a filename with timestamp to ensure uniqueness
      final String fileName = 'property_${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Create multipart file
      final multipartFile = await MultipartFile.fromFile(
        imagePath,
        filename: fileName,
      );

      // Create FormData with all fields
      final formData = FormData.fromMap({
        ApiVariables.name: name,
        ApiVariables.email: email,
        ApiVariables.mobileNumber: mobile,
        ApiVariables.propertyType: propertyType,
        ApiVariables.location: location,
        // Use the correct field name as expected by the API
        'images': [multipartFile],
      });

      // Set proper headers for multipart/form-data
      final options = Options(
        headers: {
          ...GlobalFunction.setHeader(),
          'Content-Type': 'multipart/form-data',
        },
        followRedirects: true,
        validateStatus: (status) {
          return status! < 500;
        },
      );

      if (kDebugMode) {
        print('Sending FormData to API: ${formData.fields}');
        print('With image: ${formData.files}');
      }

      final result = await _handleRequest(
        ApiStrings.sellProperty,
        null,
        options,
        ApiMethods.post,
        formData: formData,
      );

      if (kDebugMode && result != null) {
        print('SellProperty Response: $result');
      }

      return result != null ? sellPropertyModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('SellProperty Error: $e');
      }
      toast('Error uploading property: ${e.toString()}');
      return null;
    }
  }


  static Future<EnquiryModel?> userEnquiry(
      String name,
      String id,
      String mobile,
      String email,
      String propertyId,
      ) async {
    if (kDebugMode) {
      print('UserEnquiry Request Data: $name, $email, $propertyId');
    }

    try {
      final data = {
        ApiVariables.name: name,
        ApiVariables.id: id,
        ApiVariables.enquiryMobile: mobile,
        ApiVariables.email: email,
        ApiVariables.propertyId: propertyId,
      };

      final result = await _handleRequest(
        ApiStrings.enquiry,
        data,
        Options(headers: GlobalFunction.setHeader()),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('UserEnquiry Response: $result');
      }

      return result != null ? enquiryModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('UserEnquiry Error: $e');
      }
      return null;
    }
  }

  static Future<ContactUsModel?> contactUs(
      String name,
      String mobile,
      String email,
      String query,
      ) async {
    if (kDebugMode) {
      print('ContactUs Request Data: $name, $email, $query');
    }

    try {
      final data = {
        ApiVariables.name: name,
        ApiVariables.serviceMobile: mobile,
        ApiVariables.email: email,
        ApiVariables.query: query,
      };

      final result = await _handleRequest(
        ApiStrings.contactUs,
        data,
        Options(headers: GlobalFunction.setHeader()),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('ContactUs Response: $result');
      }

      return result != null ? contactUsModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('ContactUs Error: $e');
      }
      return null;
    }
  }
// Add these methods to your ApiServices class

  static Future<FavoriteResponseModel?> addToFavorites(
      String emailOrMobile,
      String propertyId,
      ) async {
    if (kDebugMode) {
      print('AddToFavorites Request Data: emailOrMobile=$emailOrMobile, propertyId=$propertyId');
    }

    try {
      final data = {
        ApiVariables.emailOrMobile: emailOrMobile,
        ApiVariables.propertyId: propertyId,
      };

      final result = await _handleRequest(
        ApiStrings.addToFavorites,
        data,
        Options(headers: GlobalFunction.setHeader()),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('AddToFavorites Response: $result');
      }

      return result != null ? favoriteResponseModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('AddToFavorites Error: $e');
      }
      return null;
    }
  }

  static Future<FavoriteResponseModel?> removeFromFavorites(
      String emailOrMobile,
      String propertyId,
      ) async {
    if (kDebugMode) {
      print('RemoveFromFavorites Request Data: emailOrMobile=$emailOrMobile, propertyId=$propertyId');
    }

    try {
      final data = {
        ApiVariables.emailOrMobile: emailOrMobile,
        ApiVariables.propertyId: propertyId,
      };

      final result = await _handleRequest(
        ApiStrings.removeFromFavorites,
        data,
        Options(headers: GlobalFunction.setHeader()),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('RemoveFromFavorites Response: $result');
      }

      return result != null ? favoriteResponseModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('RemoveFromFavorites Error: $e');
      }
      return null;
    }
  }

  static Future<FavoriteResponseModel?> getAllFavorites(
      String emailOrMobile,
      ) async {
    if (kDebugMode) {
      print('GetAllFavorites Request Data: emailOrMobile=$emailOrMobile');
    }

    try {
      final result = await _handleRequest(
        "${ApiStrings.getAllFavorites}?emailOrMobile=$emailOrMobile",
        null,
        Options(headers: GlobalFunction.setHeader()),
        ApiMethods.get,
      );

      if (kDebugMode && result != null) {
        print('GetAllFavorites Response: $result');
      }

      return result != null ? favoriteResponseModelFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('GetAllFavorites Error: $e');
      }
      return null;
    }
  }

  static Future<RatingResponse?> getRatings(
      String serviceType,
      {int page = 1}
      ) async {
    if (kDebugMode) {
      print('GetRatings Request Data: serviceType=$serviceType, page=$page');
    }

    try {
      final result = await _handleRequest(
        '${ApiStrings.ratings}?serviceType=$serviceType&page=$page',
        null,
        Options(headers: {
          'Accept': 'application/json',
        }),
        ApiMethods.get,
      );

      if (kDebugMode && result != null) {
        print('GetRatings Response: $result');
      }

      return result != null ? ratingResponseFromJson(result) : null;
    } catch (e) {
      if (kDebugMode) {
        print('GetRatings Error: $e');
      }
      return null;
    }
  }

  // Add these methods to your ApiServices class in api_secvices.dart

// Submit a new rating (POST)
  static Future<Map<String, dynamic>?> submitRating({
    required String name,
    required String email,
    required String comments,
    required double rating,
    required String serviceType,
  }) async {
    if (kDebugMode) {
      print('SubmitRating Request Data: name=$name, email=$email, rating=$rating, serviceType=$serviceType');
    }

    try {
      final data = {
        'name': name,
        'email': email,
        'comments': comments,
        'rating': rating,
        'serviceType': serviceType,
      };

      final result = await _handleRequest(
        ApiStrings.ratings,
        data,
        Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }),
        ApiMethods.post,
      );

      if (kDebugMode && result != null) {
        print('SubmitRating Response: $result');
      }

      if (result != null) {
        return json.decode(result) as Map<String, dynamic>;
      }

      return null;
    } catch (e) {
      if (kDebugMode) {
        print('SubmitRating Error: $e');
      }
      toast('Error submitting rating: ${e.toString()}');
      return null;
    }
  }

// Update an existing rating (PUT)
  static Future<Map<String, dynamic>?> updateRating({
    required String ratingId,
    required String name,
    required String email,
    required String comments,
    required double rating,
    required String serviceType,
  }) async {
    if (kDebugMode) {
      print('UpdateRating Request Data: id=$ratingId, name=$name, rating=$rating');
    }

    try {
      final data = {
        'name': name,
        'email': email,
        'comments': comments,
        'rating': rating,
        'serviceType': serviceType,
      };

      final result = await _handleRequest(
        '${ApiStrings.ratings}/$ratingId',
        data,
        Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }),
        ApiMethods.put,
      );

      if (kDebugMode && result != null) {
        print('UpdateRating Response: $result');
      }

      if (result != null) {
        return json.decode(result) as Map<String, dynamic>;
      }

      return null;
    } catch (e) {
      if (kDebugMode) {
        print('UpdateRating Error: $e');
      }
      toast('Error updating rating: ${e.toString()}');
      return null;
    }
  }

// Delete a rating (DELETE)
  static Future<Map<String, dynamic>?> deleteRating(String ratingId) async {
    if (kDebugMode) {
      print('DeleteRating Request for ID: $ratingId');
    }

    try {
      final result = await _handleRequest(
        '${ApiStrings.ratings}/$ratingId',
        null,
        Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }),
        ApiMethods.delete,
      );

      if (kDebugMode && result != null) {
        print('DeleteRating Response: $result');
      }

      if (result != null) {
        return json.decode(result) as Map<String, dynamic>;
      }

      return null;
    } catch (e) {
      if (kDebugMode) {
        print('DeleteRating Error: $e');
      }
      toast('Error deleting rating: ${e.toString()}');
      return null;
    }
  }

}
// RetryInterceptor class
class RetryInterceptor extends Interceptor {
  final Dio dio;
  final Function(String message) logPrint;
  final int retries;
  final List<Duration> retryDelays;
  final Set<int> retryableExtraStatuses;

  RetryInterceptor({
    required this.dio,
    required this.logPrint,
    this.retries = 3,
    this.retryDelays = const [
      Duration(seconds: 3),
      Duration(seconds: 5),
      Duration(seconds: 8),
    ],
    this.retryableExtraStatuses = const {429},
  });

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    var extra = err.requestOptions.extra;
    var retryCount = extra['retryCount'] ?? 0;

    if (retryCount < retries &&
        (_shouldRetry(err) || retryableExtraStatuses.contains(err.response?.statusCode))) {
      if (retryCount < retryDelays.length) {
        await Future.delayed(retryDelays[retryCount]);
      }

      extra['retryCount'] = retryCount + 1;

      try {
        logPrint('Retry attempt ${retryCount + 1} for ${err.requestOptions.path}');
        final response = await dio.fetch(err.requestOptions..extra = extra);
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    return handler.next(err);
  }



  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.connectionError;
  }

}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
}

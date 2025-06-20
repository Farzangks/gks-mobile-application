class ApiStrings {
  // live
  // static const String fqBaseUrl = "https://fixq.app";
  // static const String fqImageUrl = "https://fixq.app/uploads/";

  // // test
  static const String baseUrl = "https://backend-gharkasathi.onrender.com/api";
  // static const String fqImageUrl = "https://dev.fixq.app/uploads/";


  // Admin
  // static const String prodPayResponse = fqBaseUrl + 'api/phonepe/response';
  static const String userLogin = '/api/auth/login';
  static const String userRegistration = '/api/auth/register';
  static const String properties = '/api/properties';
  static const String PropertyByCategories = '/api/properties/category';
  static const String sentOtp = '/api/auth/send-otp';
  static const String verifyOtp = '/api/auth/verify-otp';
  static const String services = '/api/services';
  static const String getPropertyServicesByEmail = '/api/services/services-by-email';
  static const String servicesPricing = '/api/services/service-prices';
  static const String enquiry = '/api/properties/enquire';
  static const String propertySearch = '/api/properties/search';
  static const String contactUs = '/api/properties/contact';
  static const String sellProperty = '/api/sell-property';
  // Add these new endpoints to your existing ApiStrings class
  static const String addToFavorites = '/api/add-to-favorites';
  static const String removeFromFavorites = '/api/remove-from-favorites';
  static const String getAllFavorites = '/api/get-all-favorites';
  // Ratings endpoints
  static const String ratings = '/api/ratings';
}


class ApiVariables {
  static const String id = 'id';
  static const String username = 'username';
  static const String emailOrMobile = 'emailOrMobile';
  static const String otp = 'otp';
  static const String newPassword = 'newPassword';
  static const String password = 'password';
  static const String name = 'name';
  static const String enquiryMobile = 'Mobile';
  static const String email = 'email';
  static const String query = 'query';
  static const String propertyId = '_id';
  static const String serviceMobile = 'mobile';
  static const String mobileNumber = 'mobileNumber';
  static const String images = 'images';
  static const String serviceType = 'serviceType';
  static const String location = 'location';
  static const String propertyType = 'propertyType';
  static const String date = 'date';
  static const String time = 'time';
  static const String page = 'page';
  static const String limit = 'limit';
  static const String totalProperties = 'totalProperties';
  static const String totalPages = 'totalPages';
  static const String data = 'data';
  static const String detail = 'detail';
  static const String category = 'category';
  static const String subCategory = 'category';
  static const String finalSelection = 'category';
  static const String status = 'category';
  // Add rating variables
  static const String rating = 'rating';
  static const String comments = 'comments';

}


class ApiMethods {
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String get = 'GET';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/api/api_secvices.dart';
import 'package:ghar_ka_sathi/model/login_model.dart';
import 'package:ghar_ka_sathi/src/sign_in_screen.dart';
import 'package:ghar_ka_sathi/src/verify_otp_screen.dart';
import 'package:ghar_ka_sathi/utils/globle_functions.dart';
import 'package:itq_utils/itq_utils.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isEnabled = false.obs;
  var isDetailLoading = false.obs;
  var isAddLoading = false.obs;
  var isDeleteLoading = false.obs;
  var edit = false.obs;
  var errorMsg = ''.obs;
  var selectedCompany = ''.obs;
  var selectedGroupWiseCompany = ''.obs;
  var groupList = List<LoginModel>.empty().obs;
  var userList = List<LoginModel>.empty().obs;
  var userDetail = List<LoginModel>.empty().obs;
  var authUser = <LoginModel>[].obs;
  var btnText = 'GET OTP'.obs;
  var igstTotal, cgstTotal, sgstTotal, tcs, totalAmount;
  var isGuestUser = false.obs; // Track if user is guest

  // Guest login method
  void guestLogin(BuildContext context) async {
    try {
      isLoading(true);

      // Create a guest user model
      final guestUser = LoginModel(
        id: 'guest_${DateTime.now().millisecondsSinceEpoch}',
        emailOrMobile: 'guest@gharakasathi.com',
        username: 'Guest User',
        token: 'guest_token_${DateTime.now().millisecondsSinceEpoch}',
        // Add other required fields as per your LoginModel
      );

      authUser.value = [guestUser];
      isGuestUser.value = true;

      // Set guest user data in preferences
      if (GlobalFunction().setUserData(
          authUser.first.id,
          authUser.first.emailOrMobile,
          authUser.first.username,
          authUser.first.token)) {

        // Also store guest status
        sharedPreferences.setBool('isGuestUser', true);

        GlobalFunction.disabledWalkThrough(context);
        toast('Welcome! You are browsing as a guest');
      }
    } finally {
      isLoading(false);
    }
  }

  // Check if current user is guest
  bool get isCurrentUserGuest => isGuestUser.value;

  // Convert guest to regular user
  void convertGuestToRegularUser(BuildContext context) {
    isGuestUser.value = false;
    sharedPreferences.setBool('isGuestUser', false);
    // Navigate to registration/login screen
    Get.to(() => const SignInScreen());
  }

  // Initialize user status from preferences
  void initializeUserStatus() {
    isGuestUser.value = sharedPreferences.getBool('isGuestUser') ?? false;
  }

  // final userController = Get.put(UserController());
  void userSignIn(
      BuildContext context, String emailOrMobile, String password) async {
    try {
      print(emailOrMobile);
      print(password);
      isLoading(true);
      var userData = await ApiServices.userSignIn(
        emailOrMobile,
        password,
      );
      if (userData != null) {
        authUser.value = [userData];
        isGuestUser.value = false; // Set as regular user
        sharedPreferences.setBool('isGuestUser', false);

        print(authUser.first.emailOrMobile);
        if (GlobalFunction().setUserData(
            authUser.first.id,
            authUser.first.emailOrMobile,
            authUser.first.username,
            authUser.first.token)) {
          GlobalFunction.disabledWalkThrough(context);
          toast('You are successfully loggedIn');
        }
      } else {
        toast('error');
        // showAwesomeToast(context,
        //     title: FqStrings.Warning,
        //     message: FqStrings.loginErrorToast,
        //     type: ToastType.help);
      }
    } finally {
      isLoading(false);
    }
  }

  void getOtp(
      BuildContext context,
      String emailOrMobile) async {
    try {
      isLoading(true);
      var data = await ApiServices.getOtp(emailOrMobile);
      if (data != null) {
        print(data);
        Get.to( VerifyOtpScreen());
        errorMsg.value = '';
      } else {
        errorMsg.value = 'Product details not found!';
      }
    } finally {
      isLoading(false);
      isAddLoading(false);
    }
  }
  void getOtpForLogin(
      BuildContext context,
      String emailOrMobile) async {
    try {
      isLoading(true);
      var data = await ApiServices.getOtpForLogin(emailOrMobile);
      if (data != null) {
        print(data);
        Get.to( VerifyOtpScreen());
        errorMsg.value = '';
      } else {
        errorMsg.value = 'Product details not found!';
      }
    } finally {
      isLoading(false);
      isAddLoading(false);
    }
  }
  void verifyOtp(
      BuildContext context,
      String emailOrMobile,
      String otp,
      String newPassword,
      ) async {
    try {
      isLoading(true);
      var data = await ApiServices.verifyOtp(emailOrMobile,otp,newPassword);
      if (data != null) {
        print(data);
        Get.to( SignInScreen());
        errorMsg.value = '';
      } else {
        errorMsg.value = 'Product details not found!';
      }
    } finally {
      isLoading(false);
      isAddLoading(false);
    }
  }
  void verifyOtpForPhone(
      BuildContext context,
      String otp,
      ) async {
    try {
      isLoading(true);
      var data = await ApiServices.verifyOtpForPhone(otp);
      if (data != null) {
        print(data);
        Get.to( SignInScreen());
        errorMsg.value = '';
      } else {
        errorMsg.value = 'Product details not found!';
      }
    } finally {
      isLoading(false);
      isAddLoading(false);
    }
  }

  void userRegistration(BuildContext context, String userName,
      String emailOrMobile, String password) async {
    try {
      print(emailOrMobile.text);
      print(password.text);
      isAddLoading(true);
      var data = await ApiServices.userRegistration(
        userName,
        emailOrMobile,
        password,
      );
      if (data != null) {
        authUser.value = [data];
        isGuestUser.value = false; // Set as regular user
        sharedPreferences.setBool('isGuestUser', false);

        print(authUser.first.emailOrMobile);
        if (GlobalFunction().setUserData(
            authUser.first.id,
            authUser.first.emailOrMobile,
            authUser.first.username,
            authUser.first.token)) {
          GlobalFunction.disabledWalkThrough(context);
          toast('You are successfully SignUp');
        } else {
          toast('error');
        }
      }
    } finally {
      isAddLoading(false);
    }
  }

  void userSignOut(
      BuildContext context,
      ) async {
    if (GlobalFunction.adminLogout(context)) {
      isGuestUser.value = false;
      sharedPreferences.setBool('isGuestUser', false);
      GlobalFunction.disabledWalkThrough(context);
      toast('You are successfully loggedOut');
      // showAwesomeToast(context,
      //     title: FqStrings.Warning,
      //     message: FqStrings.logOutAlert,
      //     type: ToastType.success);
    }
  }
}
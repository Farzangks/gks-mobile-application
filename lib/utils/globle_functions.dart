import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:ghar_ka_sathi/src/on_boarding_screen.dart';
import 'package:ghar_ka_sathi/src/sign_in_screen.dart';
import 'package:ghar_ka_sathi/view/dashboard/dashboard_screen.dart';
import 'package:itq_utils/itq_utils.dart';

class GlobalFunction {
  static disabledWalkThrough(BuildContext context) async {
    print('WalkThrough =>${getBoolAsync(isWalkThrough)}');
    print("UserLoggedIn =>${getBoolAsync(isUserLoggedIn)}");

    if (getBoolAsync(isWalkThrough)) {
      // Always navigate to DashboardScreen after walkthrough
      // Users can access all app content without mandatory login
      DashboardScreen().launch(context,
          pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
    } else {
      // Show onboarding for first-time users
      const OnboardingScreen().launch(context,
          pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
    }
  }

  /// Check if user is logged in for features that require authentication
  static bool isUserAuthenticated() {
    return getBoolAsync(isUserLoggedIn);
  }

  /// Show login prompt for authenticated features
  static void promptLogin(BuildContext context, {
    String title = "Login Required",
    String message = "Please login to access this feature",
    VoidCallback? onLoginSuccess,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to sign in screen
                const SignInScreen().launch(context,
                    pageRouteAnimation: PageRouteAnimation.Slide);
              },
              child: const Text("Login"),
            ),
          ],
        );
      },
    );
  }

  /// Enhanced method to handle feature access with optional authentication
  static void accessFeature(BuildContext context, {
    required VoidCallback onAccess,
    bool requiresAuth = false,
    String? authPromptTitle,
    String? authPromptMessage,
  }) {
    if (requiresAuth && !isUserAuthenticated()) {
      promptLogin(
        context,
        title: authPromptTitle ?? "Login Required",
        message: authPromptMessage ?? "Please login to access this feature",
      );
    } else {
      onAccess();
    }
  }

  /// Create a guest user session for enhanced experience
  static void createGuestSession() {
    // Set basic guest user data
    setValue(userId, "guest_${DateTime.now().millisecondsSinceEpoch}");
    setValue(emailMobile, "guest@gharksathi.com");
    setValue(userName, "Guest User");
    setValue(userToken, "guest_token");
    setValue(isUserLoggedIn, false); // Keep as false to distinguish guest
    setValue(isWalkThrough, true);
    setValue("isGuestUser", true);
  }

  /// Check if current user is a guest
  static bool isGuestUser() {
    return getBoolAsync("isGuestUser");
  }

  /// Convert guest to registered user
  static void convertGuestToUser(
      var Id,
      var emailOrMobile,
      var username,
      var token,
      ) {
    setValue(userId, Id);
    setValue(emailMobile, emailOrMobile);
    setValue(userName, username);
    setValue(userToken, token);
    setValue(isUserLoggedIn, true);
    setValue(isWalkThrough, true);
    removeKey("isGuestUser"); // Remove guest flag
  }

  static Widget buildCheckboxField({
    required String labelText,
    required bool isRequired,
    required Map<String, String> options, // Map of value to display text
    required RxString selectedValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: labelText,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold),
            children: [
              if (isRequired)
                const TextSpan(
                  text: '*',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Obx(() => Row(
          children: options.entries.map((entry) {
            return Row(
              children: [
                Checkbox(
                  value: selectedValue.value == entry.key,
                  onChanged: (bool? value) {
                    if (value != null && value) {
                      selectedValue.value = entry.key;
                    } else {
                      selectedValue.value = '';
                    }
                  },
                ),
                Text(entry.value),
              ],
            );
          }).toList(),
        )),
      ],
    );
  }

  /// Circular Progressbar
  Widget progressBar({
    Color color = AppColors.appBarColor,
  }) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(borderRadius: radius(50)),
        child: Container(
          width: 45,
          height: 45,
          padding: const EdgeInsets.all(8.0),
          child: Theme(
            data: ThemeData(
                colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: color)),
            child: const CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ),
      ),
    );
  }

  bool setUserData(
      var Id,
      var emailOrMobile,
      var username,
      var token,) {
    setValue(userId, Id);
    setValue(emailMobile, emailOrMobile);
    setValue(userName, username);
    setValue(userToken, token);
    setValue(isUserLoggedIn, true);
    setValue(isWalkThrough, true);
    removeKey("isGuestUser"); // Remove guest flag when user logs in
    return true;
  }

  static adminLogout(BuildContext context) {
    removeKey(userId);
    removeKey(emailMobile);
    removeKey(userName);
    removeKey(userToken);
    removeKey("isGuestUser");
    setValue(isUserLoggedIn, false);
    GlobalFunction.disabledWalkThrough(context);
  }

  static setHeader() {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
    };

    // Only add authorization header for authenticated users
    if (isUserAuthenticated()) {
      header['Authorization'] = 'Bearer ${getStringAsync(userToken)}';
    }

    return header;
  }

  static int daysBetweenTwoDates(DateTime date1, DateTime date2) {
    return date1.difference(date2).inDays;
  }
}
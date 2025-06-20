import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Define theme constants
class AppThemeConstants {
  // Colors
  static const primaryColor = Color(0xFF2F80ED);
  static const secondaryColor = Color(0xFF6FCF97);
  static const accentColor = Color(0xFFF2994A);
  static const backgroundColor = Color(0xFFF8F9FC);
  static const cardColor = Colors.white;
  static const textPrimaryColor = Color(0xFF333333);
  static const textSecondaryColor = Color(0xFF666666);
  static const errorColor = Color(0xFFEB5757);
  static const successColor = Color(0xFF27AE60);

  // Gradients
  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF2F80ED), Color(0xFF56CCF2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Dimensions
  static const double borderRadius = 12.0;
  static const double buttonHeight = 54.0;
  static const double cardElevation = 4.0;
  static const double spacing = 16.0;

  // Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 500);
  static const Duration longAnimation = Duration(milliseconds: 800);
}

// Theme configuration for the entire app
ThemeData getPremiumPropertyTheme() {
  return ThemeData(
    primaryColor: AppThemeConstants.primaryColor,
    colorScheme: ColorScheme.light(
      primary: AppThemeConstants.primaryColor,
      secondary: AppThemeConstants.secondaryColor,
      error: AppThemeConstants.errorColor,
      background: AppThemeConstants.backgroundColor,
      surface: AppThemeConstants.cardColor,
    ),
    scaffoldBackgroundColor: AppThemeConstants.backgroundColor,
    cardTheme: CardThemeData(
      color: AppThemeConstants.cardColor,
      elevation: AppThemeConstants.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppThemeConstants.borderRadius),
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: AppThemeConstants.cardColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        color: AppThemeConstants.textPrimaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: AppThemeConstants.textPrimaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppThemeConstants.primaryColor,
        minimumSize: const Size(double.infinity, AppThemeConstants.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppThemeConstants.borderRadius),
        ),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppThemeConstants.primaryColor,
        side: BorderSide(color: AppThemeConstants.primaryColor),
        minimumSize: const Size(double.infinity, AppThemeConstants.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppThemeConstants.borderRadius),
        ),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppThemeConstants.primaryColor,
        textStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppThemeConstants.spacing,
        vertical: AppThemeConstants.spacing,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppThemeConstants.borderRadius),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppThemeConstants.borderRadius),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppThemeConstants.borderRadius),
        borderSide: BorderSide(color: AppThemeConstants.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppThemeConstants.borderRadius),
        borderSide: BorderSide(color: AppThemeConstants.errorColor),
      ),
      hintStyle: GoogleFonts.poppins(
        color: Colors.grey[400],
        fontSize: 14,
      ),
      labelStyle: GoogleFonts.poppins(
        color: AppThemeConstants.textSecondaryColor,
        fontSize: 14,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppThemeConstants.primaryColor,
      unselectedLabelColor: AppThemeConstants.textSecondaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[200],
      thickness: 1,
      space: AppThemeConstants.spacing,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppThemeConstants.cardColor,
      selectedItemColor: AppThemeConstants.primaryColor,
      unselectedItemColor: AppThemeConstants.textSecondaryColor,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
      ),
    ),
  );
}

// Custom page transitions for smoother navigation
class CustomPageTransition extends PageRouteBuilder {
  final Widget page;

  CustomPageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOutCubic;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
    transitionDuration: AppThemeConstants.mediumAnimation,
  );
}

// Main app theme configuration
class PremiumAppTheme {
  static ThemeData get lightTheme => getPremiumPropertyTheme();

  // Apply theme to app
  static void applyTheme() {
    Get.changeTheme(lightTheme);
  }
}
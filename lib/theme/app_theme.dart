import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define your colors as constants to reuse across the app
  static const Color scaffoldBgColor = Color(0xFFF4EEEF);
  static const Color primaryColor = Color(0xFFEA4B0B);
  static const Color secondaryColor = Color(0xFFFFB640);
  static const Color starColor = Color(0xffFFB139);
  static const Color darkColor = Color(0xFF2F180A);
  static const Color textColorBlack = Color(0xFF1C1818);
  static const Color textColorGrey = Color(0xFF9499AE);
  static const Color customBlackColor = Color(0xFF421608);
  static const Color iconBlack = Color(0xFF1C1818);

  // Skala teks
  static const double textScaleFactor = 0.8;

  // Define the light theme
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldBgColor,
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    cardColor: customBlackColor,

    // Text Theme with scale factor
    textTheme: TextTheme(
      displayLarge: GoogleFonts.plusJakartaSans(
        fontSize: 64.0 * textScaleFactor,
        fontWeight: FontWeight.bold,
        color: textColorBlack,
      ),
      displayMedium: GoogleFonts.plusJakartaSans(
        fontSize: 48.0 * textScaleFactor,
        fontWeight: FontWeight.bold,
        color: textColorBlack,
      ),
      displaySmall: GoogleFonts.plusJakartaSans(
        fontSize: 36.0 * textScaleFactor,
        fontWeight: FontWeight.bold,
        color: textColorBlack,
      ),
      headlineLarge: GoogleFonts.plusJakartaSans(
        fontSize: 32.0 * textScaleFactor,
        fontWeight: FontWeight.w600,
        color: textColorBlack,
      ),
      headlineMedium: GoogleFonts.plusJakartaSans(
        fontSize: 28.0 * textScaleFactor,
        fontWeight: FontWeight.w600,
        color: textColorBlack,
      ),
      headlineSmall: GoogleFonts.plusJakartaSans(
        fontSize: 24.0 * textScaleFactor,
        fontWeight: FontWeight.w600,
        color: textColorBlack,
      ),
      titleLarge: GoogleFonts.plusJakartaSans(
        fontSize: 22.0 * textScaleFactor,
        fontWeight: FontWeight.w500,
        color: textColorBlack,
      ),
      titleMedium: GoogleFonts.plusJakartaSans(
        fontSize: 20.0 * textScaleFactor,
        fontWeight: FontWeight.w500,
        color: textColorBlack,
      ),
      titleSmall: GoogleFonts.plusJakartaSans(
        fontSize: 18.0 * textScaleFactor,
        fontWeight: FontWeight.w500,
        color: textColorBlack,
      ),
      bodyLarge: GoogleFonts.plusJakartaSans(
        fontSize: 16.0 * textScaleFactor,
        fontWeight: FontWeight.normal,
        color: textColorBlack,
      ),
      bodyMedium: GoogleFonts.plusJakartaSans(
        fontSize: 14.0 * textScaleFactor,
        fontWeight: FontWeight.normal,
        color: textColorBlack,
      ),
      bodySmall: GoogleFonts.plusJakartaSans(
        fontSize: 12.0 * textScaleFactor,
        fontWeight: FontWeight.normal,
        color: textColorBlack,
      ),
      labelLarge: GoogleFonts.plusJakartaSans(
        fontSize: 16.0 * textScaleFactor,
        fontWeight: FontWeight.w600,
        color: textColorBlack,
      ),
      labelMedium: GoogleFonts.plusJakartaSans(
        fontSize: 14.0 * textScaleFactor,
        fontWeight: FontWeight.w600,
        color: textColorBlack,
      ),
      labelSmall: GoogleFonts.plusJakartaSans(
        fontSize: 12.0 * textScaleFactor,
        fontWeight: FontWeight.w600,
        color: textColorBlack,
      ),
    ),

    // Color scheme for light theme
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      primaryContainer: Colors.orange[200], 
      onPrimaryContainer: Colors.black, 
      secondary: secondaryColor,
      onSecondary: Colors.black,
      secondaryContainer: Colors.orange[100],
      onSecondaryContainer: Colors.black, 
      tertiary: Colors.purple, 
      onTertiary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white, // Surface color
      onSurface: textColorBlack, // Text on surface
      surfaceDim: Colors.grey[200], // Dimmed surface color
      surfaceContainer: Colors.grey[300], // Surface container color
      onSurfaceVariant: Colors.grey[600], 
      outline: Colors.grey, 
      shadow: Colors.black12, 
      inverseSurface: Colors.black, 
      onInverseSurface: Colors.white, 
      inversePrimary: primaryColor.withOpacity(0.7), 
      surfaceTint: primaryColor, 
    ),
  );
}

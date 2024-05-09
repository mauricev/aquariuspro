// Example typography.dart file
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = TextTheme(
  displayLarge: GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
  ),
  displayMedium: GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 45,
    height: 52 / 45,
  ),
  displaySmall: GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 36,
    height: 44 / 36,
  ),
  headlineLarge: GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 40 / 32,
  ),
  headlineMedium: GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 28,
    height: 36 / 28,
  ),
  headlineSmall: GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 32 / 24,
  ),
  titleLarge: GoogleFonts.openSans(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 28 / 22,
  ),
  titleMedium: GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 24 / 20,
    letterSpacing: 0.1,
  ),
  titleSmall: GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
  ),
  labelLarge: GoogleFonts.openSans(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 20 / 14,
  ),
  labelMedium: GoogleFonts.openSans(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 16 / 12,
  ),
  labelSmall: GoogleFonts.openSans(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    height: 16 / 11,
  ),
  bodyLarge: GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
  ),
  bodyMedium: GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
  ),
  bodySmall: GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    height: 12 / 9,
  ),
);

const MaterialColor blueShades = MaterialColor(
  0xFF2196F3,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);

final aquariumManagerTheme = ThemeData(
  useMaterial3: true,
  // primaryColor: Colors.lightBlue[800],
  // primarySwatch: blueShades,
  textTheme: textTheme,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: blueShades,
  ).copyWith(
    // Add the desired dark color for the primary color
    primary: blueShades.shade500,
  ),
  // other theme properties
);

class CustomTextStyle {
  final TextTheme baseTextTheme;
  final TextStyle bodySmallBold;

  CustomTextStyle({
    required this.baseTextTheme,
    required this.bodySmallBold,
  });
}

final customTextStyle = CustomTextStyle(
  baseTextTheme: textTheme, // your textTheme defined previously
  bodySmallBold: GoogleFonts.openSans(
    fontWeight: FontWeight.w700,
    fontSize: 9,
    height: 12 / 9,
  ),
);
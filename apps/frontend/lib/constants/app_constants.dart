import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Nonprofit Project';
  static const String apiBaseUrl = 'https://api.nonprofitproject.org';
  static const int timeoutDuration = 5000;

  // Color Palette
  static const Color primaryColor = Color(0xFF0A73BB);
  static const Color secondaryColor = Color(0xFF0A9E6B);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF333333);

  // Text Styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    color: textColor,
  );

  // Breakpoints for Responsive Design
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 1024.0;
  static const double desktopBreakpoint = 1440.0;

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 300);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 600);
  static const Duration longAnimationDuration = Duration(milliseconds: 900);
}

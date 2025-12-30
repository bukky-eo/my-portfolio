import 'package:flutter/material.dart';

class AppTheme {
  // Theme colors - Using Colors.grey[300] like your original
  static final Color lightBackground = Colors.grey[300]!;
  static const Color darkBackground = Color(0xFF212121);

  // Neumorphic shadows for light mode
  static final List<BoxShadow> lightShadows = [
    BoxShadow(
      color: Colors.grey.shade500,
      offset: const Offset(4.0, 4.0),
      blurRadius: 15.0,
      spreadRadius: 1.0,
    ),
    const BoxShadow(
      color: Colors.white,
      offset: Offset(-4.0, -4.0),
      blurRadius: 15.0,
      spreadRadius: 1.0,
    ),
  ];

  // Neumorphic shadows for dark mode
  static List<BoxShadow> darkShadows = [
    const BoxShadow(
      color: Colors.black,
      offset: Offset(4.0, 4.0),
      blurRadius: 15.0,
      spreadRadius: 1.0,
    ),
    const BoxShadow(
      color: Color(0xFF3A3A3A),
      offset: Offset(-4.0, -4.0),
      blurRadius: 15.0,
      spreadRadius: 1.0,
    ),
  ];

  // Get background color based on mode
  static Color getBackgroundColor(bool isDarkMode) {
    return isDarkMode ? darkBackground : lightBackground;
  }

  // Get text color based on mode
  static Color getTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }

  // Get icon color based on mode
  static Color getIconColor(bool isDarkMode) {
    return isDarkMode ? Colors.grey[300]! : Colors.grey[700]!;
  }

  // Get shadows based on mode
  static List<BoxShadow> getShadows(bool isDarkMode) {
    return isDarkMode ? darkShadows : lightShadows;
  }

  // Get button background color based on mode
  static Color getButtonColor(bool isDarkMode) {
    return isDarkMode ? const Color(0xFF2A2A2A) : Colors.grey[300]!;
  }

  // Button background colors for social media buttons (keeping the logos)
  static const Color linkedInBg = Color(0xFF5DADE2);      // Sky blue for LinkedIn
  static const Color gmailBg = Color(0xFF85E085);          // Green for Gmail
  static const Color githubBg = Color(0xFF6C6C6C);         // Grey for GitHub
  static const Color mediumBg = Color(0xFFFFB6D9);         // Light/baby pink for Medium

  // Typewriter text style
  static TextStyle typewriterStyle(bool isDarkMode) {
    return const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    );
  }

  // Modal theme
  static BoxDecoration modalDecoration = BoxDecoration(
    color: Colors.black87,
    border: Border.all(color: Colors.white, width: 2),
    borderRadius: BorderRadius.circular(15),
  );

  // Content container decoration
  static BoxDecoration contentContainerDecoration = BoxDecoration(
    border: Border.all(color: Colors.white, width: 2),
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey[900],
  );
}
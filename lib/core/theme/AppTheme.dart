import 'package:flutter/material.dart';

class AppTheme {
  // 📌 Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true, // Enable Material 3
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF90CAF9), // Blue as the base color
      primary: const Color(0xFF90CAF9), // Primary color (Blue)
      secondary: const Color(0xFFFFC107), // Secondary (Amber)
      error: const Color(0xFFD23F3F), // Error (Red)
      surface: Color(0xFFF5F5F5),
      onSurfaceVariant: Color(0xFFF5F5F5),
      onPrimary: Colors.white, // Text on primary color
      onSecondary: Colors.black, // Text on secondary color
      onSurface: Colors.black, // Text on surfaces
      onError: Colors.white, // Text on error colors
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black), // Headline
      bodyLarge:
          TextStyle(fontSize: 16, color: Colors.black87), // Standard body text
      bodyMedium:
          TextStyle(fontSize: 14, color: Colors.black54), // Secondary body text
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF90CAF9), // Primary Blue
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: Color(0xFF03315A)),
        selectedItemColor: Colors.black87,
        unselectedIconTheme: IconThemeData(color: Colors.black45),
        unselectedItemColor: Colors.black87),
  );

  // 📌 Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true, // Enable Material 3
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF03315A), // Light Blue as the base color
      primary: const Color(0xFF03315A), // Light Blue
      secondary: const Color(0xFFFFB300), // Dark Amber
      error: const Color(0xFFF44336), // Light Red
      surface: const Color(0xFF1E1E1E), // Darker Gray for surfaces
      onSurfaceVariant: const Color(0xFF1E1E1E),
      onPrimary: Colors.black, // Text on primary
      onSecondary: Colors.black, // Text on secondary
      onSurface: Colors.white, // Text on surfaces
      onError: Colors.white, // Text on error colors
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(fontSize: 22, color: Colors.white60),
      titleMedium: TextStyle(fontSize: 20, color: Colors.white60),
      titleSmall: TextStyle(fontSize: 18, color: Colors.white60), // Headline
      bodyLarge:
          TextStyle(fontSize: 16, color: Colors.white70), // Standard body text
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white60),
      bodySmall:
          TextStyle(fontSize: 12, color: Colors.white70), // Secondary body text
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: const Color(0xFF03315A), // Darker Gray
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: const Color(0xFF90CAF9)),
        selectedItemColor: Colors.white60,
        unselectedIconTheme: IconThemeData(color: Colors.white54),
        unselectedItemColor: Colors.white60),
  );
}

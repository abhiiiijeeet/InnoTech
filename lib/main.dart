import 'package:flutter/material.dart';
import 'package:mental_health/HomeScreen.dart';
// import 'screens/home_screen.dart';

void main() {
  runApp(FitPeacifyApp());
}

class FitPeacifyApp extends StatelessWidget {
  // Define a new color palette
  final Color primaryColor = Color(0xFF6A1B9A); // Purple
  final Color secondaryColor = Color(0xFF8E24AA); // Light Purple
  final Color backgroundColor = Color(0xFFF3E5F5); // Light Lavender
  final Color accentColor = Color(0xFFAB47BC); // Accent Purple
  final Color textColor = Color(0xFF212121); // Dark Gray

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitPeacify',
      theme: ThemeData(
        // Use the new color scheme properties
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: textColor), // Replaces bodyText1
          bodyMedium: TextStyle(color: textColor), // Replaces bodyText2
          titleMedium: TextStyle(color: textColor), // Replaces headline6
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: accentColor, // Replaces accentColor
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor, // Button color
            foregroundColor: Colors.white, // Text color on buttons
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: secondaryColor, // Button text color
          ),
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

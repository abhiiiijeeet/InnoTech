import 'package:flutter/material.dart';
import 'dart:ui';

Widget buildGlassEffectContainer({required Widget child}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30), // Enhanced border radius for modern look
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0), // Increase blur effect for a smoother glass look
      child: Container(
        padding: EdgeInsets.all(24), // Updated padding for better spacing
        decoration: BoxDecoration(
          // Gradient background for a more dynamic look
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.3), // Light transparent white
              Colors.white.withOpacity(0.1), // Slightly more transparent
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // Glass effect border with soft shadow
          borderRadius: BorderRadius.circular(30), // Smooth, modern border radius
          border: Border.all(
            color: Colors.white.withOpacity(0.2), // Softer border color
            width: 1.5, // Slightly thicker border
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Soft shadow for the glass effect
              blurRadius: 10.0,
              offset: Offset(0, 4), // Subtle shadow positioning
            ),
          ],
        ),
        child: child,
      ),
    ),
  );
}

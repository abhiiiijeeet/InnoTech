import 'package:flutter/material.dart';

class GratitudeEntryCard extends StatelessWidget {
  final String entry;

  GratitudeEntryCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Increased radius for smoother edges
      ),
      elevation: 8, // Enhanced shadow for depth
      shadowColor: Colors.black.withOpacity(0.3), // Softer shadow
      margin: const EdgeInsets.symmetric(vertical: 10), // Spacing between cards
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF3E5F5), // Light lavender
              Color(0xFFE1BEE7), // Soft pinkish purple
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ), // Subtle gradient effect
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(24.0), // Increased padding for better spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500, // Medium weight for better readability
                color: Colors.black87, // Slightly dark text for better contrast
                height: 1.5, // Adjust line height for better readability
              ),
            ),
            SizedBox(height: 12), // Space for any additional content
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.purpleAccent), // Edit button
                onPressed: () {
                  // Edit action here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

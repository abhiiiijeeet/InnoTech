import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import the cached network image package
import 'package:share_plus/share_plus.dart'; // Import share package

class DashboardScreen extends StatelessWidget {
  final int dailyGratitudeStreak = 5; // Example data
  final int totalTimeFocused = 120; // Example data in minutes
  final List<String> quotes = [
    "Believe you can and you're halfway there.",
    "The only way to do great work is to love what you do.",
    "Success is not the key to happiness. Happiness is the key to success.",
    "Don't watch the clock; do what it does. Keep going.",
    "The future belongs to those who believe in the beauty of their dreams."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for Daily Gratitude Streak and Total Time Focused Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Daily Gratitude Streak Card
                _buildCard(
                  context,
                  'Daily Gratitude Streak',
                  '$dailyGratitudeStreak days',
                  Colors.lightGreen[100] ?? Colors.green, // Fallback to green if null
                  'https://via.placeholder.com/150', // Replace with a valid URL
                ),
                SizedBox(width: 20), // Space between the cards
                // Total Time Focused Card
                _buildCard(
                  context,
                  'Total Time Focused',
                  '$totalTimeFocused minutes',
                  Colors.lightBlue[100] ?? Colors.blue, // Fallback to blue if null
                  'https://via.placeholder.com/150', // Replace with a valid URL
                ),
              ],
            ),
            SizedBox(height: 20),
            // Motivational Quotes Section
            GratitudeSection(quotes: quotes),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String content, Color backgroundColor, String imageUrl) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.2),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GratitudeSection extends StatelessWidget {
  final List<String> quotes;

  const GratitudeSection({required this.quotes});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: PageView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return _buildQuoteCard(quotes[index]);
        },
      ),
    );
  }

  Widget _buildQuoteCard(String quote) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 4,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    quote,
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Share Icon Button
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.share),
                color: Colors.blue,
                onPressed: () {
                  Share.share(quote);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

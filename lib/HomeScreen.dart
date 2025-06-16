import 'package:flutter/material.dart';
import 'package:mental_health/ArticleScreen.dart';
import 'package:mental_health/DashboardScreen.dart';
import 'package:mental_health/FocusScreen.dart';
import 'package:mental_health/GratitudeScreen.dart';
import 'package:mental_health/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2; // Starting from the DashboardScreen (index 2)
  final List<Widget> _children = [
    FocusSection(),
    GratitudeSection(),
    DashboardScreen(),
    ArticlesSection(),
    ProfileSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Color(0xFFF3E5F5), // Light Lavender background for the navigation bar
        selectedItemColor: Color(0xFF6A1B9A), // Purple for selected item
        unselectedItemColor: Color(0xFF8E24AA), // Light purple for unselected items
        selectedFontSize: 14, // Adjust the font size for the selected item
        unselectedFontSize: 12, // Font size for unselected items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Gratitude',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

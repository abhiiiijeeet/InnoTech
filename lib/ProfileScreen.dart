import 'package:flutter/material.dart';
import '../widgets/glass_effect_container.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGlassEffectContainer(
        child: Center(
          child: Text(
            'Profile Section',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../widgets/glass_effect_container.dart';

class ArticlesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGlassEffectContainer(
        child: Center(
          child: Text(
            'Articles Section',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
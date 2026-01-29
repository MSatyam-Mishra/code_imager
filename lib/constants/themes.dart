import 'package:flutter/material.dart';

class AppThemes {
  // Ray.so inspired gradients
  static const Map<String, List<Color>> gradients = {
    'Candy': [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
    'Heatwave': [Color(0xFFf83600), Color(0xFFf9d423)],
    'Midnight': [Color(0xFF141E30), Color(0xFF243B55)],
    'Rainforest': [Color(0xFF00b09b), Color(0xFF96c93d)],
    'Sunset': [Color(0xFFff4e50), Color(0xFFf9d423)],
    'Breeze': [Color(0xFF2193b0), Color(0xFF6dd5ed)],
    'Crimson': [Color(0xFFe65c00), Color(0xFFF9D423)],
    'Haze': [Color(0xFF7F7FD5), Color(0xFF86A8E7), Color(0xFF91EAE4)],
    'Charcoal': [Color(0xFF2c3e50), Color(0xFF3498db)],
  };

  static const Color windowBgDark = Color(0xFF0e0e0e); // Almost black, not pure
  static const Color windowBgLight = Color(0xFFffffff);

  // Custom Font Families
  static const String fontUI = 'Inter';
  static const String fontCode =
      'UbuntuMono'; // User verified this is available
}

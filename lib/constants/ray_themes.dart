import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/zenburn.dart';
import 'package:flutter_highlight/themes/obsidian.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:flutter_highlight/themes/ocean.dart';

enum WindowStructure {
  standard, // Standard Mac-like window with traffic lights
  tech, // Vercel-style: Square, Crop marks, Minimal header
  glow, // Gemini-style: Rounded, Outer Glow
  minimal, // Simple border, no shadow
}

enum BackgroundPattern {
  gradient, // Standard gradient
  grid, // Dotted/Lined grid
  solid, // Solid color
}

class RayTheme {
  final String name;
  final List<Color> gradient;
  final Map<String, TextStyle> syntaxMap;
  final Color windowColor;
  final double borderRadius;
  final double padding;
  final bool hasControls;
  final String fontFamily;

  // New Structural Properties
  final WindowStructure structure;
  final BackgroundPattern bgPattern;

  const RayTheme({
    required this.name,
    required this.gradient,
    required this.syntaxMap,
    this.windowColor = const Color(0xFF0e0e0e),
    this.borderRadius = 16.0,
    this.padding = 32.0,
    this.hasControls = true,
    this.fontFamily = 'UbuntuMono',
    this.structure = WindowStructure.standard,
    this.bgPattern = BackgroundPattern.gradient,
  });
}

class RayThemes {
  static final List<RayTheme> themes = [
    // --- Brand Presets ---
    RayTheme(
      name: 'Vercel',
      gradient: [Color(0xFF000000), Color(0xFF000000)],
      syntaxMap: githubTheme,
      windowColor: Color(0xFF000000),
      borderRadius: 0.0,
      fontFamily: 'Geist Mono',
      structure: WindowStructure.tech, // Tech/Crop Marks
      bgPattern: BackgroundPattern.grid, // Grid background
    ),
    RayTheme(
      name: 'Supabase',
      gradient: [Color(0xFF1c1c1c), Color(0xFF1c1c1c)],
      syntaxMap: atomOneDarkTheme,
      windowColor: Color(0xFF171717),
      borderRadius: 0.0,
      fontFamily: 'JetBrains Mono',
      structure: WindowStructure.minimal,
      bgPattern: BackgroundPattern.gradient,
    ),
    RayTheme(
      name: 'Tailwind',
      gradient: [Color(0xFF0f172a), Color(0xFF0f172a)],
      syntaxMap: draculaTheme,
      windowColor: Color(0xFF1e293b),
      borderRadius: 0.0,
      fontFamily: 'Fira Code',
      structure: WindowStructure.minimal, // Often just a clean window
      bgPattern: BackgroundPattern.gradient,
    ),
    RayTheme(
      name: 'Gemini',
      gradient: [Color(0xFF000000), Color(0xFF1e1e2e)],
      syntaxMap: oceanTheme,
      windowColor: Color(0xFF16181d),
      borderRadius: 24.0,
      fontFamily: 'Google Sans Code',
      structure: WindowStructure.glow, // Glow effect
      bgPattern: BackgroundPattern.gradient,
    ),
    RayTheme(
      name: 'Mintlify',
      gradient: [Color(0xFF0f2027), Color(0xFF203a43)],
      syntaxMap: atomOneDarkTheme,
      windowColor: Color(0xFF0d1117),
      borderRadius: 12.0,
      fontFamily: 'JetBrains Mono',
      structure: WindowStructure.standard,
    ),

    // --- Classic Presets ---
    RayTheme(
      name: 'Candy',
      gradient: [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
      syntaxMap: draculaTheme,
    ),
    RayTheme(
      name: 'Sunset',
      gradient: [Color(0xFFff7e5f), Color(0xFFfeb47b)],
      syntaxMap: atomOneDarkTheme,
    ),
    // ... Add others as needed, keeping them standard
  ];

  static RayTheme getTheme(String name) {
    return themes.firstWhere((t) => t.name == name, orElse: () => themes[0]);
  }
}

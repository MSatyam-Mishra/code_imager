import 'dart:typed_data';
import 'package:code_imager/constants/ray_themes.dart';
import 'package:flutter/material.dart';

class EditorProvider with ChangeNotifier {
  String _code = "void main() {\n  print('Hello, Ray!');\n}";
  String _language = 'dart';

  // Unified Theme State
  RayTheme _currentTheme = RayThemes.themes[0]; // Default to Candy

  double _padding = 64.0;
  bool _showLineNumbers = false;

  // Window Controls
  bool _darkMode =
      true; // Still useful for window frame style (light/dark dots)
  bool _showControls = true;
  String _windowStyle = 'mac';

  // Export
  Uint8List? _capturedImage;
  GlobalKey? _exportKey;

  // Getters
  String get code => _code;
  String get language => _language;
  RayTheme get theme => _currentTheme;
  double get padding => _padding;
  bool get showLineNumbers => _showLineNumbers;
  bool get darkMode => _darkMode;
  bool get showControls => _showControls;
  String get windowStyle => _windowStyle;
  Uint8List? get capturedImage => _capturedImage;
  GlobalKey? get exportKey => _exportKey;

  // Setters
  void setCode(String code) {
    _code = code;
    notifyListeners();
  }

  void setLanguage(String language) {
    _language = language;
    notifyListeners();
  }

  void setRayTheme(String themeName) {
    _currentTheme = RayThemes.getTheme(themeName);
    notifyListeners();
  }

  void setPadding(double padding) {
    _padding = padding;
    notifyListeners();
  }

  void toggleLineNumbers(bool value) {
    _showLineNumbers = value;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }

  void setWindowStyle(String style) {
    _windowStyle = style;
    notifyListeners();
  }

  void setCapturedImage(Uint8List? image) {
    _capturedImage = image;
    notifyListeners();
  }

  void setExportKey(GlobalKey key) {
    _exportKey = key;
  }
}

import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class PlatformCheck {
  static checkPlatform() {
    if (kIsWeb) {
      print('Platform is web');
      // Handle web-specific code here
    } else {
      if (Platform.isAndroid) {
        print('Platform is Android');
        // Handle Android-specific code here
      } else if (Platform.isIOS) {
        print('Platform is iOS');
        // Handle iOS-specific code here
      } else {
        print('Platform is neither web, Android, nor iOS');
        // Handle code for other platforms here
      }
    }
  }
}

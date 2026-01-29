import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CaptureUtils {
  static Future<Uint8List?> capture(GlobalKey key) async {
    try {
      RenderRepaintBoundary? boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary?;

      if (boundary == null) return null;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      print(e);
      return null;
    }
  }
}

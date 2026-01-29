import 'dart:ui';
import 'package:flutter/material.dart';

class GlassPanel extends StatelessWidget {
  final Widget child;
  final double radius;
  final double blur;
  final Color? color;
  final EdgeInsets padding;
  final Border? border;

  const GlassPanel({
    Key? key,
    required this.child,
    this.radius = 16.0,
    this.blur = 16.0,
    this.color,
    this.padding = const EdgeInsets.all(16),
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: color ?? Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(radius),
            border: border ??
                Border.all(color: Colors.white.withOpacity(0.1), width: 1),
          ),
          child: child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GridBackground extends StatelessWidget {
  final Color backgroundColor;
  final Color gridColor;
  final Widget? child;

  const GridBackground({
    Key? key,
    required this.backgroundColor,
    this.gridColor = const Color(0xFF333333),
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter:
          _GridPainter(gridColor: gridColor, backgroundColor: backgroundColor),
      child: Container(child: child),
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color gridColor;
  final Color backgroundColor;

  _GridPainter({required this.gridColor, required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw background
    final bgPaint = Paint()..color = backgroundColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    final paint = Paint()
      ..color = gridColor.withOpacity(0.2) // Subtle grid
      ..strokeWidth = 1;

    const double step = 40.0;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

import 'package:flutter/material.dart';
import '../constants/ray_themes.dart';

class ThemeWindow extends StatelessWidget {
  final RayTheme theme;
  final Widget child;

  const ThemeWindow({Key? key, required this.theme, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (theme.structure) {
      case WindowStructure.tech:
        return _buildTechWindow(context);
      case WindowStructure.glow:
        return _buildGlowWindow(context);
      case WindowStructure.minimal:
        return _buildMinimalWindow(context);
      case WindowStructure.standard:
      default:
        return _buildStandardWindow(context);
    }
  }

  Widget _buildStandardWindow(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.windowColor,
        borderRadius: BorderRadius.circular(theme.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.55),
            blurRadius: 50,
            offset: const Offset(0, 20),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (theme.hasControls)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  _buildDot(Color(0xFFff5f56)),
                  SizedBox(width: 8),
                  _buildDot(Color(0xFFffbd2e)),
                  SizedBox(width: 8),
                  _buildDot(Color(0xFF27c93f)),
                ],
              ),
            ),
          ClipRRect(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(theme.borderRadius)),
              child: child),
        ],
      ),
    );
  }

  Widget _buildTechWindow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0), // Space for crop marks
      child: CustomPaint(
        foregroundPainter: _TechCropMarksPainter(),
        child: Container(
          decoration: BoxDecoration(
            color: theme.windowColor,
            border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Vercel often has a "Command" title or filename header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.white.withOpacity(0.1)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.code,
                        color: Colors.white.withOpacity(0.4), size: 16),
                    SizedBox(width: 8),
                    Text("index.tsx",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontFamily: 'Geist Mono',
                            fontSize: 13)),
                  ],
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlowWindow(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: theme.windowColor,
            borderRadius: BorderRadius.circular(theme.borderRadius),
            boxShadow: [
              // Inner sharp glow
              BoxShadow(
                color: Color(0xFF6366f1).withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 0,
              ),
              // Outer wide glow
              BoxShadow(
                color: Color(0xFFa855f7).withOpacity(0.2),
                blurRadius: 100,
                spreadRadius: 10,
              ),
            ],
            border: Border.all(color: Colors.white.withOpacity(0.1))),
        child: Column(
          children: [
            // Gemini has no header usually, or just padding
            SizedBox(height: 24),
            child
          ],
        ));
  }

  Widget _buildMinimalWindow(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.windowColor,
          borderRadius: BorderRadius.circular(theme.borderRadius),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: child,
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _TechCropMarksPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    double length = 8.0;
    double offset = 4.0; // Distance from corner

    // We draw "corners" OUTSIDE the box.
    // Top Left (draws slightly away from 0,0)
    final path = Path();

    // Top Left
    path.moveTo(-length, 0);
    path.lineTo(0, 0);
    path.moveTo(0, -length);
    path.lineTo(0, 0);

    // Top Right
    path.moveTo(size.width, 0);
    path.lineTo(size.width + length, 0);
    path.moveTo(size.width, -length);
    path.lineTo(size.width, 0);

    // Bottom Left
    path.moveTo(-length, size.height);
    path.lineTo(0, size.height);
    path.moveTo(0, size.height + length);
    path.lineTo(0, size.height);

    // Bottom Right
    path.moveTo(size.width, size.height);
    path.lineTo(size.width + length, size.height);
    path.moveTo(size.width, size.height + length);
    path.lineTo(size.width, size.height);

    // Center Crosshairs
    final centerPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 1;
    // Top Center
    canvas.drawLine(Offset(size.width / 2, -length / 2),
        Offset(size.width / 2, length / 2), centerPaint); // Vertical
    canvas.drawLine(Offset(size.width / 2 - length / 2, 0),
        Offset(size.width / 2 + length / 2, 0), centerPaint); // Horizontal

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

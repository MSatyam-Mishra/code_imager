import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final List<Color> colors;
  final Widget? child;

  const GradientBackground({
    Key? key,
    required this.colors,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}

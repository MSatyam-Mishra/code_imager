import 'package:flutter/material.dart';

class ResizableContainer extends StatefulWidget {
  final Widget child;
  final double minWidth;
  final double maxWidth;
  final double initialWidth;
  final Function(double) onResize;

  const ResizableContainer({
    Key? key,
    required this.child,
    this.minWidth = 500.0,
    this.maxWidth = 1000.0,
    this.initialWidth = 500.0,
    required this.onResize,
  }) : super(key: key);

  @override
  State<ResizableContainer> createState() => _ResizableContainerState();
}

class _ResizableContainerState extends State<ResizableContainer> {
  late double _width;

  @override
  void initState() {
    super.initState();
    _width = widget.initialWidth;
  }

  void _updateWidth(double delta) {
    setState(() {
      _width += delta * 2; // Expand both sides effectively (symmetric feel)
      if (_width < widget.minWidth) _width = widget.minWidth;
      if (_width > widget.maxWidth) _width = widget.maxWidth;
    });
    widget.onResize(_width);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left Handle
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanUpdate: (details) {
            _updateWidth(-details.delta.dx);
          },
          child: _buildHandle(),
        ),

        // Content
        Container(
          width: _width,
          constraints: BoxConstraints(
            minWidth: widget.minWidth,
            maxWidth: widget.maxWidth,
          ),
          child: widget.child,
        ),

        // Right Handle
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanUpdate: (details) {
            _updateWidth(details.delta.dx);
          },
          child: _buildHandle(),
        ),
      ],
    );
  }

  Widget _buildHandle() {
    return MouseRegion(
      cursor: SystemMouseCursors.resizeLeftRight,
      child: Container(
        width: 20,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(Icons.drag_handle, color: Colors.white, size: 16),
      ),
    );
  }
}

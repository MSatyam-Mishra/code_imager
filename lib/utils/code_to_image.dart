import 'package:flutter/material.dart';

class CodeToImage extends StatefulWidget {
  final Function(GlobalKey key) builder;
  const CodeToImage({super.key, required this.builder});

  @override
  State<CodeToImage> createState() => _CodeToImageState();
}

class _CodeToImageState extends State<CodeToImage> {
  final globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: widget.builder(globalKey),
    );
  }
}

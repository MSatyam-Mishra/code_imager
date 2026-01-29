import 'package:code_imager/widgets/code_preview_window.dart';
import 'package:code_imager/widgets/control_panel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Deep background
      body: Stack(
        children: [
          // Main Preview Area
          const Positioned.fill(
            child: CodePreviewWindow(),
          ),

          // Control Panel (Floating Center Bottom)
          Positioned(
            left: 0,
            right: 0,
            bottom: 30, // Floating
            child: Center(
              child: const ControlPanel(),
            ),
          ),

          // Logo / Header (Top Left)
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              children: [
                Icon(Icons.code, color: Colors.white, size: 32),
                SizedBox(width: 8),
                Text("Codimager",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "DMSans")),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:typed_data';
import 'package:code_imager/constants/ray_themes.dart';
import 'package:code_imager/constants/themes.dart';
import 'package:code_imager/providers/editor_provider.dart';
import 'package:code_imager/utils/capture_utils.dart'; // import util
import 'package:code_imager/utils/image_downloader.dart';
import 'package:code_imager/widgets/ui/glass_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get list of themes
    final themeNames = RayThemes.themes.map((t) => t.name).toList();

    return GlassPanel(
      radius: 12,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Unified Theme Dropdown
          _buildDropdown(
            context,
            label: "Theme",
            value: context.watch<EditorProvider>().theme.name,
            items: themeNames,
            onChanged: (v) => context.read<EditorProvider>().setRayTheme(v!),
          ),
          _divider(),

          // Language
          _buildDropdown(
            context,
            label: "Lang",
            value: context.watch<EditorProvider>().language,
            items: [
              'dart',
              'python',
              'javascript',
              'java',
              'cpp',
              'go',
              'rust'
            ],
            onChanged: (v) => context.read<EditorProvider>().setLanguage(v!),
          ),
          _divider(),

          // Dark Mode Toggle (Window only)
          _buildIconButton(
            context,
            icon: context.watch<EditorProvider>().darkMode
                ? Icons.dark_mode
                : Icons.light_mode,
            onTap: () => context
                .read<EditorProvider>()
                .toggleDarkMode(!context.read<EditorProvider>().darkMode),
            tooltip: "Toggle Window Mode",
          ),
          _divider(),

          // Padding
          _buildPaddingSelector(context),

          _divider(),
          // Export
          _buildExportButton(context)
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 24,
      width: 1,
      color: Colors.white.withOpacity(0.1),
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }

  Widget _buildDropdown(BuildContext context,
      {required String label,
      required String value,
      required List<String> items,
      required Function(String?) onChanged}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: Colors.white54,
                fontSize: 10,
                fontFamily: AppThemes.fontUI)),
        SizedBox(
          height: 24,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Color(0xFF1e1e1e),
              value: value,
              icon: Icon(Icons.keyboard_arrow_down,
                  color: Colors.white, size: 16),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: AppThemes.fontUI,
                  fontWeight: FontWeight.w500),
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaddingSelector(BuildContext context) {
    final current = context.watch<EditorProvider>().padding;
    final next = current == 16
        ? 32.0
        : (current == 32 ? 64.0 : (current == 64 ? 128.0 : 16.0));

    return GestureDetector(
      onTap: () => context.read<EditorProvider>().setPadding(next),
      child: Column(
        children: [
          Text("Padding",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 10,
                  fontFamily: AppThemes.fontUI)),
          Text(current.toInt().toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: AppThemes.fontUI,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context,
      {required IconData icon,
      required VoidCallback onTap,
      required String tooltip}) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 20),
      onPressed: onTap,
      tooltip: tooltip,
      constraints: BoxConstraints(),
      padding: EdgeInsets.zero,
    );
  }

  Widget _buildExportButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final key = context.read<EditorProvider>().exportKey;
        if (key != null) {
          final bytes = await CaptureUtils.capture(key);
          if (bytes != null) {
            ImgDownloader.downloadImageWeb(bytes);
          }
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFff4e50), // Accent color
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          minimumSize: Size(0, 32)),
      child: Text("Export",
          style: TextStyle(
              fontFamily: AppThemes.fontUI, fontWeight: FontWeight.bold)),
    );
  }
}

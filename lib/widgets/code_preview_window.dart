import 'package:code_imager/providers/editor_provider.dart';
import 'package:code_imager/widgets/ui/gradient_background.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/go.dart';
import 'package:highlight/languages/rust.dart';
import 'package:code_imager/widgets/ui/resizable_container.dart';
import 'package:code_imager/widgets/theme_window.dart';
import 'package:code_imager/widgets/ui/grid_background.dart';
import 'package:code_imager/constants/ray_themes.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CodePreviewWindow extends StatefulWidget {
  const CodePreviewWindow({Key? key}) : super(key: key);

  @override
  State<CodePreviewWindow> createState() => _CodePreviewWindowState();
}

class _CodePreviewWindowState extends State<CodePreviewWindow> {
  CodeController? _codeController;
  final GlobalKey _repaintKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(
      text: "",
      language: dart,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<EditorProvider>().setExportKey(_repaintKey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditorProvider>(context);

    // Sync Text
    if (_codeController!.text.isEmpty && provider.code.isNotEmpty) {
      _codeController!.text = provider.code;
    }

    // Map Lang (Keep strict mapping)
    switch (provider.language) {
      case 'python':
        _codeController!.language = python;
        break;
      case 'javascript':
        _codeController!.language = javascript;
        break;
      case 'java':
        _codeController!.language = java;
        break;
      case 'cpp':
        _codeController!.language = cpp;
        break;
      case 'go':
        _codeController!.language = go;
        break;
      case 'rust':
        _codeController!.language = rust;
        break;
      default:
        _codeController!.language = dart;
        break;
    }

    Widget background;
    if (provider.theme.bgPattern == BackgroundPattern.grid) {
      background = GridBackground(
        backgroundColor: provider.theme.gradient.first,
        child: Center(child: _buildContent(provider)),
      );
    } else {
      background = GradientBackground(
        colors: provider.theme.gradient,
        child: Center(child: _buildContent(provider)),
      );
    }

    return background;
  }

  Widget _buildContent(EditorProvider provider) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(provider.padding),
      child: RepaintBoundary(
        key: _repaintKey,
        child: ResizableContainer(
          initialWidth: 500,
          minWidth: 400,
          maxWidth: 1000,
          onResize: (w) {},
          child: ThemeWindow(
            theme: provider.theme,
            child: CodeTheme(
              data: CodeThemeData(styles: provider.theme.syntaxMap),
              child: Container(
                color: Colors.transparent, // ThemeWindow handles background
                padding: const EdgeInsets.all(16.0), // Exact Ray.so padding
                child: CodeField(
                  controller: _codeController!,
                  background: Colors.transparent,
                  lineNumbers: provider.showLineNumbers,
                  lineNumberStyle: LineNumberStyle(
                    width: 48,
                    margin: 16,
                    textStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                  ),
                  textStyle: GoogleFonts.getFont(
                    _getFontFamily(provider.theme.fontFamily),
                    textStyle: TextStyle(
                      fontSize: 15, // Exact Ray.so size
                      height: 1.5, // Exact Ray.so line height
                    ),
                  ),
                  onChanged: (value) => provider.setCode(value),
                  minLines: 5,
                  wrap: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getFontFamily(String themeFont) {
    // Map theme font names to Google Fonts equivalents if needed
    // GoogleFonts.getFont expects the font name as in Google Fonts
    switch (themeFont) {
      case 'Geist Mono':
        return 'Space Mono'; // Fallback for Geist (not in GoogleFonts yet)
      case 'Google Sans Code':
        return 'Source Code Pro'; // Fallback for proprietary
      case 'Fira Code':
        return 'Fira Code';
      case 'JetBrains Mono':
        return 'JetBrains Mono';
      case 'UbuntuMono':
        return 'Ubuntu Mono';
      case 'Söhne Mono':
        return 'Roboto Mono';
      default:
        return 'Source Code Pro';
    }
  }
}

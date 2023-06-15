import 'dart:typed_data';
import 'package:code_imager/utils/code_to_image.dart';
import 'package:code_imager/utils/image-data.dart';
import 'package:code_imager/utils/image_downloader.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';

import 'components/loveStyled_titlebar.dart';
import 'components/macStyled_titlebar.dart';
import 'components/sweatstyled_titlebar.dart';
import 'constants/colors_styles.dart';

void main() {
  if (kIsWeb) {
    MetaSEO().config();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Codimager',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: CodeEditor(),
    );
  }
}

class CodeEditor extends StatefulWidget {
  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  CodeController? _codeController;
  late GlobalKey key1;
  Uint8List? bytes1;
  String? selectedFonts;
  List<Color> bgColorList = [
    const Color(0xff22212c),
    const Color(0xff151718),
    const Color(0xff282a36),
    const Color(0xFF031C35)
  ];
  late double userWidth;
// double? userFontsize;
  List<Widget> titlebarList = [
    const MacStyled(),
    const SweatStyled(),
    const LoveStyled()
  ];
  late Color dropdownValue;
  Widget? titlebarStyle;
  @override
  void initState() {
    super.initState();
    selectedFonts = fontsList[0];
    dropdownValue = bgColorList.first;
    userWidth = screenWidth * 0.7;
    titlebarStyle = titlebarList.first;
    // userFontsize = 20;
    const source = "void main() {\n    print(\"Hello, world!\");\n}";
    // Instantiate the CodeController
    _codeController = CodeController(
      text: source,
      patternMap: {
        r'[//]': commentStyle1,
        r'[/**/]': commentStyle2,
        r'".*"': stringStyle,
        r'dart': systemStyle,
        r'[a-zA-Z0-9]+\(.*\)+\{.*}+\[]': symbolStyle,
      },
      stringMap: {
        "void": keywordStyle,
        "print": methodStyle,
        "main": methodStyle,
        "class": classStyle,
        "if": keywordStyle,
        "for": keywordStyle,
        "init": methodStyle,
        "setState": methodStyle,
        "int": varStyle,
        "String": varStyle,
        "double": varStyle,
        "bool": varStyle,
        "return": keywordStyle,
        "true": keywordStyle,
        "false": keywordStyle,
        "null": keywordStyle,
        "var": varStyle,
        "final": keywordStyle,
        "const": keywordStyle,
        "while": keywordStyle,
        "else": keywordStyle,
        "import": keywordStyle,
        "as": keywordStyle,
        "extends": keywordStyle,
        "this": keywordStyle,
        "new": keywordStyle,
        "await": keywordStyle,
        "async": keywordStyle,
        "Future": classStyle,
        "List": classStyle,
        "Map": classStyle,
        "Switch": classStyle,
        "case": keywordStyle,
        "default": keywordStyle,
        "break": keywordStyle,
        "continue": keywordStyle,
        "assert": exceptionStyle,
        "throw": exceptionStyle,
        "catch": exceptionStyle,
        "on": exceptionStyle,
        "try": exceptionStyle,
        "StatelessWidget": classStyle,
        "color": keywordStyle,
        "Function": classStyle,
        "do": methodStyle,
        "finally": methodStyle,
        "factory": methodStyle,
        "get": methodStyle,
        "export": methodStyle,
        "abstract": methodStyle,
        "hide": methodStyle,
        "deffered": methodStyle,
        "dynamic": methodStyle,
        "implements": methodStyle,
        "in": methodStyle,
        "interface": methodStyle,
        "extension": methodStyle,
        "external": methodStyle,
        "is": methodStyle,
        "library": methodStyle,
        "mixin": methodStyle,
        "operator": methodStyle,
        "part": methodStyle,
        "rethrow": methodStyle,
        "set": methodStyle,
        "show": methodStyle,
        "static": methodStyle,
        "yield": methodStyle,
        "typedef": methodStyle,
        "with": methodStyle,
        "style": enumStyle,
        "Container": widgetStyle,
        "AbsorbPointer": widgetStyle,
        "AlertDialog": widgetStyle,
        "Align": widgetStyle,
        "AnimatedAlign": widgetStyle,
        "AnimatedBuilder": widgetStyle,
        "AnimatedContainer": widgetStyle,
        "AnimatedCrossFade": widgetStyle,
        "AnimatedDefaultTextStyle": widgetStyle,
        "AnimatedList": widgetStyle,
        "AnimatedListState": widgetStyle,
        "AnimatedModalBarrier": widgetStyle,
        "AnimatedOpacity": widgetStyle,
        "AnimatedPhysicalModel": widgetStyle,
        "AnimatedPositioned": widgetStyle,
        "AnimatedSize": widgetStyle,
        "AnimatedWidget": widgetStyle,
        "AnimatedWidgetBaseState": widgetStyle,
        "App bar": widgetStyle,
        "AppBar": widgetStyle,
        "AspectRatio": widgetStyle,
        "Autocomplete": widgetStyle,
        "BackdropFilter": widgetStyle,
        "Badge": widgetStyle,
        "Baseline": widgetStyle,
        "Bottom app bar": widgetStyle,
        "Bottom sheet": widgetStyle,
        "BottomNavigationBar": widgetStyle,
        "BottomSheet": widgetStyle,
        "Card": widgetStyle,
        "Center": widgetStyle,
        "Checkbox": widgetStyle,
        "Chip": widgetStyle,
        "CircularProgressIndicator": widgetStyle,
        "ClipOval": widgetStyle,
        "ClipPath": widgetStyle,
        "ClipRect": widgetStyle,
        "Column": widgetStyle,
        "ConstrainedBox": widgetStyle,
        "CupertinoActionSheet": widgetStyle,
        "CupertinoActivityIndicator": widgetStyle,
        "CupertinoAlertDialog": widgetStyle,
        "CupertinoButton": widgetStyle,
        "CupertinoContextMenu": widgetStyle,
        "CupertinoDatePicker": widgetStyle,
        "CupertinoDialogAction": widgetStyle,
        "CupertinoFullscreenDialogTransition": widgetStyle,
        "CupertinoListSection": widgetStyle,
        "CupertinoListTile": widgetStyle,
        "CupertinoNavigationBar": widgetStyle,
        "CupertinoPageScaffold": widgetStyle,
        "CupertinoPageTransition": widgetStyle,
        "CupertinoPicker": widgetStyle,
        "CupertinoPopupSurface": widgetStyle,
        "CupertinoScrollbar": widgetStyle,
        "CupertinoSearchTextField": widgetStyle,
        "CupertinoSegmentedControl": widgetStyle,
        "CupertinoSlider": widgetStyle,
        "CupertinoSlidingSegmentedControl": widgetStyle,
        "CupertinoSliverNavigationBar": widgetStyle,
        "CupertinoSwitch": widgetStyle,
        "CupertinoTabBar": widgetStyle,
        "CupertinoTabScaffold": widgetStyle,
        "CupertinoTabView": widgetStyle,
        "CupertinoTextField": widgetStyle,
        "CupertinoTimerPicker": widgetStyle,
        "CustomMultiChildLayout": widgetStyle,
        "CustomPaint": widgetStyle,
        "CustomScrollView": widgetStyle,
        "CustomSingleChildLayout": widgetStyle,
        "DataTable": widgetStyle,
        "DecoratedBox": widgetStyle,
        "DecoratedBoxTransition": widgetStyle,
        "DefaultTextStyle": widgetStyle,
        "Dialog": widgetStyle,
        "Dismissible": widgetStyle,
        "Divider": widgetStyle,
        "DragTarget": widgetStyle,
        "Draggable": widgetStyle,
        "DraggableScrollableSheet": widgetStyle,
        "Drawer": widgetStyle,
        "DropdownButton": widgetStyle,
        "ElevatedButton": widgetStyle,
        "ExcludeSemantics": widgetStyle,
        "Expanded": widgetStyle,
        "ExpansionPanel": widgetStyle,
        "Extended FAB": widgetStyle,
        "FAB": widgetStyle,
        "FadeTransition": widgetStyle,
        "FittedBox": widgetStyle,
        "FloatingActionButton": widgetStyle,
        "Flow": widgetStyle,
        "FlutterLogo": widgetStyle,
        "Form": widgetStyle,
        "FormField": widgetStyle,
        "FractionalTranslation": widgetStyle,
        "FractionallySizedBox": widgetStyle,
        "FutureBuilder": widgetStyle,
        "GestureDetector": widgetStyle,
        "GridView": widgetStyle,
        "Hero": widgetStyle,
        "Icon": widgetStyle,
        "IconButton": widgetStyle,
        "IgnorePointer": widgetStyle,
        "Image": widgetStyle,
        "IndexedStack": widgetStyle,
        "InteractiveViewer": widgetStyle,
        "IntrinsicHeight": widgetStyle,
        "IntrinsicWidth": widgetStyle,
        "LayoutBuilder": widgetStyle,
        "LimitedBox": widgetStyle,
        "LinearProgressIndicator": widgetStyle,
        "ListBody": widgetStyle,
        "ListTile": widgetStyle,
        "ListView": widgetStyle,
        "LongPressDraggable": widgetStyle,
        "MaterialApp": widgetStyle,
        "MediaQuery": widgetStyle,
        "Menu": widgetStyle,
        "MergeSemantics": widgetStyle,
        "Navigation bar": widgetStyle,
        "Navigation drawer": widgetStyle,
        "Navigation rail": widgetStyle,
        "Navigator": widgetStyle,
        "NestedScrollView": widgetStyle,
        "NotificationListener": widgetStyle,
        "Offstage": widgetStyle,
        "Opacity": widgetStyle,
        "OutlinedButton": widgetStyle,
        "OverflowBox": widgetStyle,
        "Padding": widgetStyle,
        "PageView": widgetStyle,
        "Placeholder": widgetStyle,
        "PopupMenuButton": widgetStyle,
        "PositionedTransition": widgetStyle,
        "Radio": widgetStyle,
        "RawImage": widgetStyle,
        "RawKeyboardListener": widgetStyle,
        "RefreshIndicator": widgetStyle,
        "ReorderableListView": widgetStyle,
        "RichText": widgetStyle,
        "RotatedBox": widgetStyle,
        "RotationTransition": widgetStyle,
        "Row": widgetStyle,
        "Scaffold": widgetStyle,
        "ScaleTransition": widgetStyle,
        "ScrollConfiguration": widgetStyle,
        "Scrollable": widgetStyle,
        "Scrollbar": widgetStyle,
        "Semantics": widgetStyle,
        "SimpleDialog": widgetStyle,
        "SingleChildScrollView": widgetStyle,
        "SizeTransition": widgetStyle,
        "SizedBox": widgetStyle,
        "SizedOverflowBox": widgetStyle,
        "SlideTransition": widgetStyle,
        "Slider": widgetStyle,
        "SliverChildBuilderDelegate": widgetStyle,
        "SliverChildListDelegate": widgetStyle,
        "SliverFixedExtentList": widgetStyle,
        "SliverGrid": widgetStyle,
        "SliverList": widgetStyle,
        "SliverPadding": widgetStyle,
        "SliverPersistentHeader": widgetStyle,
        "SliverToBoxAdapter": widgetStyle,
        "SnackBar": widgetStyle,
        "Snackbar": widgetStyle,
        "Stack": widgetStyle,
        "Stepper": widgetStyle,
        "StreamBuilder": widgetStyle,
        "TabBar": widgetStyle,
        "TabBarView": widgetStyle,
        "TabController": widgetStyle,
        "TabPageSelector": widgetStyle,
        "Table": widgetStyle,
        "Text": widgetStyle,
        "TextButton": widgetStyle,
        "TextField": widgetStyle,
        "Theme": widgetStyle,
        "Tooltip": widgetStyle,
        "Transform": widgetStyle,
        "WidgetsApp": widgetStyle,
        "Wrap": widgetStyle,
        "showDatePicker": widgetStyle,
        "SegmentedButton": widgetStyle,
        "showTimePicke": widgetStyle,
        "decoration": enumStyle,
        "BoxDecoration": widgetStyle,
        "Border": widgetStyle,
        "BorderRadius": widgetStyle,
        "BorderSide": widgetStyle,
        "BoxBorder": widgetStyle,
        "CircleBorder": widgetStyle,
        "ContinuousRectangleBorder": widgetStyle,
        "RoundedRectangleBorder": widgetStyle,
        "StadiumBorder": widgetStyle,
        "UnderlineInputBorder": widgetStyle,
        "InputDecoration": widgetStyle,
        "TextStyle": widgetStyle,
        "TextAlign": widgetStyle,
        "TextDecoration": widgetStyle,
        "TextOverflow": widgetStyle,
        "TextSpan": widgetStyle,
        "TextTheme": widgetStyle,
        "TextWidthBasis": widgetStyle,
        "TextHeightBehavior": widgetStyle,
        "TextBaseline": widgetStyle,
        "TextLeadingDistribution": widgetStyle,
        "Color": widgetStyle,
        "fontSize": enumStyle,
        "fontWeight": enumStyle,
        "fontFamily": enumStyle,
        "wordSpacing": enumStyle,
        "height": enumStyle,
        "width": enumStyle,
        "letterSpacing": enumStyle,
        "child": enumStyle,
        "padding": enumStyle,
        "super": enumStyle,
        "key": keywordStyle,
        "borderRadius": enumStyle,
        "Orientation": widgetStyle,
        "context": keywordStyle,
        "EdgeInsets": widgetStyle,
      },
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;

    var titleBarDropDown = Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: descriptionColor,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              dropdownColor: dropDownColor,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: elementAccentColor,
              ),
              value: titlebarStyle,
              onChanged: (value) {
                setState(() {
                  titlebarStyle = value as Widget;
                });
              },
              items: titlebarList.map<DropdownMenuItem<Widget>>(
                (Widget value) {
                  return DropdownMenuItem<Widget>(
                      value: value,
                      child: Row(
                        children: [
                          Container(
                            child: value,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ],
                      ));
                },
              ).toList()),
        ));

    var terminalColor = Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: descriptionColor,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            dropdownColor: dropDownColor,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: elementAccentColor,
            ),
            elevation: 0,
            hint: const Text("Colors"),
            value: dropdownValue,
            onChanged: (value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: bgColorList.map<DropdownMenuItem<Color>>(
              (Color value) {
                return DropdownMenuItem<Color>(
                    value: value,
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 60,
                          decoration: BoxDecoration(
                              // border:
                              //     Border.all(width: 2, color: descriptionColor),
                              color: value,
                              borderRadius: BorderRadius.circular(5)),
                        )
                      ],
                    ));
              },
            ).toList()),
      ),
    );

    var downloadImage = InkWell(
      onTap: () async {
        //add method to download code Image
        final bytes1 = await Utils.capture(key1);
        setState(() {
          this.bytes1 = bytes1;
        });

        ImgDownloader.downloadImageWeb(bytes1);
      },
      child: Center(
        child: Container(
          // width: 30,
          // height: 30,
          height: 50,
          padding: const EdgeInsets.only(left: 10, right: 10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: descriptionColor,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Image.asset(
            "assets/icons/download.png",
            fit: BoxFit.cover,
            color: elementAccentColor,
            width: 30,
            height: 30,
          )),
        ),
      ),
    );
    var codeEditor = CodeToImage(
      builder: (key) {
        this.key1 = key;
        return Container(
          //wrap this container for screenshot
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 219, 98, 139),
            Color.fromARGB(255, 150, 109, 177)
          ])),
          padding: const EdgeInsets.all(70),
          child: Container(
            padding:
                const EdgeInsets.all(10), //margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: dropdownValue),
            child: Column(
              children: [
                titlebarStyle as Widget,
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CodeField(
                    horizontalScroll: false,
                    lineNumbers: false,
                    background: dropdownValue,
                    padding: const EdgeInsets.all(5),
                    controller: _codeController!,
                    cursorColor: keywordColor,
                    //horizontalScroll: true,
                    textStyle: const TextStyle(
                        fontFamily: "UbuntuMono",
                        letterSpacing: 1,
                        height: 1.5,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    var widthSlider = Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: descriptionColor,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          const Text("Width:", style: elementStyle),
          SizedBox(
            width: 60,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  overlayShape: SliderComponentShape.noOverlay,
                  trackHeight: 10),
              child: Slider(
                activeColor: elementAccentColor,
                inactiveColor: elementAccentColor.withOpacity(0.2),
                min: screenWidth / 2,
                max: screenWidth * 0.7,
                value: userWidth,
                onChanged: (double newUserWidth) {
                  setState(() {
                    userWidth = newUserWidth;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );

    // var fontSlider = Row(
    //   children: [
    //     const Text(
    //       "Font:",
    //       style: folderTitle,
    //     ),
    //     SizedBox(
    //       width: 60,
    //       child: SliderTheme(
    //         data: SliderTheme.of(context).copyWith(
    //             overlayShape: SliderComponentShape.noOverlay, trackHeight: 10),
    //         child: Slider(
    //           activeColor: bgColor,
    //           min: 15,
    //           max: 20,
    //           value: userFontsize as double,
    //           onChanged: (double newUserFont) {
    //             setState(() {
    //               userFontsize = newUserFont;
    //             });
    //           },
    //         ),
    //       ),
    //     ),
    //   ],
    // );
    MetaSEO meta = MetaSEO();
    meta.facebookAppID(facebookAppID: 'Codimager');
    meta.ogTitle(ogTitle: 'Codimage');
    meta.ogDescription(
        ogDescription:
            'Generate beautiful code images effortlessly with Codimager');
    meta.ogImage(
        ogImage:
            'https://github.com/MSatyam-Mishra/image-collection/assets/12216430/65e4da42-af10-4a56-bce7-c8f76cccb5c1');

    // here you can add any tags does not exist in the package as this
    meta.propertyContent(
        property: 'og:site_name',
        content: 'Generate beautiful code images effortlessly with Codimager');

    // or if you want to add twitter card meta tags just as the following
    meta.twitterCard(twitterCard: TwitterCard.summaryLargeImage);
    meta.twitterTitle(twitterTitle: 'Codimager');
    meta.twitterDescription(
        twitterDescription:
            'Generate beautiful code images effortlessly with Codimager');
    meta.twitterImage(
        twitterImage:
            'https://github.com/MSatyam-Mishra/image-collection/assets/12216430/65e4da42-af10-4a56-bce7-c8f76cccb5c1');

    // here you can add any tags does not exist in the package as this
    meta.nameContent(name: 'twitter:site', content: '@an___earthling');
    // Add meta seo data for web app as you want
    meta.author(author: 'Satyam Mishra');
    meta.description(
        description:
            'Generate beautiful code images effortlessly with Codimager');
    meta.keywords(
        keywords:
            'Flutter code images, Dart, Web, Dart code visualization, Code snippets for Flutter, Visualize Flutter code, Dart code images, Code visualization tool, Flutter code showcase, Generate code visuals, Dart code graphics, Flutter code snapshots, Code image generator, Visual code representation, Code art for Flutter, Dart code visualization tool, Code to image converter, Flutter code graphics, Code screenshot generator, Dart code snapshots, Code illustration for Flutter, Visualize Dart code, The best code image generator, The best Flutter code visualization, The best Dart code image tool, The best code image generator for Dart, Beautiful code image generator, Beautiful Flutter code visualization, Beautiful Dart code image tool, Beautiful code visualization for Flutter, Beautiful code images for Dart');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png"),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Generate Beautiful code images effortlessly",
                  style: descriptionStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Center(
            child: deviceOrientation == Orientation.landscape
                ? Container(
                    margin: const EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: playgroundColor),
                    width: userWidth,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widthSlider,
                                // fontSlider,
                                terminalColor,
                                titleBarDropDown,
                                downloadImage,
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth * 0.7,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(7),
                                    bottomLeft: Radius.circular(7)),
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 219, 98, 139),
                                  Color.fromARGB(255, 150, 109, 177)
                                ])),
                            child: SizedBox(
                              width: userWidth,
                              //height: screenHeight - 40,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(7),
                                      bottomLeft: Radius.circular(7)),
                                  child: Center(child: codeEditor)),
                            ),
                          )
                        ]),
                  )
                : const Center(
                    child: Text(
                      "Currently Codimager only works on Landcape mode",
                      style: folderTitle,
                    ),
                  ),
          )
        ]),
      ),
    );
  }

  Widget buildImage(Uint8List bytes) =>
      bytes != null ? Image.memory(bytes) : Container();
}

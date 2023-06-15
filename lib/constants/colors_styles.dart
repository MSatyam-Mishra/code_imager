import 'package:flutter/material.dart';
import 'dart:ui' as ui;

//size
final screenWidth = (ui.window.physicalSize.width / ui.window.devicePixelRatio);
final screenHeight =
    (ui.window.physicalSize.height / ui.window.devicePixelRatio);

//systemColor
const bgColor = Color(0xff22212c);
const bgColor1 = Color(0xff151718);
const playgroundColor = Color.fromARGB(255, 27, 27, 27);
const borderColor = Color.fromARGB(255, 102, 102, 102);
const systemColor = Color(0xff896740);
const descriptionColor = Color(0xfff9e135);
const elementAccentColor = Color(0xffdf9d39);
const dropDownColor = Color(0xff1b1b1b);
//Colors
const keywordColor = Color(0xffff80bf);
const methodColor = Color(0xff79ff80);
const symbolColor = Color(0xfff8f8f2);
const classColor = Color(0xff79ff80);
const stringColor = Color(0xffffdc4d);
const varColor = Color(0xff8bdecc);
const exceptionColor = Color(0xff498aff);
const commentColor1 = Color.fromARGB(255, 124, 126, 126);
const commentColor2 = Color(0xffaaabab);
const enumColor = Color.fromARGB(255, 161, 168, 108);
const widgetColor = Color(0xff4fc7fd);

//textStyles
const descriptionStyle = TextStyle(
    fontSize: 20,
    color: descriptionColor,
    fontFamily: "DMSans",
    wordSpacing: 1,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2);

const folderTitle = TextStyle(
    fontSize: 12,
    color: Colors.white24,
    fontFamily: "DMSans",
    wordSpacing: 1,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2);
const elementStyle = TextStyle(
    fontSize: 15,
    color: elementAccentColor,
    fontFamily: "DMSans",
    wordSpacing: 1,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.2);

const btnText = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontFamily: "GrandifloraOne",
    wordSpacing: 1,
    letterSpacing: 1.2);

const commentStyle1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: commentColor1,
    fontFamily: "UbuntuMono",
    wordSpacing: 1,
    height: 1.5,
    letterSpacing: 1);
const widgetStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: widgetColor,
    fontFamily: "UbuntuMono",
    wordSpacing: 1,
    height: 1.5,
    letterSpacing: 1);
const enumStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: enumColor,
    fontFamily: "UbuntuMono",
    wordSpacing: 1,
    height: 1.5,
    letterSpacing: 1);
const commentStyle2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: commentColor2,
    fontFamily: "UbuntuMono",
    wordSpacing: 1,
    height: 1.5,
    letterSpacing: 1);
const keywordStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: keywordColor,
    fontFamily: "UbuntuMono",
    wordSpacing: 1,
    height: 1.5,
    letterSpacing: 1);
const methodStyle = TextStyle(
    fontSize: 20,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
    color: methodColor,
    height: 1.5,
    fontFamily: "UbuntuMono");
const classStyle = TextStyle(
    fontSize: 18,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
    color: classColor,
    height: 1.5,
    fontFamily: "UbuntuMono");
const varStyle = TextStyle(
    fontSize: 20,
    letterSpacing: 1,
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: varColor,
    fontFamily: "UbuntuMono");
const systemStyle = TextStyle(
    fontSize: 20,
    letterSpacing: 1,
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: systemColor,
    fontFamily: "UbuntuMono");
const exceptionStyle = TextStyle(
    fontSize: 20,
    letterSpacing: 1,
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: exceptionColor,
    fontFamily: "UbuntuMono");

const symbolStyle = TextStyle(color: Colors.green, height: 1.5);

const stringStyle = TextStyle(
    fontSize: 20,
    letterSpacing: 1,
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: stringColor,
    fontFamily: "UbuntuMono");

//font list

const List<String> fontsList = ['UbuntuMono', 'Elmessiri', 'Three', 'Four'];

//image list

List<String> iconList = [""];



// DropdownButton(
//             value: dropdownValue,
//             onChanged: (value) {
//               setState(() {
//                 dropdownValue = value!;
//               });
//             },
//             items: bgColorList.map<DropdownMenuItem<Color>>(
//               (Color value) {
//                 return DropdownMenuItem<Color>(
//                     value: value,
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 20,
//                           height: 20,
//                           color: value,
//                         )
//                       ],
//                     ));
//               },
//             ).toList())
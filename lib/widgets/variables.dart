import 'package:flutter/material.dart';

const Color WHITE = Colors.white;
const Color BLACK = Colors.black;
// ignore: non_constant_identifier_names
Color THEME_COLOR = Colors.deepOrange.shade100;
const Color DEEP_ORANGE_COLOR = Colors.deepOrange;
// ignore: non_constant_identifier_names
Color LIGHT_GREY = Colors.grey.shade200;
// ignore: non_constant_identifier_names
Color GREY = Colors.grey.shade600;
const TextDirection textDirection = TextDirection.ltr;

const STD_TEXT_STYLE = TextStyle(
    fontFamily: 'GlobalFonts', color: BLACK, fontWeight: FontWeight.bold);
const ERROR_TEXT_STYLE = TextStyle(
    fontFamily: 'GlobalFonts',
    color: Colors.redAccent,
    fontWeight: FontWeight.bold,
    fontSize: 12);
const APPBAR_TEXT_STYLE = TextStyle(
    color: BLACK,
    fontFamily: 'GlobalFonts',
    fontWeight: FontWeight.bold,
    fontSize: 23);
const LABEL_TEXT_STYLE = TextStyle(
    fontFamily: 'GlobalFonts',
    color: Color(0xFF757575),
    fontWeight: FontWeight.bold);
const INPUT_TEXT_STYLE = TextStyle(
    fontFamily: 'GlobalFonts', color: BLACK, fontWeight: FontWeight.bold);
const SNACKBAR_TEXT_STYLE = TextStyle(
  fontFamily: 'GlobalFonts',
  color: WHITE,
);
const ALERT_TEXT_STYLE = TextStyle(
  fontFamily: 'GlobalFonts',
  color: BLACK,
  fontSize: 15,
);
const ALERT_BUTTON_TEXT_STYLE = TextStyle(
  fontFamily: 'GlobalFonts',
  color: BLACK,
  fontWeight: FontWeight.w900,
);

// ignore: non_constant_identifier_names
bool IS_LOGGED_IN = true;
// ignore: non_constant_identifier_names
String? ACCESS_TOKEN;
// ignore: non_constant_identifier_names
int USER_ID = 1; //0;
// ignore: non_constant_identifier_names
String USER_NAME = "Leeta";
// ignore: non_constant_identifier_names
String USER_GSM = "0";

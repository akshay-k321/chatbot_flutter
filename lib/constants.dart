import 'package:flutter/material.dart';

const Color kPrimaryColorDark = Color(0xFF303F9F);
const Color kPrimaryColor = Color(0xFF3F51B5);
const Color kPrimaryColorLight = Color(0xFFC5CAE9);
const Color kTextPrimaryColor = Color(0xFFFFFFFF);
const Color kAccentColor = Color(0xFF03A9F4);
const Color kPrimaryTextColor = Color(0xFF212121);
const Color kSecondaryTextColor = Color(0xFF757575);
const Color kDividerColor = Color(0xFFBDBDBD);

final ButtonStyle kSubmitButtonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all<Size>(Size(double.maxFinite, 50.0)),
  textStyle: MaterialStateProperty.all<TextStyle>(
    TextStyle(
      color: kTextPrimaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(
    kPrimaryColor,
  ),
);

const TextStyle kHeadingTextStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const EdgeInsetsGeometry kFormsCardInnerPadding =
    EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0);
const EdgeInsetsGeometry kFormsCardOuterPadding =
    EdgeInsets.only(left: 16.0, right: 16.0);

const double kCardElevation = 5;
const double kBodyTextSize = 16.0;

/*------------------------------------*/
const kSendButtonTextStyle = TextStyle(
  color: Colors.blueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.blueAccent, width: 2.0),
  ),
);

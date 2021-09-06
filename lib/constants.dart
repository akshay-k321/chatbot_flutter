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
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blueAccent,
      width: 2.0,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
);

const kMessageContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(50.0)),
  border: Border.symmetric(
    vertical: BorderSide(color: Colors.blueAccent),
    horizontal: BorderSide(color: Colors.blueAccent),
  ),
  /*Border(
    top: BorderSide(color: Colors.blueAccent, width: 2.0),
  ),*/
);

String monthName(int month, {bool fullname = false}) {
  Map<int, String> months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };
  if (fullname) return months[month];
  return months[month].substring(0, 3);
}

String weekDayName(int day, {bool fullname = false}) {
  Map<int, String> days = {
    1: 'Sunday',
    2: 'Monday',
    3: 'Tuesday',
    4: 'Wednesday',
    5: 'Thursday',
    6: 'Friday',
    7: 'Saturday',
  };
  if (fullname) return days[day];
  return days[day].substring(0, 3);
}

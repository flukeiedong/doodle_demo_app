import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFFFFCE2F);
Color kSecondaryColor = Color(0xFF3C235C);
Color kScaffoldColor = Colors.white;

TextStyle kLabelTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12.0,
);

TextStyle kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24.0,
);

InputDecoration kTextFieldLogIn = InputDecoration(
  hintText: 'Don\'t forget to set the hint text',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondaryColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  FormTextField({this.labelText, this.style, this.margin});

  final String labelText;
  final TextStyle style;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.all(0.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
        ),
        style: style,
        obscureText: true,
      ),
    );
  }
}

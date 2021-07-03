import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  FormTextField({
    this.labelText,
    this.style,
    this.margin,
    this.onChanged,
    this.obscureText,
    this.keyboardType,
  });

  final String labelText;
  final TextStyle style;
  final EdgeInsetsGeometry margin;
  final Function onChanged;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.all(0.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
        ),
        style: style,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
      ),
    );
  }
}

import 'package:chatbot_demo/constants.dart';
import 'package:flutter/material.dart';

class SignInChangeText extends StatelessWidget {
  final String question;
  final String action;
  final Function onPressed;
  final Color actionColor;

  const SignInChangeText(
      {this.question, this.action, this.onPressed, this.actionColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(
            fontSize: kBodyTextSize,
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            action,
            style: TextStyle(
              color: actionColor,
              fontSize: kBodyTextSize,
            ),
          ),
        ),
      ],
    );
  }
}

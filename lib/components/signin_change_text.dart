import 'package:chatbot_demo/constants.dart';
import 'package:flutter/material.dart';

class SignInChangeText extends StatelessWidget {
  final String question;
  final String action;
  final Function onPressed;

  const SignInChangeText({this.question, this.action, this.onPressed});

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
              color: kPrimaryColor,
              fontSize: kBodyTextSize,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatbot_demo/components/rounded_button.dart';
import 'package:chatbot_demo/screens/login_screen.dart';
import 'package:chatbot_demo/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const id = 'welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Chatbot',
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Hero(
              tag: 'loginBtn',
              child: RoundedButton(
                title: 'Login',
                color: Colors.lightBlueAccent,
                onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
              ),
            ),
            Hero(
              tag: 'signupBtn',
              child: RoundedButton(
                title: 'SignUp',
                color: Colors.lightBlue,
                onPressed: () => Navigator.pushNamed(context, SignUpScreen.id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

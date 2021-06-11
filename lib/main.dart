import 'package:chatbot_demo/constants.dart';
import 'package:chatbot_demo/screens/chat_page.dart';
import 'package:chatbot_demo/screens/login_page.dart';
import 'package:chatbot_demo/screens/signup_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
      ),
      darkTheme: ThemeData.dark().copyWith(),
      routes: {
        //'/': (context) => SplashScreenPage(),
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/chat': (context) => ChatPage(),
      },
      home: LoginPage(),
    ));

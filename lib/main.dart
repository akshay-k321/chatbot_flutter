import 'package:chatbot_demo/constants.dart';
import 'package:chatbot_demo/screens/chat_page.dart';
import 'package:chatbot_demo/screens/login_page.dart';
import 'package:chatbot_demo/screens/signup_page.dart';
import 'package:chatbot_demo/screens/splash_screen_page.dart';
import 'package:chatbot_demo/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
      ),
      darkTheme: ThemeData.dark().copyWith(),
      routes: {
        SplashScreenPage.id: (context) => SplashScreenPage(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignUpPage.id: (context) => SignUpPage(),
        LoginPage.id: (context) => LoginPage(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: LoginPage.id,
    ));

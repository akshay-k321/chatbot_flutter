import 'package:chatbot_demo/constants.dart';
import 'package:chatbot_demo/screens/chat_screen.dart';
import 'package:chatbot_demo/screens/login_screen.dart';
import 'package:chatbot_demo/screens/signup_screen.dart';
import 'package:chatbot_demo/screens/splash_screen.dart';
import 'package:chatbot_demo/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
      ),
      darkTheme: ThemeData.dark().copyWith(),
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      initialRoute: SplashScreen.id,
    ));

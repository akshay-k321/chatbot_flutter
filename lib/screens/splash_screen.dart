import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatbot_demo/screens/chat_screen.dart';
import 'package:chatbot_demo/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({key}) : super(key: key);

  static const id = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showSpinner = false;
  int pause = 500;

  void initialize(BuildContext context) async {
    FirebaseApp app = await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedTextKit(
              totalRepeatCount: 2,
              pause: Duration(milliseconds: pause),
              onFinished: () {
                if (FirebaseAuth.instance.currentUser != null)
                  Navigator.pushReplacementNamed(context, ChatScreen.id);
                else
                  Navigator.pushReplacementNamed(context, WelcomeScreen.id);
              },
              onNextBeforePause: (intVal, boolVal) {
                if (showSpinner == false)
                  setState(() {
                    showSpinner = true;
                    pause = pause ~/ 4;
                  });
              },
              animatedTexts: [
                TypewriterAnimatedText(
                  'Chatbot',
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: showSpinner,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

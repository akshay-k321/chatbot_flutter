import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({key}) : super(key: key);

  static const id = 'splash';

  /*Future<void> awaitSplash(BuildContext context) async {
    sleep(Duration(milliseconds: 2500));
    Navigator.pushNamed(context, '/signup');
    Navigator.pop(context);
  }*/

  @override
  Widget build(BuildContext context) {
    Navigator.pushNamed(context, '/signup');
    Navigator.of(context).pop();
    return Container();
  }
}

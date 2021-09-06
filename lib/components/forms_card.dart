import 'dart:io';

import 'package:flutter/material.dart';

import '../constants.dart';

class FormsCard extends StatelessWidget {
  FormsCard({this.children});

  final List<Widget> children;

  double getCardAspectRatio(MediaQueryData mq) {
    double r = mq.size.width / mq.size.width;
    if (r > 1) r = 1 / r;
    return r;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return Padding(
      padding: kFormsCardOuterPadding,
      child: Flexible(
        child: Container(
          padding: kFormsCardInnerPadding,
          width: 400.0,
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children ?? [],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getFormBox({Column child}) {
    if (Platform.isAndroid || Platform.isIOS)
      return Container(
        child: child,
      );
    else if (Platform.isAndroid || Platform.isIOS)
      return SizedBox(
        width: 300.0,
        child: child,
      );
  }
}

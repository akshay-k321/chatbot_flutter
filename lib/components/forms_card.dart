import 'dart:io';

import 'package:flutter/material.dart';

import '../constants.dart';

class FormsCard extends StatelessWidget {
  FormsCard({this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kFormsCardOuterPadding,
      child: Container(
        padding: kFormsCardInnerPadding,
        /*decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),*/
        child: getFormBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children ?? [],
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
    else
      return SizedBox(
        width: 300.0,
        child: child,
      );
  }
}

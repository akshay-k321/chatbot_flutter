import 'package:flutter/material.dart';

import '../constants.dart';

class FormsCard extends StatelessWidget {
  FormsCard({this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kFormsCardOuterPadding,
      child: Card(
        elevation: kCardElevation,
        child: Padding(
          padding: kFormsCardInnerPadding,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: children ?? [],
            ),
          ),
        ),
      ),
    );
  }
}

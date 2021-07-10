import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double elevation;
  final Color color;
  final Function onPressed;
  final Icon icon;

  const CircularButton({
    Key key,
    this.elevation = 5.0,
    this.color,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Material(
        elevation: elevation,
        color: color,
        borderRadius: BorderRadius.circular(50.0),
        child: Center(
          child: IconButton(
            onPressed: onPressed,
            icon: icon,
          ),
        ),
      ),
    );
  }
}

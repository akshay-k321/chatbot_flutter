import 'package:flutter/material.dart';

class DateDisplay extends StatelessWidget {
  final String date;

  DateDisplay({@required this.date});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Material(
          elevation: 3.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  FToast fToast;
  Color backgroundColor;
  TextStyle _textStyle = TextStyle(
    fontSize: 15.5,
    color: Colors.white,
  );
  Toast(
    BuildContext context, {
    this.backgroundColor = const Color(0xBB333333),
  }) {
    fToast = FToast();
    fToast.init(context);
  }

  void showToast(String text,
      {Duration duration = const Duration(seconds: 2),
      Icon icon,
      Color bgColor}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: bgColor ?? backgroundColor,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null ? icon : SizedBox(),
            SizedBox(width: icon != null ? 12.0 : 0.0),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: _textStyle,
              ),
            ),
          ],
        ),
      ),
    );

    fToast.showToast(
        child: toast, gravity: ToastGravity.BOTTOM, toastDuration: duration);
  }
}

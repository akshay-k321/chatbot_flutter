import 'package:chatbot_demo/utilities/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel {
  String email, passwd;
  bool loginSuccess = true;

  Map<String, dynamic> validate() {
    bool error = true;
    String msg = '';
    RegExp emailExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      multiLine: false,
    );
    if (passwd == '')
      msg = 'Please enter your password';
    else if (email == '')
      msg = 'Please enter your email';
    else if (passwd.length < 6)
      msg = 'Password should be at least 6 characters long';
    else if (!emailExp.hasMatch(email))
      msg = 'Please enter a valid email';
    else
      error = false;
    return {'error': error, 'msg': msg};
  }

  Future<UserCredential> performLogin(
      FirebaseAuth auth, BuildContext context) async {
    loginSuccess = true;
    final res = await auth
        .signInWithEmailAndPassword(email: email, password: passwd)
        .onError((error, stackTrace) {
      Toast(context).showToast('Failed to login');
      loginSuccess = false;
      return null;
    });
    return res;
  }
}

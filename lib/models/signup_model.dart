import 'package:chatbot_demo/utilities/flutter_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp {
  String fname = '', lname = '', email = '', passwd1 = '', passwd2 = '';
  bool signupSuccess = true, dataAdded = true;
  dynamic validate() {
    bool error = true;
    String msg = '';
    RegExp emailExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      multiLine: false,
    );
    if (fname == '')
      msg = 'First name can\'t be empty';
    else if (lname == '')
      msg = 'Last name can\'t be empty';
    else if (email == '')
      msg = 'Email can\'t be empty';
    else if (passwd1 != passwd2)
      msg = 'Passwords do not match';
    else if (passwd1 == '')
      msg = 'Please enter a password';
    else if (passwd1.length < 6)
      msg = 'Password must be at least 6 characters long';
    else if (!emailExp.hasMatch(email))
      msg = 'Please enter a valid email';
    else
      error = false;
    return {'error': error, 'msg': msg};
  }

  Future<UserCredential> registerUserWithEmailAndPassword(
      FirebaseAuth auth, BuildContext context) async {
    signupSuccess = true;
    final res = await auth
        .createUserWithEmailAndPassword(
      email: email,
      password: passwd1,
    )
        .onError((error, stackTrace) {
      signupSuccess = false;
      print('$error\n $stackTrace');
      Toast(context).showToast(error);
      return null;
    });
    return res;
  }

  Future<DocumentReference<Map<String, dynamic>>> saveUserData(
      FirebaseFirestore fs, BuildContext context) async {
    dataAdded = true;
    final res = await fs.collection('user-data').add({
      'fname': fname,
      'lname': lname,
      'email': email,
    }).onError((error, stackTrace) {
      dataAdded = false;
      print('$error\n $stackTrace');
      Toast(context).showToast(error);
      return null;
    });
    return res;
  }
}

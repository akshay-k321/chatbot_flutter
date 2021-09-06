import 'package:chatbot_demo/components/form_text_field.dart';
import 'package:chatbot_demo/components/forms_card.dart';
import 'package:chatbot_demo/components/rounded_button.dart';
import 'package:chatbot_demo/components/signin_change_text.dart';
import 'package:chatbot_demo/models/signup_model.dart';
import 'package:chatbot_demo/screens/chat_screen.dart';
import 'package:chatbot_demo/screens/login_screen.dart';
import 'package:chatbot_demo/utilities/flutter_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);
  static const String id = 'signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  SignUp signUp = SignUp();
  Toast toast;

  @override
  Widget build(BuildContext context) {
    toast = Toast(context);
    return Scaffold(
      /*appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Signup',
        ),
      ),*/
      body: Center(
        child: SingleChildScrollView(
          child: FormsCard(
            children: [
              /*Text(
                'Signup',
                style: kHeadingTextStyle,
              ),*/
              FormTextField(
                labelText: 'Firstname',
                margin: EdgeInsets.only(top: 20.0),
                onChanged: (value) => signUp.fname = value,
                keyboardType: TextInputType.name,
              ),
              FormTextField(
                labelText: 'Lastname',
                margin: EdgeInsets.only(top: 10.0),
                onChanged: (value) => signUp.lname = value,
                keyboardType: TextInputType.name,
              ),
              FormTextField(
                labelText: 'Email',
                margin: EdgeInsets.only(top: 10.0),
                onChanged: (value) => signUp.email = value,
                keyboardType: TextInputType.emailAddress,
              ),
              FormTextField(
                labelText: 'Password',
                margin: EdgeInsets.only(top: 10.0),
                onChanged: (value) => signUp.passwd1 = value,
                obscureText: true,
              ),
              FormTextField(
                labelText: 'Re-type password',
                margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                onChanged: (value) => signUp.passwd2 = value,
                obscureText: true,
              ),
              Hero(
                tag: 'signupBtn',
                child: RoundedButton(
                  color: Colors.blueAccent,
                  title: 'SignUp',
                  onPressed: () async {
                    final validate = signUp.validate();
                    if (!validate['error']) {
                      await signUp
                          .registerUserWithEmailAndPassword(_auth, context)
                          .whenComplete(() async {
                        if (signUp.signupSuccess)
                          await signUp
                              .saveUserData(_firestore, context)
                              .whenComplete(() {
                            if (signUp.dataAdded) {
                              Navigator.popUntil(context, (route) {
                                if (route.isFirst) return true;
                                return false;
                              });
                              Navigator.pushReplacementNamed(
                                  context, ChatScreen.id);
                            }
                          });
                      });
                    } else
                      toast.showToast(validate['msg']);
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SignInChangeText(
                  question: 'Already have an account? ',
                  action: 'Login',
                  actionColor: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

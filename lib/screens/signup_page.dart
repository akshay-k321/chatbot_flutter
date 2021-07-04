import 'package:chatbot_demo/components/form_text_field.dart';
import 'package:chatbot_demo/components/forms_card.dart';
import 'package:chatbot_demo/components/rounded_button.dart';
import 'package:chatbot_demo/components/signin_change_text.dart';
import 'package:chatbot_demo/constants.dart';
import 'package:chatbot_demo/screens/chat_page.dart';
import 'package:chatbot_demo/screens/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);
  static const String id = 'signup';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore;
  String fname, lname, email, passwd1, passwd2;

  @override
  void initState() {
    _firestore = FirebaseFirestore.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Signup',
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FormsCard(
            children: [
              Text(
                'Signup',
                style: kHeadingTextStyle,
              ),
              FormTextField(
                labelText: 'Firstname',
                margin: EdgeInsets.only(top: 20.0),
                onChanged: (value) => fname = value,
                keyboardType: TextInputType.name,
              ),
              FormTextField(
                labelText: 'Lastname',
                margin: EdgeInsets.only(top: 10.0),
                onChanged: (value) => lname = value,
                keyboardType: TextInputType.name,
              ),
              FormTextField(
                labelText: 'Email',
                margin: EdgeInsets.only(top: 10.0),
                onChanged: (value) => email = value,
                keyboardType: TextInputType.emailAddress,
              ),
              FormTextField(
                labelText: 'Password',
                margin: EdgeInsets.only(top: 10.0),
                onChanged: (value) => passwd1 = value,
                obscureText: true,
              ),
              FormTextField(
                labelText: 'Re-type password',
                margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                onChanged: (value) => passwd2 = value,
                obscureText: true,
              ),
              RoundedButton(
                color: Colors.blueAccent,
                title: 'SignUp',
                onPressed: () async {
                  if (passwd1 == passwd2 &&
                      passwd1 != null &&
                      passwd1.length >= 6 &&
                      email != null &&
                      fname != null &&
                      lname != null) {
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: passwd1);
                    await _firestore.collection('user-data').add({
                      'fname': fname,
                      'lname': lname,
                      'email': email,
                    });
                    Navigator.pushReplacementNamed(context, ChatPage.id);
                  } else
                    print('Registration error');
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              SignInChangeText(
                  question: 'Already have an account? ',
                  action: 'Login',
                  actionColor: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginPage.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

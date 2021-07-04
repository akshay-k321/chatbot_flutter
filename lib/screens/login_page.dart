import 'package:chatbot_demo/components/form_text_field.dart';
import 'package:chatbot_demo/components/forms_card.dart';
import 'package:chatbot_demo/components/rounded_button.dart';
import 'package:chatbot_demo/components/signin_change_text.dart';
import 'package:chatbot_demo/constants.dart';
import 'package:chatbot_demo/screens/chat_page.dart';
import 'package:chatbot_demo/screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  static const String id = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, passwd;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FormsCard(
            children: [
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Login',
                style: kHeadingTextStyle,
              ),
              FormTextField(
                labelText: 'Email',
                margin: EdgeInsets.only(top: 20.0),
                onChanged: (value) => email = value,
                keyboardType: TextInputType.emailAddress,
              ),
              FormTextField(
                labelText: 'password',
                margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                onChanged: (value) => passwd = value,
                obscureText: true,
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Login',
                onPressed: () async {
                  if (passwd != null && email != null && passwd.length >= 6) {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: passwd);
                    Navigator.pushReplacementNamed(context, ChatPage.id);
                  } else
                    print('Login error');
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              SignInChangeText(
                question: 'Don\'t have an account? ',
                action: 'SignUp',
                actionColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, SignUpPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chatbot_demo/components/form_text_field.dart';
import 'package:chatbot_demo/components/forms_card.dart';
import 'package:chatbot_demo/components/rounded_button.dart';
import 'package:chatbot_demo/components/signin_change_text.dart';
import 'package:chatbot_demo/models/login_model.dart';
import 'package:chatbot_demo/screens/chat_screen.dart';
import 'package:chatbot_demo/screens/signup_screen.dart';
import 'package:chatbot_demo/utilities/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  LoginModel login = LoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Login'),
      ),*/
      body: Center(
        child: SingleChildScrollView(
          child: FormsCard(
            children: [
              SizedBox(
                height: 15.0,
              ),
              /*Text(
                'Login',
                style: kHeadingTextStyle,
              ),*/
              FormTextField(
                labelText: 'Email',
                margin: EdgeInsets.only(top: 20.0),
                onChanged: (value) => login.email = value,
                keyboardType: TextInputType.emailAddress,
              ),
              FormTextField(
                labelText: 'password',
                margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                onChanged: (value) => login.passwd = value,
                obscureText: true,
              ),
              Hero(
                tag: 'loginBtn',
                child: RoundedButton(
                  color: Colors.lightBlueAccent,
                  title: 'Login',
                  onPressed: () async {
                    final validate = login.validate();
                    if (!validate['error']) {
                      await login.performLogin(_auth, context).whenComplete(() {
                        if (login.loginSuccess)
                          Navigator.pushReplacementNamed(
                              context, ChatScreen.id);
                      });
                    } else
                      Toast(context).showToast(
                        validate['msg'],
                      );
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SignInChangeText(
                question: 'Don\'t have an account? ',
                action: 'SignUp',
                actionColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, SignUpScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

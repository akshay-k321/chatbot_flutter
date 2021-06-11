import 'package:chatbot_demo/components/form_text_field.dart';
import 'package:chatbot_demo/components/forms_card.dart';
import 'package:chatbot_demo/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              ),
              FormTextField(
                labelText: 'password',
                margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/chat');
                },
                child: Text('LOGIN'),
                style: kSubmitButtonStyle,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: kBodyTextSize,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: kBodyTextSize,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

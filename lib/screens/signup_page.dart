import 'package:chatbot_demo/components/form_text_field.dart';
import 'package:chatbot_demo/components/forms_card.dart';
import 'package:chatbot_demo/constants.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
              ),
              FormTextField(
                labelText: 'Lastname',
                margin: EdgeInsets.only(top: 10.0),
              ),
              FormTextField(
                labelText: 'Email',
                margin: EdgeInsets.only(top: 10.0),
              ),
              FormTextField(
                labelText: 'Password',
                margin: EdgeInsets.only(top: 10.0),
              ),
              FormTextField(
                labelText: 'Re-type password',
                margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/chat');
                  },
                  style: kSubmitButtonStyle,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: kBodyTextSize,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      'Login',
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

import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/screens/main_screen.dart';
import 'package:wickwood/widgets/login_registration/start_screen_button.dart';
import 'package:wickwood/widgets/login_registration/logo.dart';
import 'package:wickwood/widgets/login_registration/input_field.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String email;
    // ignore: unused_local_variable
    String password;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kBrownBGColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Logo(
                height: 200,
              ),
              SizedBox(height: 30),
              InputField(
                labeltext: 'Enter Email',
                updateValue: (newvalue) {
                  email = newvalue;
                },
              ),
              InputField(
                labeltext: 'Enter Password',
                isPassword: true,
                updateValue: (newvalue) {
                  password = newvalue;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Hero(
                tag: 'signin',
                child: StartScreenButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MainScreen.id);
                  },
                  width: 300,
                  text: 'Sign In',
                ),
              ),
            ],
          ),
        ));
  }
}

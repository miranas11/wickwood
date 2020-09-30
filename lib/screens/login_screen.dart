import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/widgets/start_screen_button.dart';
import 'package:wickwood/widgets/logo.dart';
import 'package:wickwood/widgets/input_field.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
              InputField(
                labeltext: 'Enter Password',
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              Hero(
                tag: 'signin',
                child: StartScreenButton(
                  width: 300,
                  text: 'Sign In',
                ),
              ),
            ],
          ),
        ));
  }
}

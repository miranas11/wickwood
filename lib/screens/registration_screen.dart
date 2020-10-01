import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/screens/main_screen.dart';
import 'package:wickwood/widgets/login_registration/input_field.dart';
import 'package:wickwood/widgets/login_registration/logo.dart';
import 'package:wickwood/widgets/login_registration/start_screen_button.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = 'registration_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrownBGColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
            tag: 'signup',
            child: StartScreenButton(
              onPressed: () {
                Navigator.pushNamed(context, MainScreen.id);
              },
              width: 300,
              text: 'Sign Up',
            ),
          ),
        ],
      )),
    );
  }
}
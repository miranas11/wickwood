import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/screens/login_screen.dart';
import 'package:wickwood/screens/registration_screen.dart';
import 'package:wickwood/widgets/login_registration/start_screen_button.dart';
import 'package:wickwood/widgets/login_registration/logo.dart';

class StartScreen extends StatelessWidget {
  static const String id = 'start_screen';
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
              height: 100,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 120),
              child: Image.asset('assets/images/startscreenimage.png'),
            ),
            Hero(
              tag: 'signin',
              child: StartScreenButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                text: 'Sign In',
                width: 300,
              ),
            ),
            Hero(
              tag: 'signup',
              child: StartScreenButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                text: 'Sign Up',
                width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

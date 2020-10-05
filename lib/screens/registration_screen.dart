import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/screens/main_screen.dart';
import 'package:wickwood/widgets/login_registration/input_field.dart';
import 'package:wickwood/widgets/login_registration/logo.dart';
import 'package:wickwood/widgets/login_registration/start_screen_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool _isSpinning = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrownBGColor,
      body: ModalProgressHUD(
        color: kButtonColor,
        inAsyncCall: _isSpinning,
        child: SafeArea(
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
              tag: 'signup',
              child: StartScreenButton(
                onPressed: () async {
                  try {
                    setState(() {
                      _isSpinning = true;
                    });
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    setState(() {
                      _isSpinning = false;
                    });
                    if (newUser != null) {
                      Navigator.pushNamed(context, MainScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                width: 300,
                text: 'Sign Up',
              ),
            ),
          ],
        )),
      ),
    );
  }
}

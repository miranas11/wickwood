import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/screens/main_screen.dart';
import 'package:wickwood/widgets/login_registration/start_screen_button.dart';
import 'package:wickwood/widgets/login_registration/logo.dart';
import 'package:wickwood/widgets/login_registration/input_field.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool _isSpining = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kBrownBGColor,
        body: ModalProgressHUD(
          inAsyncCall: _isSpining,
          child: SafeArea(
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
                    onPressed: () async {
                      try {
                        setState(() {
                          _isSpining = true;
                        });
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        if (user != null) {
                          Navigator.pushNamed(context, MainScreen.id);
                        }
                      } catch (e) {
                        print(e);
                        setState(() {
                          _isSpining = false;
                        });
                      }
                    },
                    width: 300,
                    text: 'Sign In',
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/screens/login_screen.dart';
import 'package:wickwood/screens/registration_screen.dart';
import 'package:wickwood/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(accentColor: kButtonColor, hintColor: Colors.grey[300]),
      initialRoute: StartScreen.id,
      routes: {
        StartScreen.id: (context) => StartScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}

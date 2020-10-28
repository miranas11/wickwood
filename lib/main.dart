import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/screens/cart_screen.dart';
import 'package:wickwood/screens/main_screen.dart';
import 'package:wickwood/screens/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor: kButtonColor,
        hintColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: kButtonColor,
          ),
          color: kOrangeColor,
        ),
      ),
      initialRoute: StartScreen.id,
      routes: {
        StartScreen.id: (context) => StartScreen(),
        MainScreen.id: (context) => MainScreen(),
        CartScreen.id: (context) => CartScreen(),
      },
    );
  }
}

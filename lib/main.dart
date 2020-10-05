import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/components/product_data.dart';
import 'package:wickwood/screens/cart_screen.dart';
import 'package:wickwood/screens/login_screen.dart';
import 'package:wickwood/screens/main_screen.dart';
import 'package:wickwood/screens/registration_screen.dart';
import 'package:wickwood/screens/start_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductData>(
      create: (context) => ProductData(),
      child: MaterialApp(
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
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          MainScreen.id: (context) => MainScreen(),
          CartScreen.id: (context) => CartScreen(),
        },
      ),
    );
  }
}

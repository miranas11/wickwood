import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/widgets/mainscreen/slogan.dart';
import 'package:wickwood/widgets/mainscreen/categorywidget.dart';
import 'package:wickwood/widgets/mainscreen/product_box.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'main_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: FlatButton(
          padding: EdgeInsets.only(left: 10),
          onPressed: null,
          child: CircleAvatar(
            backgroundColor: kButtonColor,
            child: Image(
              height: 30,
              image: AssetImage('assets/images/usericon.png'),
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: null,
            child: Icon(
              Icons.shopping_cart,
              color: kButtonColor,
              size: 30,
            ),
          )
        ],
      ),
      backgroundColor: kBrownBGColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Slogan(),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CategoryWidget(),
                  ProductBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

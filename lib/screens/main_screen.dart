import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/widgets/mainscreen/slogan.dart';
import 'package:wickwood/widgets/mainscreen/categorywidget.dart';
import 'package:wickwood/widgets/mainscreen/product_listview.dart';

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
            Expanded(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    CategoryWidget(
                      image: 'chair',
                      text: 'Chairs',
                    ),
                    ChairListView(),
                    CategoryWidget(
                      image: 'sofa',
                      text: 'Sofas',
                    ),
                    SofaListView(),
                    CategoryWidget(
                      image: 'cupboard',
                      text: 'Cupboards',
                    ),
                    CupBoardListView(),
                    CategoryWidget(
                      image: 'bed',
                      text: 'Beds',
                    ),
                    BedListView()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

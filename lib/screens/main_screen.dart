import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/screens/cart_screen.dart';
import 'package:wickwood/widgets/mainscreen/slogan.dart';
import 'package:wickwood/widgets/mainscreen/categorywidget.dart';
import 'package:wickwood/widgets/mainscreen/product_listview.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;

  User loggedinUser;

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

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
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.id);
            },
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
                    BedListView(),
                    CategoryWidget(
                      image: 'table',
                      text: 'Tables',
                    ),
                    TableListView(),
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

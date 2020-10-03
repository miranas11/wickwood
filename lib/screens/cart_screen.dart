import 'package:flutter/material.dart';
import 'package:wickwood/widgets/mainscreen/product_listview.dart';

class CartScreen extends StatelessWidget {
  static const String id = 'cart_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Cart TExt
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'CART',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CartListView(),
          ],
        ),
      ),
    );
  }
}

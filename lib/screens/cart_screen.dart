import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/widgets/login_registration/start_screen_button.dart';
import 'package:wickwood/widgets/cartscreen/address_widget.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'cart_screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Widget onScreenWidget = null;

  @override
  Widget build(BuildContext context) {
    double totalvalue = 100;
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
            onScreenWidget,
            Column(
              children: <Widget>[
                End2EndText(
                  leftText: 'Cost',
                  rightText: totalvalue,
                ),
                End2EndText(
                  leftText: 'Tax',
                  rightText: 0,
                ),
                End2EndText(
                  leftText: 'Total',
                  rightText: totalvalue,
                ),
              ],
            ),
            //button
            Container(
              padding: EdgeInsets.all(10),
              child: StartScreenButton(
                text: 'Proceed',
                onPressed: () {
                  setState(() {
                    onScreenWidget = AddressWidget();
                  });
                },
                width: 100,
                horizontalpadding: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class End2EndText extends StatelessWidget {
  final String leftText;
  final double rightText;

  End2EndText({this.leftText, this.rightText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(
                color: kButtonColor, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          PriceText(
            price: rightText,
            size: 15,
          ),
        ],
      ),
    );
  }
}

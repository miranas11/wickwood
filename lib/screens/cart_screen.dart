import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/product_class.dart';
import 'package:wickwood/screens/start_screen.dart';
import 'package:wickwood/widgets/cartscreen/cart_box.dart';
import 'package:wickwood/widgets/start_screen_button.dart';
import 'package:wickwood/widgets/cartscreen/address_widget.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'cart_screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0;
  bool isAddressPage = false;
  bool isLoading;
  List<CartProductBox> cartList = [];

  @override
  void initState() {
    super.initState();
    getcartitems();
  }

  refreshPage() {
    setState(() {
      isLoading = true;
    });
    cartList.clear();
    getcartitems();
  }

  getcartitems() async {
    totalPrice = 0;
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot =
        await cartRef.doc(currentUser.id).collection('cartitems').get();
    for (var v in snapshot.docs) {
      totalPrice += v['price'];
      Product product = Product.fromDocument(v);

      cartList.add(
        CartProductBox(
          product: product,
          function: refreshPage,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

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
            isAddressPage
                ? Text('')
                :
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
            isAddressPage
                ? AddressWidget()
                : Expanded(
                    child: isLoading
                        ? Center(
                            child: SpinKitRipple(
                              color: kButtonColor,
                              size: 100,
                            ),
                          )
                        : CartListView(
                            cartList: cartList,
                          ),
                  ),
            Column(
              children: <Widget>[
                End2EndText(
                  leftText: 'Cost',
                  rightText: totalPrice,
                ),
                End2EndText(
                  leftText: 'Tax',
                  rightText: 0,
                ),
                End2EndText(
                  leftText: 'Total',
                  rightText: totalPrice,
                ),
              ],
            ),
            //button
            Container(
              padding: EdgeInsets.all(10),
              child: StartScreenButton(
                text: 'Proceed',
                onPressed: () {
                  if (isAddressPage) {
                    print('address page hai');
                  } else {
                    setState(() {
                      isAddressPage = true;
                    });
                  }
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

class CartListView extends StatelessWidget {
  final List<CartProductBox> cartList;

  CartListView({this.cartList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: cartList,
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

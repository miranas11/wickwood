import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/product_class.dart';
import 'package:wickwood/screens/orderplacedscreen.dart';
import 'package:wickwood/screens/start_screen.dart';
import 'package:wickwood/widgets/cartscreen/cart_box.dart';
import 'package:wickwood/widgets/input_field.dart';
import 'package:wickwood/widgets/start_screen_button.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'cart_screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String address = '.';
  String pincode = '.';
  String landmark = '.';
  String state = '.';
  String phonenumber = '.';
  Widget onScreenWidget = Text('');
  double totalPrice = 0;
  bool isAddressPage = false;
  bool isLoading;
  String buttonText = 'Proceed';
  List<CartProductBox> cartList = [];

  sendmail() async {
    String orderitemstext = '';
    String addresstext =
        address + ', ' + landmark + ', ' + state + ', ' + pincode;
    int commachecker = 0;

    for (var i in cartList) {
      orderitemstext = orderitemstext + i.product.name;
      if (cartList.length != commachecker + 1) {
        orderitemstext = orderitemstext + ', ';
        commachecker++;
      }
    }

    String email = 'serioussam24031999@gmail.com';
    String password = 'messi@10';

    final smtpServer = gmail(email, password);

    final message = Message()
      ..from = Address(email)
      ..recipients.add(currentUser.email)
      ..ccRecipients.add(email)
      ..subject = 'Order Confirmation'
      ..text =
          'Your order for $orderitemstext has been confirmed\nAddress: $addresstext\nContact number: $phonenumber\nTotal Price: $totalPrice';

    final sendReport = await send(message, smtpServer);
    print('message sent:' + sendReport.toString());
  }

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
      totalPrice += v['price'] * v['quantity'];
      Product product = Product.fromDocument(v);

      cartList.add(
        CartProductBox(
          isWishlist: false,
          product: product,
          function: refreshPage,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  Expanded addressWidget() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DetailText(
              text: 'Address',
            ),
            InputField(
              updateValue: (value) {
                address = value;
              },
            ),
            DetailText(
              text: 'Pincode',
            ),
            InputField(
              updateValue: (value) {
                pincode = value;
              },
            ),
            DetailText(
              text: 'Landmark',
            ),
            InputField(
              updateValue: (value) {
                landmark = value;
              },
            ),
            DetailText(
              text: 'State',
            ),
            InputField(
              updateValue: (value) {
                state = value;
              },
            ),
            DetailText(
              text: 'Phone Number',
            ),
            InputField(
              updateValue: (value) {
                phonenumber = value;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    !isAddressPage
        ? onScreenWidget = CartWidget(isLoading: isLoading, cartList: cartList)
        : print('ee');
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
            onScreenWidget,
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
                text: buttonText,
                onPressed: () {
                  if (!isAddressPage && cartList.length != 0) {
                    setState(() {
                      onScreenWidget = addressWidget();
                      isAddressPage = true;
                      buttonText = 'Confirm Order';
                    });
                  } else if (isAddressPage) {
                    sendmail();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderConfirmScreen(),
                        ));
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

class CartWidget extends StatelessWidget {
  const CartWidget({
    Key key,
    @required this.isLoading,
    @required this.cartList,
  }) : super(key: key);

  final bool isLoading;
  final List<CartProductBox> cartList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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

class DetailText extends StatelessWidget {
  final String text;
  DetailText({this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, top: 20),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}

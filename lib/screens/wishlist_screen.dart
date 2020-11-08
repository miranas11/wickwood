import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/product_class.dart';
import 'package:wickwood/screens/start_screen.dart';
import 'package:wickwood/widgets/cartscreen/cart_box.dart';

class WishlistScreen extends StatefulWidget {
  static const String id = 'wishlist_screen';
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<CartProductBox> wishlistList = [];

  getallProducts() {
    return StreamBuilder(
      stream: wishlistRef
          .doc(currentUser.id)
          .collection('wishlistitems')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SpinKitRipple(
              color: kButtonColor,
              size: 100,
            ),
          );
        }
        snapshot.data.docs.forEach((doc) {
          Product product = Product.fromDocument(doc);
          wishlistList.add(CartProductBox(
            isWishlist: true,
            product: product,
            totalPrice: 0,
            function: null,
          ));
        });

        return ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: wishlistList,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Wish List',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            getallProducts(),
          ],
        ),
      ),
    );
  }
}

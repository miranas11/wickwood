import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/product_class.dart';
import 'package:wickwood/screens/start_screen.dart';
import 'package:wickwood/widgets/start_screen_button.dart';

class ProductBottomSheet extends StatelessWidget {
  final Product product;

  ProductBottomSheet({this.product});

  addtoCart() async {
    int quantity;
    try {
      DocumentSnapshot doc = await cartRef
          .doc(currentUser.id)
          .collection('cartitems')
          .doc(product.productId)
          .get();
      quantity = doc['quantity'];
    } catch (e) {
      quantity = 0;
    }
    if (quantity == 9) {
      quantity = 9;
    }

    cartRef
        .doc(currentUser.id)
        .collection('cartitems')
        .doc(product.productId)
        .set({
      'material': product.material,
      'category': product.category,
      'name': product.name,
      'price': product.price,
      'productId': product.productId,
      'mediaUrl': product.mediaUrl,
      'quantity': quantity + 1,
      'likes': {},
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: ShapeDecoration(
                color: kBrownBGColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              child: Image(
                image: CachedNetworkImageProvider(product.mediaUrl),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //text
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                        color: kButtonColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  PriceText(
                    price: product.price,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          //button
          Expanded(
            flex: 2,
            child: StartScreenButton(
              horizontalpadding: 30,
              text: 'Add To Cart',
              width: 100,
              onPressed: addtoCart,
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

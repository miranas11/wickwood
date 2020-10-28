import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/product_class.dart';

class CartProductBox extends StatelessWidget {
  final Product product;
  final double totalPrice;
  CartProductBox({this.product, this.totalPrice});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 190,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //image
          Container(
            height: 150,
            width: 170,
            decoration: BoxDecoration(
              color: kBrownBGColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2),
              ],
            ),
            child: Image(
              image: NetworkImage(product.mediaUrl),
            ),
          ),

          //name and material
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              NameText(
                name: product.name,
              ),
              SizedBox(
                height: 5,
              ),
              MaterialText(
                material: product.material,
              )
            ],
          ),
          //price
          Column(
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              PriceText(
                price: product.price,
              ),
              SizedBox(
                height: 70,
              ),
              RaisedButton(
                elevation: 5,
                child: Icon(
                  Icons.delete_outline,
                  color: kOrangeColor,
                ),
                color: kButtonColor,
                shape: CircleBorder(
                  side: BorderSide(color: kOrangeColor),
                ),
                onPressed: null,
              )
            ],
          ),
        ],
      ),
    );
  }
}

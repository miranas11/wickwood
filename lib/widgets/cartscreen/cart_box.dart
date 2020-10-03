import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';

class CartProductBox extends StatelessWidget {
  final String name;
  final String material;
  final double price;
  final String image;
  final String categoryname;
  CartProductBox(
      {this.name, this.material, this.image, this.price, this.categoryname});
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
              image: AssetImage('assets/images/$categoryname/$image.png'),
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
                name: name,
              ),
              SizedBox(
                height: 5,
              ),
              MaterialText(
                material: material,
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
                price: price,
              )
            ],
          ),
        ],
      ),
    );
  }
}

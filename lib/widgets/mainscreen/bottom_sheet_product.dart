import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/components/product_class.dart';
import 'package:wickwood/components/product_data.dart';
import 'package:wickwood/widgets/login_registration/start_screen_button.dart';

class ProductBottomSheet extends StatelessWidget {
  final String categoryname;
  final String image;
  final String name;
  final double price;
  final String material;
  ProductBottomSheet(
      {this.image, this.categoryname, this.name, this.price, this.material});
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
                image: AssetImage('assets/images/$categoryname/$image.png'),
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
                    price: 99.99,
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
              onPressed: () {
                Provider.of<ProductData>(context, listen: false).addtocart(
                  Product(
                    name: name,
                    price: price,
                    material: material,
                    category: categoryname,
                    image: image,
                  ),
                );
                Navigator.pop(context);
              },
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

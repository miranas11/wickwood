import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/components/product_class.dart';
import 'package:wickwood/components/product_data.dart';
import 'package:wickwood/widgets/login_registration/start_screen_button.dart';

class ProductBottomSheet extends StatelessWidget {
  final Product product;

  ProductBottomSheet({this.product});
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
                image: AssetImage(
                    'assets/images/${product.category}/${product.image}.png'),
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
              onPressed: () {
                Provider.of<ProductData>(context, listen: false).addtocart(
                  product,
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

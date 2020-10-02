import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/widgets/login_registration/start_screen_button.dart';

class ProductBottomSheet extends StatelessWidget {
  final String categoryname;
  final String image;
  ProductBottomSheet({this.image, this.categoryname});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: ShapeDecoration(
                color: kBrownBGColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              child: Hero(
                tag: 'product',
                child: Image(
                  image: AssetImage('assets/images/$categoryname/$image.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: StartScreenButton(
              horizontalpadding: 80,
              text: 'Add To Cart',
              width: 100,
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

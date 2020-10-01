import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';

class ProductBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //for the stack
    return Container(
      height: 200,
      width: 170,
      decoration: BoxDecoration(color: kBrownBGColor),
      child: Stack(
        children: <Widget>[
          //the white box
          Positioned(
            top: 53,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.orange[300], blurRadius: 2),
                ],
              ),
              height: 140,
              width: 170,
            ),
          ),
          //Product Image
          Positioned(
            top: 3,
            left: 45,
            child: Image(
              height: 120,
              image: AssetImage('assets/images/chairs/chair1.png'),
            ),
          ),
          ProductDetail(),
          Positioned(
            right: -10,
            bottom: 17,
            child: RaisedButton(
              shape: CircleBorder(),
              color: kButtonColor,
              child: Icon(
                Icons.expand_more,
                color: kOrangeColor,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

//displays details like price name and material on product Box
class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brown Chair',
              style:
                  TextStyle(color: kButtonColor, fontWeight: FontWeight.w600),
            ),
            Text(
              'Wooden',
              style:
                  TextStyle(color: kButtonColor, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '₹ 99.99',
              style: TextStyle(
                  color: kButtonColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

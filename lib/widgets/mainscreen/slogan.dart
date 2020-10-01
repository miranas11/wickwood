import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/widgets/two_lines_text.dart';

class Slogan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7),
      height: 100,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        color: kOrangeColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TwoLinesRowText(
            firstword: 'Furniture',
            firstwordWeight: FontWeight.w400,
            secondword: 'that fits',
            secondwordWeight: FontWeight.w300,
            size: 25,
          ),
          SizedBox(
            height: 5,
          ),
          TwoLinesRowText(
            firstword: 'your',
            firstwordWeight: FontWeight.w300,
            secondword: 'Style',
            secondwordWeight: FontWeight.w400,
            size: 25,
          )
        ],
      ),
    );
  }
}

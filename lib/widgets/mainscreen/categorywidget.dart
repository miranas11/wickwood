import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: kOrangeColor,
          radius: 25,
          child: Image(
            image: AssetImage('assets/images/chair.png'),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Chairs',
          style: TextStyle(
              color: kButtonColor, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

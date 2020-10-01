import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String text;
  CategoryWidget({this.image, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.deepPurple,
            radius: 25,
            child: Image(
              image: AssetImage(
                'assets/images/icons/$image.png',
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '$text',
            style: TextStyle(
                color: kButtonColor, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

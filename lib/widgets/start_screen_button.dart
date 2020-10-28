import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';

class StartScreenButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;
  final double horizontalpadding;
  StartScreenButton(
      {this.text, this.onPressed, this.width, this.horizontalpadding = 8});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: horizontalpadding),
      child: ButtonTheme(
        height: 60,
        minWidth: width,
        child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 5,
          color: kButtonColor,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';

class StartScreenButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;
  StartScreenButton({this.text, this.onPressed, this.width});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}

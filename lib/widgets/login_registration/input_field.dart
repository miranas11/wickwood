import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';

class InputField extends StatelessWidget {
  final String labeltext;
  final bool isPassword;
  InputField({this.labeltext, this.isPassword = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        style: TextStyle(
          color: kButtonColor,
        ),
        obscureText: isPassword,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          isDense: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kButtonColor, width: 3),
            borderRadius: BorderRadius.circular(30),
          ),
          labelText: labeltext,
        ),
      ),
    );
  }
}

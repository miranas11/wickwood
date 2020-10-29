import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';

class InputField extends StatelessWidget {
  final String labeltext;
  final bool isPassword;
  final Function updateValue;

  InputField({this.labeltext = '', this.isPassword = false, this.updateValue});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labeltext,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: (value) {
              if (value.trim().length < 1) {
                return 'Type Something';
              }
              return null;
            },
            onChanged: (newvalue) {
              updateValue(newvalue);
            },
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
            ),
          ),
        ],
      ),
    );
  }
}

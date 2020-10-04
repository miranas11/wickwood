import 'package:flutter/material.dart';
import 'package:wickwood/widgets/login_registration/input_field.dart';

class AddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DetailText(
              text: 'Address',
            ),
            InputField(),
            DetailText(
              text: 'Pincode',
            ),
            InputField(),
            DetailText(
              text: 'Landmark',
            ),
            InputField(),
            DetailText(
              text: 'State',
            ),
            InputField(),
            DetailText(
              text: 'Phone Number',
            ),
            InputField(),
          ],
        ),
      ),
    );
  }
}

class DetailText extends StatelessWidget {
  final String text;
  DetailText({this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, top: 35),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}

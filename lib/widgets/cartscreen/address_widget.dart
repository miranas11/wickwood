import 'package:flutter/material.dart';
import 'package:wickwood/widgets/input_field.dart';

class AddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String address;
    // ignore: unused_local_variable
    String pincode;
    // ignore: unused_local_variable
    String landmark;
    // ignore: unused_local_variable
    String state;
    // ignore: unused_local_variable
    String phonenumber;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DetailText(
              text: 'Address',
            ),
            InputField(
              updateValue: (value) {
                address = value;
              },
            ),
            DetailText(
              text: 'Pincode',
            ),
            InputField(
              updateValue: (value) {
                pincode = value;
              },
            ),
            DetailText(
              text: 'Landmark',
            ),
            InputField(
              updateValue: (value) {
                landmark = value;
              },
            ),
            DetailText(
              text: 'State',
            ),
            InputField(
              updateValue: (value) {
                state = value;
              },
            ),
            DetailText(
              text: 'Phone Number',
            ),
            InputField(
              updateValue: (value) {
                phonenumber = value;
              },
            ),
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

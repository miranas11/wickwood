import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';

class Logo extends StatelessWidget {
  final double height;
  Logo({this.height});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Container(
        height: height,
        child: Image.asset(kLogoLocation),
      ),
    );
  }
}

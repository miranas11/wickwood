import 'package:flutter/material.dart';

const kBrownBGColor = Color(0XFFFBDFC9);
const kButtonColor = Colors.deepPurple;
const kOrangeColor = Color(0XFFFEA03A);

const String kLogoLocation = 'assets/images/logo1.png';

class MaterialText extends StatelessWidget {
  final String material;
  MaterialText({this.material});
  @override
  Widget build(BuildContext context) {
    return Text(
      '$material',
      style: TextStyle(color: kButtonColor, fontWeight: FontWeight.w300),
    );
  }
}

class NameText extends StatelessWidget {
  final String name;
  NameText({this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$name',
      style: TextStyle(color: kButtonColor, fontWeight: FontWeight.w600),
    );
  }
}

class PriceText extends StatelessWidget {
  final double price;
  final double size;

  PriceText({this.price, this.size = 17});

  @override
  Widget build(BuildContext context) {
    return Text(
      '₹ $price',
      style: TextStyle(
          color: kButtonColor, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';

class OrderConfirmScreen extends StatefulWidget {
  @override
  _OrderConfirmScreenState createState() => _OrderConfirmScreenState();
}

class _OrderConfirmScreenState extends State<OrderConfirmScreen>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween(begin: 0.0, end: 100)
        .animate(CurvedAnimation(curve: Curves.bounceOut, parent: controller));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBrownBGColor,
      child: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Icon(
              Icons.done,
              color: kButtonColor,
              size: animation.value,
            );
          },
        ),
      ),
    );
  }
}

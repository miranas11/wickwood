import 'package:flutter/material.dart';

class TwoLinesRowText extends StatelessWidget {
  final String firstword;
  final String secondword;
  final FontWeight firstwordWeight;
  final FontWeight secondwordWeight;
  final double size;
  final Color color;
  TwoLinesRowText(
      {this.firstword,
      this.secondword,
      this.firstwordWeight,
      this.secondwordWeight,
      this.size,
      this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '   $firstword ',
          style: TextStyle(
            fontWeight: firstwordWeight,
            fontSize: size,
            color: color,
          ),
        ),
        Text(
          '$secondword',
          style: TextStyle(
            fontWeight: secondwordWeight,
            fontSize: size,
            color: color,
          ),
        )
      ],
    );
  }
}

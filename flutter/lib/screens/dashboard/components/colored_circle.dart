import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  final Color color;

  const ColoredCircle({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 39,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

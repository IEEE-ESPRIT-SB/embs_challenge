import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final String iconUrl;

  const IconContainer({required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41,
      height: 41,
      decoration: ShapeDecoration(
        color: Color(0xFF4D4C4D),
        shape: OvalBorder(),
      ),
      child: Center(
        child: Image.asset(iconUrl, width: 24, height: 21, fit: BoxFit.fill),
      ),
    );
  }
}

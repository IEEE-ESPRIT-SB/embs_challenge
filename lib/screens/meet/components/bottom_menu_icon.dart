import 'package:flutter/material.dart';

class BottomMenuIcon extends StatelessWidget {
  final Color? iconColor;
  final LinearGradient? gradient;
  final String iconUrl;

  const BottomMenuIcon({
    this.iconColor,
    this.gradient,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: iconColor,
        gradient: gradient,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(iconUrl, fit: BoxFit.fill),
      ),
    );
  }
}

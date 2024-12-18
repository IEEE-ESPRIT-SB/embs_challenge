import 'package:flutter/material.dart';

class AgeHeader extends StatelessWidget {
  const AgeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 100,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'HOW OLD ',
                  style: TextStyle(
                    color: Color(0xFFA84DE8),
                    fontSize: 37,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: 'ARE YOU?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 37,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'To Give You A Better Experience We\nNeed To Know More About You.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

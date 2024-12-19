import 'package:flutter/material.dart';

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '90 ',
            style: TextStyle(
              color: Color(0xFFA84DE8),
              fontSize: 42,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: 'DAYS CHALLENGE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

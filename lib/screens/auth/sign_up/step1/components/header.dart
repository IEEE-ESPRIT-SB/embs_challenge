import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.7053,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'GET ',
              style: TextStyle(
                color: const Color(0xFFA84DE8),
                fontSize: width * 0.0941,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: 'STARTED',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.0941,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

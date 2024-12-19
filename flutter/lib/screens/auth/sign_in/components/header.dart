import 'package:flutter/material.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.7053,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Welcome ',
              style: TextStyle(
                color: const Color(0xFFA84DE8),
                fontSize: width * 0.0941,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: 'Back',
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

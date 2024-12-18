import 'package:embs_challenge/screens/get_started/components/button.dart';
import 'package:embs_challenge/screens/get_started/components/version.dart';
import 'package:flutter/material.dart';

import '../../../core/routes.dart';

class GetStartedBottom extends StatelessWidget {
  const GetStartedBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Column(
          children: [
            Version(),
            SizedBox(height: 20),
            Text(
              'Ready to unlock your full potential?\nstart your 90-day journey today',
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
        const SizedBox(height: 40),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GetStartedButton(),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.signIn);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
              ),
              child: const Text(
                'Log In',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFB499A2),
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

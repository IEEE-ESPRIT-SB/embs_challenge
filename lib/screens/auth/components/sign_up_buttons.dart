import 'package:embs_challenge/core/components/submit_button.dart';
import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  final String buttonText;
  final String linkText;
  final String linkActionText;
  final VoidCallback onSubmit;
  final VoidCallback onNavigate;

  const AuthButtons({
    super.key,
    required this.buttonText,
    required this.linkText,
    required this.linkActionText,
    required this.onSubmit,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SubmitButton(
          text: buttonText,
          onPressed: onSubmit,
        ),
        const SizedBox(height: 10),
        SecondLink(
          linkText: linkText,
          linkActionText: linkActionText,
          onNavigate: onNavigate,
        ),
      ],
    );
  }
}

class SecondLink extends StatelessWidget {
  final String linkText;
  final String linkActionText;
  final VoidCallback onNavigate;

  const SecondLink({
    super.key,
    required this.linkText,
    required this.linkActionText,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onNavigate,
      child: SizedBox(
        width: width,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: linkText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.0429,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: linkActionText,
                style: TextStyle(
                  color: const Color(0xFFA84DE8),
                  fontSize: width * 0.0429,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

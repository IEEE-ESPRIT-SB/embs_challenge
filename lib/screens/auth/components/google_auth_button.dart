import 'package:flutter/material.dart';

class GoogleAuthButton extends StatelessWidget {
  final String text;

  const GoogleAuthButton({super.key, this.text = 'Use Google Account'});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.9,
      height: width * 0.14, // Adjust height proportionally to width
      decoration: ShapeDecoration(
        color: const Color(0xFF222121),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF616161)),
          borderRadius: BorderRadius.circular(width * 0.03),
        ),
      ),
      child: Row(
        children: [
          // Google Icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: width * 0.08, // Adjust icon size dynamically
              height: width * 0.08,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/google.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.045,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

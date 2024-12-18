import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 22,
      top: 788,
      child: SizedBox(
        width: 294,
        child: Text(
          'CALENDAR\n',
          style: TextStyle(
            color: Color(0xFF4D4B4D),
            fontSize: 15,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
    );
  }
}

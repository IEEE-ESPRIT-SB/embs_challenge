import 'package:flutter/material.dart';

class CalendarDayLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days
            .map((day) => Text(
                  day,
                  style: const TextStyle(
                    color: Color(0xFF9A979A),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ))
            .toList(),
      ),
    );
  }
}

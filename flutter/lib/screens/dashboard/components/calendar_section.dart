import 'package:flutter/material.dart';

import 'calendar_grid.dart';

class CalendarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CALENDAR',
            style: TextStyle(
              color: Color(0xFF4D4B4D),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          CalendarGrid(),
        ],
      ),
    );
  }
}

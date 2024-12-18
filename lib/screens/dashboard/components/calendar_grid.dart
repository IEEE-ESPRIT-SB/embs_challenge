import 'package:flutter/material.dart';

import 'calendar_day_labels.dart';
import 'calendar_row_selector.dart';

class CalendarGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example array of selected days
    final selectedDays = [1, 5, 10, 15, 20, 25, 30];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CalendarDayLabels(),
          CalendarRowSelector(selectedDays: selectedDays),
        ],
      ),
    );
  }
}

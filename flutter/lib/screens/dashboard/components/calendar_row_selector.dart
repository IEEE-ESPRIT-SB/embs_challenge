import 'package:flutter/material.dart';

import 'colored_circle.dart';

class CalendarRowSelector extends StatelessWidget {
  final List<int> selectedDays;

  CalendarRowSelector({required this.selectedDays});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: GridView.count(
        crossAxisCount: 7,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(31, (index) {
          final day = index + 1;
          final isSelected = selectedDays.contains(day);
          return ColoredCircle(
            color:
                isSelected ? const Color(0xFF8FB872) : const Color(0xFFC9C0CD),
          );
        }),
      ),
    );
  }
}

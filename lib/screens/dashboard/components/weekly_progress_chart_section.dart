import 'package:embs_challenge/screens/dashboard/components/weekly_progress_chart.dart';
import 'package:flutter/material.dart';

class WeeklyProgressChartSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<double> values = [500, 350, 350, 500, 690, 113, 276];
    final List<List<Color>> colors = [
      [const Color(0xFF4FA767), const Color(0xFF439C4E)],
      [const Color(0xFF95B065), const Color(0xFF8FB872)],
      [const Color(0xFFDD892C), const Color(0xFFD2621F)],
      [const Color(0xFFE04A83), const Color(0xFFE55971)],
      [const Color(0xFFDD892C), const Color(0xFFD2621F)],
      [const Color(0xFFE04A83), const Color(0xFFE55971)],
      [const Color(0xFFDD892C), const Color(0xFFD2621F)],
    ];
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    double maxValue = values.reduce((a, b) => a > b ? a : b);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'THIS WEEK',
            style: TextStyle(
              color: Color(0xFF4D4B4D),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          WeeklyProgressChart(
            values: values,
            colors: colors,
            days: days,
            maxValue: maxValue,
            maxHeight: 300, // Set the height dynamically
          ),
        ],
      ),
    );
  }
}

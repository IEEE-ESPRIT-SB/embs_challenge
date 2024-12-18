import 'package:flutter/material.dart';

import 'chart_bar.dart';

class WeeklyProgressChart extends StatelessWidget {
  final List<double> values;
  final List<List<Color>> colors;
  final List<String> days;
  final double maxHeight;
  final double maxValue;

  WeeklyProgressChart({
    required this.values,
    required this.colors,
    required this.days,
    required this.maxHeight,
    required this.maxValue,
  })  : assert(values.length == 7),
        assert(colors.length == 7),
        assert(days.length == 7);

  @override
  Widget build(BuildContext context) {
    double scaleFactor = maxHeight / maxValue;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: maxHeight,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20), // Add border radius
              ),
              child: Column(
                children: List.generate(5, (index) {
                  return Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0x162E2B2F),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0), // Add horizontal padding
              child: SizedBox(
                height: maxHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(7, (index) {
                    double height =
                        values[index] > 0 ? values[index] * scaleFactor : 0;
                    height = height > maxHeight
                        ? maxHeight
                        : height; // Ensure height does not exceed maxHeight
                    return ChartBar(
                      height: height,
                      color: colors[index],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(7, (index) {
            return Text(
              days[index],
              style: const TextStyle(
                color: Color(0xFF9A979A),
                fontSize: 13,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            );
          }),
        ),
      ],
    );
  }
}

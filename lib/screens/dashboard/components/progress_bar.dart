import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress;

  ProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xFFBDB1BA),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF06C4E), Color(0xFF9834D6)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  color: Color(0xFF4D4B4D),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:embs_challenge/screens/dashboard/components/progress_bar.dart';
import 'package:flutter/material.dart';

class ProgressTrackerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'YOUR PROGRESS',
            style: TextStyle(
              color: Color(0xFF4D4B4D),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          ProgressBar(progress: 0.3),
        ],
      ),
    );
  }
}

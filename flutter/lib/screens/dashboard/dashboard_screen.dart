import 'package:flutter/material.dart';

import 'components/calendar_section.dart';
import 'components/header_section.dart';
import 'components/progress_roadmap_section.dart';
import 'components/progress_tracker_section.dart';
import 'components/weekly_progress_chart_section.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFE0D1DF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(),
              ProgressRoadmapSection(),
              ProgressTrackerSection(),
              WeeklyProgressChartSection(),
              CalendarSection(),
            ],
          ),
        ),
      ),
    );
  }
}

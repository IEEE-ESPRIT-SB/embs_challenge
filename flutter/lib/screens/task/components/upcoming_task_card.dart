import 'package:flutter/material.dart';

class UpcomingTaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String timeLeft;
  final String points;
  final Color gradientStart;
  final Color gradientEnd;

  const UpcomingTaskCard({
    required this.title,
    required this.description,
    required this.timeLeft,
    required this.points,
    required this.gradientStart,
    required this.gradientEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 162,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [gradientStart, gradientEnd],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                height: 1.68,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 2.47,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/time.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  timeLeft,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/points.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  points,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

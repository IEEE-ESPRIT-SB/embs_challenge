import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String timeLeft;
  final String points;

  TaskCard({
    required this.title,
    required this.description,
    required this.timeLeft,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0), // Increased internal padding
      decoration: BoxDecoration(
        color: Color(0xFF2E2E2E), // Changed from #373737 to #2E2E2E
        borderRadius: BorderRadius.circular(15), // Added border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$description - ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const TextSpan(
                  text: 'URGENT',
                  style: TextStyle(
                    color: Color(0xFFEE1D35),
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 3.50,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/icons/time.png",
                    width: 17.05,
                    height: 17.62,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    timeLeft,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/icons/points.png",
                    width: 17.05,
                    height: 17.62,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    points,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

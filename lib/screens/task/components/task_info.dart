import 'package:flutter/material.dart';

import 'upcoming_task_card.dart';

class TaskInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'thu, Oct 31',
            style: TextStyle(
              color: Color(0xFF514F51),
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 119,
            child: Row(
              children: [
                Container(
                  width: 115,
                  height: 115,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF484848),
                    shape: OvalBorder(),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'WELCOME BACK!\n',
                            style: TextStyle(
                              color: Color(0xFF514F51),
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              height: 2.10,
                            ),
                          ),
                          TextSpan(
                            text: 'NAME',
                            style: TextStyle(
                              color: Color(0xFFF06C4E),
                              fontSize: 34,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w800,
                              height: 1.24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 101,
                          height: 23,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFDCBCDB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Delighted',
                              style: TextStyle(
                                color: Color(0xFF505050),
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 129,
                          height: 23,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFDAC7B8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '750 points',
                              style: TextStyle(
                                color: Color(0xFF505050),
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Upcoming Task',
            style: TextStyle(
              color: Color(0xFF514F51),
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 35,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 35,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFBDB1BA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 35,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(1.00, 0.00),
                      end: Alignment(-1, 0),
                      colors: [Color(0xFFF06C4E), Color(0xFF9834D6)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const Positioned(
                  right: 10,
                  top: 10,
                  child: Text(
                    '25 MIN\n',
                    style: TextStyle(
                      color: Color(0xFF4D4B4D),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const UpcomingTaskCard(
            title: 'UPCOMING TASK',
            description: 'DESCRIPTION HERE',
            timeLeft: '25 min left',
            points: '+16 points',
            gradientStart: Color(0xFF563B4C),
            gradientEnd: Color(0xFF2F1835),
          ),
        ],
      ),
    );
  }
}

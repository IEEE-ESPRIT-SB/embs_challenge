import 'package:embs_challenge/screens/task/components/task_card.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 97,
              height: 29,
              decoration: ShapeDecoration(
                color: const Color(0xFF4B0872),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: const Center(
                child: Text(
                  'today',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              width: 101,
              height: 29,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFC9C0CD)),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: const Center(
                child: Text(
                  'urgent',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              width: 136,
              height: 29,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFC9C0CD)),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: const Center(
                child: Text(
                  'important',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        TaskCard(
          title: 'Design Stand Up Meeting',
          description: 'Design stand up meeting with the team',
          timeLeft: '2 hours left',
          points: '750 points',
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'notification_badge.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'thu, Oct 31',
                style: TextStyle(
                  color: Color(0xFF514F51),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'MENTAL HEALTH !\n',
                      style: TextStyle(
                        color: Color(0xFF514F51),
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'DASHBOARD',
                      style: TextStyle(
                        color: Color(0xFF514F51),
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          NotificationBadge(),
        ],
      ),
    );
  }
}

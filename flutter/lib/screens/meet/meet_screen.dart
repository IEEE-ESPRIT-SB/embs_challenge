import 'package:flutter/material.dart';

import 'components/bottom_menu_icon.dart';
import 'components/card_widget.dart';

class MeetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/bg/meet-bg.png",
              fit: BoxFit.cover,
            ),
          ),
          const Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CardWidget(
                        imageUrl: "assets/images/user1.png",
                        label: "you",
                        iconUrl: "assets/icons/sound.png",
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CardWidget(
                        imageUrl: "assets/images/user2.png",
                        label: "username",
                        iconUrl: "assets/icons/sound.png",
                      ),
                    ),
                  ],
                ),
              ),
              // Bottom Menu
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomMenuIcon(
                      iconColor: Color(0xFF282728),
                      iconUrl: "assets/icons/video.png",
                    ),
                    BottomMenuIcon(
                      iconColor: Color(0xFF282728),
                      iconUrl: "assets/icons/mic.png",
                    ),
                    BottomMenuIcon(
                      gradient: LinearGradient(
                        colors: [Color(0xFF9834D6), Color(0xFFF06C4E)],
                      ),
                      iconUrl: "assets/icons/message.png",
                    ),
                    BottomMenuIcon(
                      iconColor: Color(0xFFE90203),
                      iconUrl: "assets/icons/hangup.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

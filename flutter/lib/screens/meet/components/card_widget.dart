import 'package:flutter/material.dart';

import 'icon_container.dart';

class CardWidget extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String iconUrl;

  const CardWidget({
    required this.imageUrl,
    required this.label,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Card Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: ShapeDecoration(
                  color: Color(0xFF2A282A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              // Card Image
              Positioned(
                left: constraints.maxWidth * 0.12,
                top: constraints.maxHeight * 0.05,
                child: Container(
                  width: constraints.maxWidth * 0.75,
                  height: constraints.maxHeight * 0.85,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              // Label and Icon
              Positioned(
                left: constraints.maxWidth * 0.04,
                top: constraints.maxHeight * 0.85,
                child: Row(
                  children: [
                    IconContainer(iconUrl: iconUrl),
                    const SizedBox(width: 10),
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

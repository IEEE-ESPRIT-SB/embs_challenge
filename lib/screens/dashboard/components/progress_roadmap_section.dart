import 'package:flutter/material.dart';

class ProgressRoadmapSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 278,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/map.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: const Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'CHECK YOUR PROGRESS\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: 'ROADMAP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

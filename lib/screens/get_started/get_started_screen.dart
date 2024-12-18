import 'package:embs_challenge/screens/get_started/components/bottom.dart';
import 'package:embs_challenge/screens/get_started/components/header.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final width = screenSize.width;
    // final height = screenSize.height;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg/get-started.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [GetStartedHeader(), GetStartedBottom()],
        ),
      ),
    );
  }
}

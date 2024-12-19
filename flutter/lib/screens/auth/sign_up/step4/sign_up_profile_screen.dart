import 'package:flutter/material.dart';

class SignUpProfileScreen extends StatelessWidget {
  const SignUpProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.1,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeader(size),
              _buildSubtitle(size),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOption(
                        context,
                        size: size,
                        title: "student",
                        imageUrl: "assets/icons/graduation.png",
                      ),
                      _buildOption(
                        context,
                        size: size,
                        title: "unemployed",
                        imageUrl: "assets/icons/direction.png",
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOption(
                        context,
                        size: size,
                        title: "employee",
                        imageUrl: "assets/icons/employee.png",
                      ),
                      _buildOption(
                        context,
                        size: size,
                        title: "retired",
                        imageUrl: "assets/icons/retirement.png",
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'TELL US ',
                style: TextStyle(
                  color: const Color(0xFFA84DE8),
                  fontSize: size.width * 0.08,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                text: 'ABOUT YOURSELF',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.08,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.02),
      ],
    );
  }

  Widget _buildSubtitle(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      child: Text(
        'To give you a better experience we need to know more about you',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: size.width * 0.045,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context,
      {required Size size, required String title, required String imageUrl}) {
    return Column(
      children: [
        Container(
          width: size.width * 0.35,
          height: size.width * 0.35,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 3,
                color: Colors.white.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            color: const Color(0xFF5E4962),
          ),
          child: Center(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.05,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

import 'package:embs_challenge/core/routes.dart';
import 'package:embs_challenge/screens/auth/sign_up/step3/components/age_header.dart';
import 'package:embs_challenge/screens/auth/sign_up/step3/components/age_selector.dart';
import 'package:embs_challenge/screens/auth/sign_up/step3/components/background_gradient.dart';
import 'package:embs_challenge/screens/auth/sign_up/step3/components/navigation_button.dart';
import 'package:flutter/material.dart';

class SignUpAgeScreen extends StatefulWidget {
  const SignUpAgeScreen({Key? key}) : super(key: key);

  @override
  _SignUpAgeScreenState createState() => _SignUpAgeScreenState();
}

class _SignUpAgeScreenState extends State<SignUpAgeScreen> {
  int _selectedAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundGradient(
        child: Stack(
          children: [
            const AgeHeader(),
            AgeSelector(
              initialAge: _selectedAge,
              onAgeChanged: (age) {
                setState(() {
                  _selectedAge = age;
                });
              },
            ),
            NavigationButtons(
              onNext: () {
                print("Selected age: $_selectedAge");
                Navigator.pushNamed(context, Routes.signUpSelf);
              },
              onBack: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

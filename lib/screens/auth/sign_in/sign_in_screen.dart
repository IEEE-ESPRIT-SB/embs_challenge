import 'package:embs_challenge/core/routes.dart';
import 'package:embs_challenge/screens/auth/components/sign_up_buttons.dart';
import 'package:embs_challenge/screens/auth/sign_in/components/sign_in_inputs.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SignInHeader(),
              SizedBox(height: size.height * 0.1),
              SignInInputs(),
              SizedBox(height: size.height * 0.1),
              AuthButtons(
                buttonText: "Sign In",
                linkText: "Don't have an account?",
                linkActionText: "Sign Up",
                onSubmit: () {},
                onNavigate: () {
                  Navigator.pushNamed(context, Routes.signUp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

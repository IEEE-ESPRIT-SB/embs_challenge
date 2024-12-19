import 'package:embs_challenge/core/routes.dart';
import 'package:flutter/material.dart';

import '../../components/sign_up_buttons.dart';
import 'components/header.dart';
import 'components/sign_up_inputs.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SignUpHeader(),
              const SizedBox(height: 20),
              SignUpInputs(),
              const SizedBox(height: 20),
              AuthButtons(
                buttonText: "Sign Up",
                linkText: "Already have an account?",
                linkActionText: "Sign In",
                onSubmit: () {
                  Navigator.pushNamed(context, Routes.signUpRules);
                },
                onNavigate: () {
                  Navigator.pushNamed(context, Routes.signIn);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

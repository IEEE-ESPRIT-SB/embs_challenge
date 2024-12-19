import 'package:flutter/material.dart';

import '../../../components/google_auth_button.dart';
import 'input_field.dart';

class SignUpInputs extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUpInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GoogleAuthButton(
          text: "Sign Up - Google Account",
        ),
        const SizedBox(height: 50),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputField(
              hintText: "Username",
              controller: usernameController,
            ),
            const SizedBox(height: 16),
            InputField(
              hintText: "Email",
              controller: emailController,
            ),
            const SizedBox(height: 16),
            InputField(
              hintText: "Password",
              controller: passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 16),
            InputField(
              hintText: "Confirm Password",
              controller: confirmPasswordController,
              isPassword: true,
            ),
          ],
        ),
      ],
    );
  }
}

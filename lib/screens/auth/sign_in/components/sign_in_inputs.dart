import 'package:embs_challenge/screens/auth/components/google_auth_button.dart';
import 'package:flutter/material.dart';

import 'input_field.dart';

class SignInInputs extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignInInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GoogleAuthButton(
          text: "Sign In - Google Account",
        ),
        const SizedBox(height: 50),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle forgot password action
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

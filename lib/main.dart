import 'package:embs_challenge/screens/auth/sign_in/sign_in_screen.dart';
import 'package:embs_challenge/screens/auth/sign_up/step1/sign_up_screen.dart';
import 'package:embs_challenge/screens/auth/sign_up/step2/sign_up_rules_screen.dart';
import 'package:embs_challenge/screens/auth/sign_up/step3/sign_up_age_screen.dart';
import 'package:embs_challenge/screens/auth/sign_up/step4/sign_up_profile_screen.dart';
import 'package:embs_challenge/screens/dashboard/dashboard_screen.dart';
import 'package:embs_challenge/screens/get_started/get_started_screen.dart';
import 'package:embs_challenge/screens/home/home_screen.dart';
import 'package:embs_challenge/screens/meet/meet_screen.dart';
import 'package:embs_challenge/screens/task/task_screen.dart';
import 'package:flutter/material.dart';

import 'core/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EMBS Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        Routes.getStarted: (context) => const GetStartedScreen(),
        Routes.signUp: (context) => const SignUpScreen(),
        Routes.signUpRules: (context) => const SignUpRulesScreen(),
        Routes.signUpAge: (context) => const SignUpAgeScreen(),
        Routes.signUpSelf: (context) => const SignUpProfileScreen(),
        Routes.signIn: (context) => const SignInScreen(),
        Routes.home: (context) => HomeScreen(),
        Routes.dashboard: (context) => DashboardScreen(),
        Routes.meet: (context) => MeetScreen(),
        Routes.tasks: (context) => TaskScreen(),
      },
      initialRoute: Routes.tasks,
    );
  }
}

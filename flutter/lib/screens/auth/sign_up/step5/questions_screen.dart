import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final List<Map<String, dynamic>> questions = const [
    {"question": "What is your age?", "type": "number"},
    {"question": "What is your gender?", "type": "string"},
    {"question": "What is your height (in cm)?", "type": "number"},
    {"question": "What is your weight (in kg)?", "type": "number"},
    {
      "question": "What percentage of your daily activities are indoors?",
      "type": "number"
    },
    {
      "question": "What percentage of your daily activities are outdoors?",
      "type": "number"
    },
    {"question": "What is your availability for activities?", "type": "string"},
    {"question": "Do you smoke?", "type": "yesno"},
    {"question": "Do you drink alcohol?", "type": "yesno"},
    {"question": "What is your relationship status?", "type": "string"},
    {
      "question":
          "How often do you feel overwhelmed or unable to cope with daily tasks?",
      "type": "string"
    },
    {
      "question":
          "Do you frequently feel nervous, restless, or tense without a clear reason?",
      "type": "yesno"
    },
    {
      "question":
          "Do you find it hard to control your worries about the future?",
      "type": "yesno"
    },
    {
      "question": "Have you lost interest in activities you used to enjoy?",
      "type": "yesno"
    },
    {"question": "How often do you feel sad or hopeless ?", "type": "string"},
    {
      "question": "Do you often feel like you have low energy or fatigue?",
      "type": "yesno"
    },
    {
      "question":
          "How often do you feel mentally exhausted or drained at the end of the day?",
      "type": "string"
    },
    {
      "question":
          "Do you feel like your work or studies are taking over your personal life?",
      "type": "yesno"
    },
    {
      "question": "Do you often feel disconnected from people around you?",
      "type": "yesno"
    },
    {
      "question":
          "Do you feel like you don't have someone to talk to when you're feeling down?",
      "type": "yesno"
    },
    {
      "question":
          "How often do you feel emotionally drained after spending time with certain people?",
      "type": "string"
    },
    {
      "question":
          "Do you feel manipulated or controlled by someone close to you?",
      "type": "yesno"
    },
    {
      "question":
          "Have you recently experienced a breakup or significant rejection?",
      "type": "yesno"
    },
    {
      "question":
          "Do you find it hard to move on from a past relationship or rejection?",
      "type": "yesno"
    },
    {
      "question": "Do you frequently dwell on past mistakes or events?",
      "type": "yesno"
    },
    {
      "question":
          "How often do you criticize yourself for not being good enough?",
      "type": "string"
    },
    {
      "question":
          "Do you find it hard to limit your screen time or social media use?",
      "type": "yesno"
    },
    {
      "question":
          "How often do you rely on substances to relieve stress or feel better?",
      "type": "string"
    },
    {
      "question": "Do you often have trouble falling asleep or staying asleep?",
      "type": "yesno"
    },
    {"question": "How often do you wake up feeling rested?", "type": "string"},
    {
      "question":
          "Do you feel physically inactive or sluggish most of the time?",
      "type": "yesno"
    },
    {
      "question":
          "Do you often skip meals or eat unhealthy food due to lack of time or motivation?",
      "type": "yesno"
    }
  ];

  final Map<String, dynamic> answers = {};

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildHeader(size),
              _buildSubtitle(size),
              Column(
                children: questions.map((question) {
                  return _buildQuestion(question["question"], question["type"]);
                }).toList(),
              ),
              SizedBox(height: size.height * 0.05),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text("Submit"),
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

  Widget _buildQuestion(String question, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          if (type == "number")
            TextField(
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Enter a number",
                hintStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) {
                answers[question] = int.tryParse(value);
              },
            )
          else if (type == "string")
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Enter your response",
                hintStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) {
                answers[question] = value;
              },
            )
          else if (type == "yesno")
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                String? groupValue;
                return Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Yes",
                            style: TextStyle(color: Colors.white)),
                        value: "Yes",
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value as String?;
                            answers[question] = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("No",
                            style: TextStyle(color: Colors.white)),
                        value: "No",
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value as String?;
                            answers[question] = value;
                          });
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }

  void _submitForm() async {
    final url = Uri.parse('http://10.0.2.2:3000/api/form/submit-form');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(answers),
    );

    if (response.statusCode == 200) {
      // Handle successful submission
      print('Form submitted successfully');
    } else {
      // Handle submission error
      print('Failed to submit form');
    }
  }
}

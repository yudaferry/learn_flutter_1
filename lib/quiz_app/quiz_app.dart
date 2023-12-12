import 'package:flutter/material.dart';
import 'package:test_1/quiz_app/data/questions.dart';
import 'package:test_1/quiz_app/question_screen.dart';
import 'package:test_1/quiz_app/result_screen.dart';
import 'package:test_1/quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final List<String> selectedAnswer = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      selectedAnswer.clear();
      activeScreen = QuestionScreen(
        onSelectAnswer: choosenAnswer,
      );
    });
  }

  void choosenAnswer(String value) {
    selectedAnswer.add(value);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          selectedAnswer,
          onRestart: switchScreen,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.deepPurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}

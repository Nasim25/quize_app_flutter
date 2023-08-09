import 'package:adv_basics/data/question.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(swithScreen);
  //   super.initState();
  // }

  final List<String> _selectedAnswers = [];
  var activeScreen = "start_screen";
  void swithScreen() {
    setState(() {
      activeScreen = "question_screen";
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result_screen";
      });
    }
  }

  void backToHome() {
    _selectedAnswers.clear();
    setState(() {
      activeScreen = "start_screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(swithScreen);
    if (activeScreen == "question_screen") {
      screenWidget = QuestionScreen(onSelectedAnswer: chooseAnswer);
    } else if (activeScreen == "result_screen") {
      screenWidget =
          ResultsScreen(backToHome: backToHome, chosenAnswer: _selectedAnswers);
    } else if (activeScreen == "start_screen") {
      screenWidget = StartScreen(swithScreen);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quize App",
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 39, 220, 3),
                Color.fromARGB(255, 1, 160, 241),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

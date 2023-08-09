import 'package:adv_basics/data/question.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:adv_basics/quiz.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswer, required this.backToHome});

  final List<String> chosenAnswer;
  final void Function() backToHome;

  List<Map<String, Object>> getSammaryData() {
    final List<Map<String, Object>> sammary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      sammary.add({
        "question_index": i,
        "question": questions[i].text,
        "answer": chosenAnswer[i],
        "correct_answer": questions[i].answers[0],
        "isCorrect": questions[i].answers[0] == chosenAnswer[i] ? true : false,
      });
    }
    return sammary;
  }

  @override
  Widget build(BuildContext context) {
    var numberOfQuestion = getSammaryData().length;
    // final numberOfCorrectAnswer = getSammaryData().where((data) {
    //   return data['answer'] == data['correct_answer'];
    // }).length;

    final numberOfCorrectAnswer = getSammaryData()
        .where((data) => data['answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your correct answer $numberOfCorrectAnswer out of $numberOfQuestion question",
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            QuestionSummary(getSammaryData()),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: backToHome,
              icon: const Icon(Icons.arrow_back),
              label: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}

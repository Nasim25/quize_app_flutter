import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.sammaryData, {super.key});

  final List<Map<String, Object>> sammaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sammaryData.map(
        (data) {
          return Row(
            children: [
              Text(((data["question_index"] as int) + 1).toString()),
              Column(
                children: [
                  Text(data["question"] as String),
                  Text(data["answer"] as String),
                  Text(data["correct_answer"] as String),
                  Text(data["isCorrect"] as bool ? "Correct" : "Wrong"),
                ],
              )
            ],
          );
        },
      ).toList(),
    );
  }
}

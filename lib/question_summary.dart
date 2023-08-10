import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.sammaryData, {super.key});

  final List<Map<String, Object>> sammaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: sammaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Text(
                      ((data["question_index"] as int) + 1).toString(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data["question"] as String),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: data["isCorrect"] as bool
                                  ? Colors.yellow
                                  : Colors.red,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Your Ans = ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 79, 4, 219),
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: (data["answer"] as String),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              if (!(data["isCorrect"] as bool))
                                TextSpan(
                                  text:
                                      'Correct Ans = ${data["correct_answer"] as String}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 79, 4, 219),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

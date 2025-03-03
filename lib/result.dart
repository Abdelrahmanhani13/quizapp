import 'package:appquiz/data/question.dart'; // Ensure `questions` is defined in this file.
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.restart, {super.key});

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i]
            .text, // Ensure `questions` is imported and defined correctly.
        'correct_answer': questions[i].answers[0],
        'useranswer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the number of correct answers

    int numofcorrectanswer = 0;

    for (var e in summaryData) {
      if (e['useranswer'] == e['correct_answer']) {
        numofcorrectanswer++;
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $numofcorrectanswer of ${questions.length} questions correctly.',
            style: const TextStyle(
              color: Color.fromARGB(255, 250, 205, 254),
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...summaryData.map((e) => Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: e['useranswer'] == e['correct_answer']
                            ? Colors.teal
                            : Colors.red,
                        child: Text(
                          (((e['question_index'] as int) + 1).toString()),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['question'].toString(),
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              e['useranswer'].toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(179, 245, 239, 239)),
                            ),
                            Text(
                              e['correct_answer'].toString(),
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              )),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: restart,
            label: const Text(
              'Restart Quiz',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.restart_alt_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

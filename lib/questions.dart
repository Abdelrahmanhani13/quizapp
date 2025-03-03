import 'package:appquiz/answer_button.dart';
import 'package:appquiz/data/question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions(this.onselectedAnswer, {super.key});

  final void Function(String) onselectedAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        widget.onselectedAnswer(answer);
        currentQuestionIndex++;
      });
    } else {
      // Handle the end of the quiz if needed
      widget.onselectedAnswer(answer);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.only(top: 80),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Question Text
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          // Answer Buttons
          Expanded(
            child: ListView.builder(
              itemCount: currentQuestion.shuffledAnswers.length,
              itemBuilder: (context, index) {
                final answer = currentQuestion.shuffledAnswers[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AnswerButton(
                    answertext: answer,
                    onPressed: () => answerQuestion(answer),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

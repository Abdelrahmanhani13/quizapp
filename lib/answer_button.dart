import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton( {super.key, required this.answertext, required this.onPressed});

  final String answertext;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
      onPressed: onPressed,
      child: Text(answertext,textAlign: TextAlign.center,),
    );
  }
}

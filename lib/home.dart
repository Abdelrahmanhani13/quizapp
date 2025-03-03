import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home(this.switchscreen, {super.key});

  final void Function() switchscreen;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: widget.switchscreen,
            label: const Text('Start Quiz'),
            icon: Icon(Icons.arrow_right_outlined),
          ),
        ],
      ),
    );
  }
}

import 'package:appquiz/data/question.dart';
import 'package:appquiz/home.dart';
import 'package:appquiz/questions.dart';
import 'package:appquiz/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = Result(selectedAnswers,restart);
      });
    }
  }
  void restart(){
    setState(() {
    selectedAnswers = [];
    activescreen = Home(switchscreen);
    });
    
  }


  Widget? activescreen;
  @override
  void initState() {
    super.initState();
    activescreen = Home(switchscreen);
  }

  void switchscreen() {
    setState(() {
      activescreen = Questions(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.amber, Colors.green])),
          child: activescreen,
        ),
      ),
    );
  }
}

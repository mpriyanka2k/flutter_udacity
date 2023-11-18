import 'package:flutter/material.dart';
import 'package:flutter_udacity/questions_screen.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  final List<String> selectedAnswer = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 62, 97, 173),
            Color.fromARGB(255, 11, 28, 80),
          ])),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/images/quiz-logo.png',
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Learn Flutter the fun way!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const QuestionScreen(questions)));
                    },
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue),
                    icon: Icon(Icons.add),
                    label: const Text('Press'))
              ],
            ),
          )),
    );
  }
}

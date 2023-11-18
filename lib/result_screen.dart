import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_udacity/data/questions.dart';
import 'package:flutter_udacity/questions_screen.dart';
import 'package:flutter_udacity/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswers});
  List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalNumberOfQuestions = questions.length;
    final currectNumberOfQuestions = summaryData.where((element) {
      return element['user_answer'] == element['correct_answer'];
    }).length;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'You answered $currectNumberOfQuestions out of $totalNumberOfQuestions questions correctly!',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text('List of answers and questions...'),
              QuestionsSumarry(summaryData),
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                onPressed: () {
                  log('Restart Quiz clicked');
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const QuestionScreen(questions)));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const QuestionScreen(questions)),
                      (route) => false);
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: Text(
                  'Restart Quiz!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_udacity/result_screen.dart';
import 'package:flutter_udacity/utilities/custom_elevated_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions.dart';
import 'models/quiz_questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.quizQuestions, {super.key});

  final List<QuizQuestions> quizQuestions;

  @override
  State<StatefulWidget> createState() => QuestionScreenState();
}

class QuestionScreenState extends State<QuestionScreen> {
  var _curretQuestionIndex = 0;
  final List<String> selectedAnswers = [];

  void answerquestion(String answer) {
    var numberOfQuestions = questions.length;
    log("numberOfquestions  = $numberOfQuestions");
    log("_curretQuestionIndex =$_curretQuestionIndex");
    if (numberOfQuestions > _curretQuestionIndex) {
      setState(() {
        selectedAnswers.add(answer);
        log("selectedAnswers = $selectedAnswers");
        if (numberOfQuestions == selectedAnswers.length) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultScreen(
                        chosenAnswers: selectedAnswers,
                      )));
          return;
        }
        _curretQuestionIndex++;
        log("_curretQuestionIndex =$_curretQuestionIndex");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final singlequestions = questions[_curretQuestionIndex];
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 98, 130, 199),
          Color.fromARGB(255, 11, 28, 80),
        ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                singlequestions.text,
                style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),

              /// implementing
              ...singlequestions.getShuffledList().map((answer) {
                return CustomElevatedButton().buildElevatedButtonForAnswer(() {
                  answerquestion(answer);
                }, answer);
              })
            ],
          ),
        ),
      ),
    );
  }
}

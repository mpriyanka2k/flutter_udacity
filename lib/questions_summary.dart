import 'package:flutter/material.dart';

class QuestionsSumarry extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSumarry(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((summary) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.purpleAccent.shade100,
                    radius: 12,
                    child: Text(
                      ((summary['question_index'] as int) + 1).toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          summary['question'].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(summary['correct_answer'].toString(),
                            style: TextStyle(
                                color: Colors.blue.shade200, fontSize: 10)),
                        Text(summary['user_answer'].toString(),
                            style: TextStyle(
                                color: Colors.teal.shade400, fontSize: 10)),
                      ],
                    ),
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}

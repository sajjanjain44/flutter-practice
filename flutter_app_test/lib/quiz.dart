import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_udemy/question.dart';
import 'package:flutter_quiz_app_udemy/answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['question']),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((ans) {
          return Answer(() => answerQuestion(ans['score']), ans['text']);
        }).toList(),
      ],
    );
  }
}

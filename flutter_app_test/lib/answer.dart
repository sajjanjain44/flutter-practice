import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function answer;
  final String answerText;

  Answer(this.answer, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.cyan,
        child: Text(answerText),
        onPressed: answer,
      ),
    );
  }
}

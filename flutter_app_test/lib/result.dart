
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore,this.resetQuiz);

  String get resultPhase {
    return "You Did it! Your score is : " + resultScore.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: resetQuiz, child: Text('Restart Quiz!'))
        ],
      ),
    );
  }
}

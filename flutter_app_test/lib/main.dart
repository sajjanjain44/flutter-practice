import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_udemy/result.dart';
import './CustomAppBar.dart';
import 'package:flutter_quiz_app_udemy/quiz.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
//  AppBar szAppbar;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  static const _questions = [
    {
      'question': "What's Your Favorite Color?",
      'answer': [
        {'text': "red", 'score': 10},
        {'text': "green", "score": 20},
        {"text": "black", 'score': 30},
        {'text': "orange", 'score': 40},
      ],
    },
    {
      'question': "Whats your Favorite Animal?",
      'answer': [
        {'text': 'dog', 'score': 10},
        {'text': 'cat', 'score': 20},
        {'text': 'rabbit', 'score': 30},
        {'text': 'perrot', 'score': 40},
      ],
    },
    {
      'question': "Whats your fav food?",
      'answer': [
        {'text': 'pizza', 'score': 10},
        {'text': 'burger', 'score': 20},
        {'text': 'halwa', 'score': 30},
        {'text': 'eggs', 'score': 40},
      ],
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {}

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: BaseAppBar(
          title: Text('SAJJAN'),
          appBar: AppBar(),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore,_resetQuiz),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

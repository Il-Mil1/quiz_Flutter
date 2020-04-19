import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'Am I understanding flutter?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 2},
        {'text': 'Not really', 'score': 4},
        {'text': 'A little bit', 'score': 7},
      ],
    },
    {
      'questionText': 'Am I enjoying flutter?',
      'answers': [
        {'text': 'A lot', 'score': 7},
        {'text': 'Not really', 'score': 1},
        {'text': 'I don\'t understand', 'score': 3},
        {'text': 'I\'m loving it', 'score': 10},
      ],
    },
    {
      'questionText': 'Am I suggesting the course?',
      'answers': [
        {'text': 'Absolutely no', 'score': 2},
        {'text': 'Go for something else', 'score': 4},
        {'text': 'You can find better', 'score': 0},
        {'text': 'Why asking so? Of yourse yes!', 'score': 10},
      ],
    }
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('no more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ), //AppBar
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ), //Scaffold
    ); //Material app
  }
}

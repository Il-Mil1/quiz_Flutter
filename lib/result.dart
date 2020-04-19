import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultsScore;
  final Function resetHandler;

  Result(this.resultsScore, this.resetHandler);

  String get resultPrase {
    String resultText;
    if (resultsScore <= 8) {
      resultText = 'You don\'t know me';
    } else if (resultsScore <= 15) {
      resultText = 'Almost!';
    } else {
      resultText = 'You did perfect!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPrase,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        FlatButton(onPressed: resetHandler, child: Text('Restart Quiz!'))
      ]),
    );
  }
}

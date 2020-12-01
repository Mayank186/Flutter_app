import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resultHandler;
  Result(this.resultScore, this.resultHandler);

  String get resultPhase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'you are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'pretty likable!';
    } else if (resultScore <= 16) {
      resultText = 'you are strange';
    } else {
      resultText = 'you are so bad';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhase,
          style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('restart quiz'),
          textColor: Colors.blue,
          onPressed: resultHandler,
        )
      ],
    ));
  }
}

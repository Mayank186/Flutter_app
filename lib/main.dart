import 'package:flutter/material.dart';
import 'package:flutter_app/answer.dart';
import './quiz.dart';
import './results.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text ': 'blue', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'pink', 'score': 3},
        {'text': 'black', 'score': 1}
      ],
    },
    {
      'questiontext': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'lion', 'score': 10},
        {'text': 'rebbit', 'score': 5},
        {'text': 'tiger', 'score': 3},
        {'text': 'elephent', 'score': 1}
      ],
    },
    {
      'questiontext': 'who\'s your favorite fruite?',
      'answers': ['apple', 'banana', 'mango', 'kivi'],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print('we have more question');
    } else {
      print('you did it!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < questions.length
              ? Quiz(
                  questions: questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}

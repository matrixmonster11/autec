import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../util/colors.dart';
import './quiz.dart';
import './result.dart';


class QuizInterface extends StatefulWidget {
  _QuizInterface createState() => _QuizInterface();

}

class _QuizInterface extends State<QuizInterface> with TickerProviderStateMixin{
  final _questions = const [
    {
      'questionText': 'q1',
      'element': 'bee',
      'answers': [
        {'text': 'fly', 'score': -2},
        {'text': 'hornet', 'score': -2},
        {'text': 'bee', 'score': 10},
        {'text': 'cockroach', 'score': -2},
      ],
    },
    {
      'questionText': 'q2',
      'element': 'horse',
      'answers': [
        {'text': 'donkey', 'score': -2},
        {'text': 'boar', 'score': -2},
        {'text': 'bear', 'score': -2},
        {
          'text':
          'horse',
          'score': 10
        },
      ],
    },
    {
      'questionText': 'q3',
      'element': 'cricket',
      'answers': [
        {'text': 'rabbit', 'score': -2},
        {'text': 'cricket', 'score': 10},
        {'text': 'raven', 'score': -2},
        {'text': 'crow', 'score': -2},
      ],
    },
    {
      'questionText': 'q4',
      'element': 'sparrow',
      'answers': [
        {'text': 'sparrow', 'score': 10},
        {'text': 'cat', 'score': -2},
        {'text': 'seagull', 'score': -2},
        {'text': 'dog', 'score': -2},
      ],
    },
    {
      'questionText':
      'q5',
      'element': 'dog',
      'answers': [
        {
          'text': 'Yes',
          'score': -2,
        },
        {'text': 'No', 'score': 10},
      ],
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
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'FRENCH', 'locale': Locale('fr', 'FR')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  //late final AudioCache _audioCache;
  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('changelang'.tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.pink,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Satisfactoria',
            style: TextStyle(fontFamily: '', fontSize: 41, color: Colors.black),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.translate),
              color: AppColor.lightBlackColor,
              onPressed: () async {
                await buildLanguageDialog(context);
              },
            ),
          ], // Icon
        ),
        body: SingleChildScrollView(
        child: (Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ) //Padding
    ))
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}

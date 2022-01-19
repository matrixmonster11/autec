import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  final String element;
  late AudioCache _audioCache;

  Question(this.questionText,this.element);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child:
          Column(children: <Widget>[
      RawMaterialButton(
        child: Image.asset(
          'assets/'+element+'.jpg',
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),        onPressed: ()=> {_audioCache.play('audio/'+element+'.mp3')} ,
    ),
        Text(
          questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
     ])
       //Text
    ); //Container
  }
}

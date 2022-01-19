import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Color(0xFFFF8400),
        textColor: Colors.white,
        child: Text(answerText.tr),
        onPressed: ()=>selectHandler(),
      ), //RaisedButton
    ); //Container
  }
}

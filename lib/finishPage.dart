import 'package:flutter/material.dart';
import 'quizData.dart';
import 'main.dart';
import 'dart:async';

QuizBrain quizBrain = QuizBrain();

//TODO: 全体的にデザインがアレ
class FinishPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                    "復習完了です.\nおつかれさまでした!",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 30, 48),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: FlatButton(
              height: 100.0,
              color: Colors.blueAccent,
              child: Text(
                'メインメニューへ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                quizBrain.initQuizNum();
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title :Text("復習しましょう！"),
                      content: Text("3分だけだから！"),
                    )
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'quizPage.dart';
import 'quizData.dart';
import 'package:flutter/material.dart';

QuizBrain quizBrain = QuizBrain();

class SelectSection extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('3 minutes review'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child:  FlatButton(
                      height: 80.0,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          '数と式',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      onPressed: (){
                        quizBrain.setQuizNum(1);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child:  FlatButton(
                      height: 80.0,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          '二次関数',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      onPressed: (){
                        quizBrain.setQuizNum(3);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      height: 80.0,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          '図形と計量',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      height: 80.0,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                            'データの分析',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child:  FlatButton(
                      height: 80.0,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          '場合の数と確率',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      onPressed: (){
                        quizBrain.setQuizNum(2);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      height: 80.0,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                            '図形の性質',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      height: 80.0,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                            '整数の性質',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:katex_flutter/katex_flutter.dart';
import 'quizData.dart';
import 'finishPage.dart'; //TODO: 追加分1

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

QuizBrain quizBrain = QuizBrain();

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
  }
  getColor(bool b){
    if(b == true){
      return Colors.teal;
    }else{
      return Colors.red;
    }
  }

  int _answered = 0; //0:未回答, 1:回答済み
  int _userAns = 0; //ユーザの選択した答えの番号


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  //問題文
                  color: Colors.lightBlueAccent,
                  child: Builder(
                    builder: (context) => KaTeX(
                      laTeXCode: Text(
                        quizBrain.getQuiz(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  //選択肢1
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          //color: Colors.amberAccent,
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Builder(
                            builder: (context) => KaTeX(
                              laTeXCode: Text(quizBrain.getChoice1(),
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                          ),
                        ),
                      ),
                      RaisedButton(
                        child: const Text('1'),
                        onPressed: () {
                          if (_answered == 0) {
                            //答えを選択した直後の挙動
                            //ユーザの選択肢, ユーザが回答したと記録(どちらも一時的なもの)
                            _userAns = 1;
                            _answered = 1;
                            setState(() {
                              quizBrain.nowQuiz();
                            });
                          } else {
                            //選択肢押したらボタン無効
                            null;
                          }
                        },
                        highlightElevation: 1,
                        highlightColor: Colors.blue,
                        onHighlightChanged: (value) {},
                        elevation: 20,
                        color: Colors.grey,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //選択肢2
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          //color: Colors.lightGreen,
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Builder(
                            builder: (context) => KaTeX(
                              laTeXCode: Text(quizBrain.getChoice2(),
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                          ),
                        ),
                      ),
                      RaisedButton(
                        child: const Text('2'),
                        onPressed: () {
                          if (_answered == 0) {
                            //答えを選択した後の挙動
                            //ユーザの選択肢, ユーザが回答したと記録(どちらも一時的なもの)
                            _userAns = 2;
                            _answered = 1;
                            setState(() {
                              quizBrain.nowQuiz();
                            });
                          } else {
                            //選択肢押したらボタン無効
                            null;
                          }
                        },
                        highlightElevation: 1,
                        highlightColor: Colors.blue,
                        onHighlightChanged: (value) {},
                        elevation: 20,
                        color: Colors.grey,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //選択肢3
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          //color: Colors.deepOrange,
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Builder(
                            builder: (context) => KaTeX(
                              laTeXCode: Text(quizBrain.getChoice3(),
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                          ),
                        ),
                      ),
                      RaisedButton(
                        child: const Text('3'),
                        onPressed: () {
                          if (_answered == 0) {
                            //答えを選択した後の挙動
                            //ユーザの選択肢, ユーザが回答したと記録(どちらも一時的なもの)
                            _userAns = 3;
                            _answered = 1;
                            setState(() {
                              quizBrain.nowQuiz();
                            });
                          } else {
                            //選択肢押したらボタン無効
                            null;
                          }
                        },
                        highlightElevation: 1,
                        highlightColor: Colors.blue,
                        onHighlightChanged: (value) {},
                        elevation: 20,
                        color: Colors.grey,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      //正解不正解表示
                      color: Colors.black12,
                      margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
                      child: Text(
                        quizBrain.showResult(_answered, _userAns),
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    RaisedButton(
                      // TODO: まだ習ってないため終了ページへ画面遷移する
                      //まだ習ってないボタン
                      child: const Text(
                        'まだ習ってない',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blueAccent,
                      shape: const StadiumBorder(),
                      onPressed: () {
                        //TODO: 追加分3 まだ習ってないを押したときの挙動
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FinishPage(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  //解答解説
                  color: Colors.black12,
                  child: Visibility(
                    visible: quizBrain.showAnswer(_answered),
                    child: Builder(
                      builder: (context) => KaTeX(
                        laTeXCode: Text(quizBrain.getAnswer(),
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ),
                  ),
                ),
                flex: 4,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        //次の問題へボタン
        //TODO: 未回答の時は押せなくなるが、見た目に変化がない(選択肢でも同様の現象)
        //TODO: 全て回答済みの場合は終了ページへ画面遷移したい
        //     if (_userAns==0) {
        //       onPressed: null;
        // }
        onPressed: () {
          //TODO: 追加分2
          if (_answered == 1 && quizBrain.getQuizNum() == 7) {
            //全ての問題に回答済み
            quizBrain.initQuizNum();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FinishPage(),
              ),
            );
          }

          if (_answered == 1) {
            //ユーザの答えを未回答の状態に戻す
            _userAns = 0;
            _answered = 0;
            setState(() {
              quizBrain.nextQuiz();
            });
          } else {
            null;
          }
        },
        label: Text('次の問題'),
        icon: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
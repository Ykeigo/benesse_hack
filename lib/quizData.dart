import 'package:katex_flutter/katex_flutter.dart';

class QuizSet {
  int id; //問題ID
  int ansNum; //正解の選択肢番号
  String question; //問題文
  String choice1; //選択肢1
  String choice2; //選択肢2
  String choice3; //選択肢3
  String answer; //回答解説

  QuizSet({
    this.id,
    this.ansNum,
    this.question,
    this.choice1,
    this.choice2,
    this.choice3,
    this.answer,
  });
}

class QuizBrain {
  List<QuizSet> _quizData = [
    QuizSet(
        id: 1,
        ansNum: 1,
        question: "A、B を有限集合として、n(P)は有限集合 P の要素の個数を表す。和集合の要素の個数の求め方は?",
        choice1: r'1.n(A$\cup$B)=n(A)+n(B)-n(A$\cap$B)',
        choice2: r'2.n(A$\cup$B)=n(A)+n(B)-n(A$\cup$B)',
        choice3: r'3.n(A$\cup$B)=n(A)-n(B)-n(A$\cap$B)',
        answer: "正解は1 \n" r'$\cup$(または)、$\cap$(かつ)の違いを理解しておこう!'),
    QuizSet(
        id: 2,
        ansNum: 2,
        question:
        'A、B を有限集合として、n(P)は有限集合 P の要素の個数を表す。U は全体集合を表す。 補集合の要素の個数の求め方は?',
        choice1: r'1.$n(\text{\={A}})=n(U)+n(A)$',
        choice2: r'2.$n(\text{\={A}})=n(U)-n(A)$',
        choice3: r'3.$n(\text{\={A}})=n(A)-n(U)$',
        answer: "正解は2 \n 補集合は U には属するけど、A には属さないってことだよ!"),
    QuizSet(
        id: 3,
        ansNum: 1,
        question: '異なるn個の円順列総数は?',
        choice1: r'$1.\frac{{}_nP_n}{n} = (n-1)!$',
        choice2: r'$2.\frac{{}_nP_n}{n} = n!$',
        choice3: r'$3.{}_nP_n = (n-1)!$',
        answer: "正解は1 \n 円順列は数えすぎている分、個数nで割る必要があるよ!"),
    QuizSet(
        id: 4,
        ansNum: 3,
        question: 'じゅず順列の求め方は?',
        choice1: r'1.$\frac{n!}{2}$',
        choice2: r'2.$\frac{(n+1)!)}{2}$',
        choice3: r'3.$\frac{(n-1)!)}{2}$',
        answer: '正解は3 \n' r'円順列の総数を2で割るといいよ!円順列の解き方は$(n-1)!/2$だったね!'),
    QuizSet(
        id: 5,
        ansNum: 2,
        question: '重複配列(異なる n 個から重複を許して r 個取り出して並べる)の求め方は?',
        choice1: r'1.$r^n$',
        choice2: r'2.$n^r$',
        choice3: r'3.$nr$',
        answer: "正解は2 \n n個からr個取るとき、その総数は nr だったね!"),
    QuizSet(
        id: 6,
        ansNum: 3,
        question: r'$y=ax^2+bx+c (a \neq 0)$の軸の方程式は？',
        choice1: r'1.$x=-\frac{b}{a}$',
        choice2: r'2.$x=\frac{b}{2a}$',
        choice3: r'3.$-\frac{b}{2a}$',
        answer: "正解は3 \n 解の公式と合わせて覚えておこう"),
    QuizSet(
        id: 7,
        ansNum: 3,
        question: r'二次方程式の解の公式は？',
        choice1: r'1.$x=\frac{-b \pm\sqrt{b^2 - 4ac} }{a}$',
        choice2: r'2.$x=\frac{b \pm\sqrt{b^2 - 4ac} }{2a}$',
        choice3: r'3.$x=\frac{-b \pm\sqrt{b^2 - 4ac} }{2a}$',
        answer: "正解は3 \n 符号に気をつけよう"),
    QuizSet(
        id: 8,
        ansNum: 2,
        question: r'$y=ax^2+bx+c (a \neq 0)が実数解を持つ条件は？$',
        choice1: r'1.$b^2 - 4ac > 0$',
        choice2: r'2.$b^2 - 4ac \geqq 0$',
        choice3: r'3.$b^2 - 4ac < 0$',
        answer: "正解は2 \n 符号に気をつけよう")
  ];

  int _quizNum = 0; //現在の問題番号(indexそのまま)

  //次の問題取得
  void nextQuiz() {
    _quizNum += 1;
  }

  //現在の問題取得
  void nowQuiz() {
    _quizNum = _quizNum;
  }

  String getQuiz() {
    return _quizData[_quizNum].question;
  }

  String getChoice1() {
    return _quizData[_quizNum].choice1;
  }

  String getChoice2() {
    return _quizData[_quizNum].choice2;
  }

  String getChoice3() {
    return _quizData[_quizNum].choice3;
  }

  String getAnswer() {
    return _quizData[_quizNum].answer;
  }

  //TODO: 追加分1 quizData.dart
  //現在の問題番号を取得
  int getQuizNum() {
    return _quizNum;
  }

  //TODO: 追加分2 quizData.dart
  //初期化
  void initQuizNum() {
    _quizNum = 0;
  }
  void setQuizNum(int num){
    if(num == 1){
      _quizNum = 0;
    }else if(num == 2){
      _quizNum = 3;
    }else if(num == 3){
      _quizNum = 7;
    }
    print(_quizNum);
  }


  //答えを見えなくしたり表示したりする関数
  bool showAnswer(int answered) {
    //answered=1のとき、問題に回答済み
    if (answered == 1) {
      return true;
    } else {
      return false;
    }
  }

  //正解もしくは不正解を表示する関数
  String showResult(int answered, int userAns) {
    //answered=1のとき、問題に回答済み
    //userAnsはユーザの選択した選択肢の番号が入る
    if (answered == 0) {
      return '';
    } else if (userAns == _quizData[_quizNum].ansNum) {
      return '正解';
    } else {
      return '不正解';
    }
  }
}

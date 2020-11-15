import 'package:flutter/material.dart';
import 'quizPage.dart';
import 'selectSection.dart';

int numOfPressedStart = 0;

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        body: MainPage(),
      ),
    ),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class SelectSectionPage extends StatefulWidget{
  @override
  _SelectSectionPage createState() => _SelectSectionPage();
}

class _SelectSectionPage extends State <SelectSectionPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}

// class _QuizPage extends State<QuizPage>{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('3 minutes review'),
//         backgroundColor: Colors.blueAccent,
//         automaticallyImplyLeading: false,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Container(
//             height: 10,
//           ),
//           Expanded(
//             // Start button
//             flex: 1,
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 30, 30, 48),
//                   borderRadius: BorderRadius.circular(25.0),
//                 ),
//                 child: Text(
//                     '問題画面へ遷移',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.0,
//                     ),
//                     // 'Start',
//                   ),
//                 ),
//               ),
//             ),
//           SizedBox(
//             height: 20.0,
//             width: 150.0,
//             child: Divider(
//               color: Colors.teal.shade200,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: FlatButton(
//               onPressed: (){
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MainPage(),
//                   ),
//                 );
//               },
//               color: Colors.blue,
//               child: Text(
//                 '問題選択画面へ遷移',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                 ),
//                 // 'Start',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _MainPage extends State<MainPage> {
  getCalender() {
    // TODO: カレンダー表示
    if(numOfPressedStart == 0) {
      return Image.asset('images/calender.png');
    }else{
      return Image.asset('images/calender2.png');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('3 minutes review'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 10,
          ),
          Expanded(
            // Start button
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 30, 30, 48),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: FlatButton(
                  onPressed: (){
                    numOfPressedStart ++;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizPage(),
                      ),
                    );
                  },
                  color: Colors.blue,
                  child: Text(
                    '問題画面へ遷移',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    // 'Start',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 30, 30, 48),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: FlatButton(
                  onPressed: (){
                    numOfPressedStart ++;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectSection(),
                      ),
                    );
                  },
                  color: Colors.blue,
                  child: Text(
                    '問題選択画面へ遷移',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    // 'Start',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: Text(
                '今日3万人がこのアプリを開きました。',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: getCalender(),
              // child: getCalender(),
            ),
          ),
        ],
      ),
    );
  }
}
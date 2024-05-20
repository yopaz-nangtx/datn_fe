import 'package:datn_test/constants/ui_constants.dart';
import 'package:datn_test/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/constants/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../model/asignment.dart';

class ResultsScreen extends StatelessWidget {
  var score;
  var index;
  ResultsScreen(int score, int index) {
    this.score = score;
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    String roundedNumber = ((score / index) * 10).toStringAsFixed(2);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exam Results'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 50, 5, 0),
                width: double.infinity,
                child: Card(
                  color: Color.fromARGB(55, 0, 0, 0),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Number of sentences correct: ${score}/${index}'),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    color: Colors.red,
                    width: 200,
                    height: 50,
                    child: Center(child: Text("Go to Back")),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Listed extends StatelessWidget {
  const Listed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      height: 23.0,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
          color: AppColors.kLGreyClr,
          borderRadius: BorderRadius.all(Radius.circular(5.5))),
    );
  }
}

// class CustomCard extends StatelessWidget {
//   var index;
//   CustomCard(index) {
//     this.index = index;
//   }

//   dynamic retColor(int i) {
//     if (Answers[i] == true) {
//       return Colors.blue.shade800;
//     } else {
//       return Colors.grey.shade800;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: retColor(index),
//       child: Container(
//           margin: EdgeInsets.all(10),
//           child: Text(
//             Questions[index]["note"],
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//             textAlign: TextAlign.center,
//           )),
//     );
//   }
// }

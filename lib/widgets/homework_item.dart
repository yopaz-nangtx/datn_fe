import 'package:datn_test/screens/home_screen_item/class_your_assignment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/class.dart';
import '../model/homework.dart';

class HomeworkListItem extends StatelessWidget {
  final HomeWork hwInfo;
  final int index;

  HomeworkListItem({required this.hwInfo, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                  bottom: BorderSide(color: Color(0xffDCDCDC), width: 0.5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${index}. ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${hwInfo.assignmentName![0].toUpperCase()}" +
                        "${hwInfo.assignmentName!.substring(1)}" +
                        " ${hwInfo.score != null ? "(${hwInfo.score} / 100)" : ""}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Class Name: ${hwInfo.nameClass!}',
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Teacher: ${hwInfo.teacher! ?? ''}',
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Number of questions: ${hwInfo.countQuestion!}",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Expiration date: ${DateFormat('dd-MM-yyyy').format(DateTime.parse(hwInfo.endTime!))}",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.centerRight,
          child: hwInfo.isFinished == 0
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YourAssignemt(
                                  id: hwInfo.id!,
                                )));
                  },
                  child: Ink(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(0.1), // Màu nền khi hover
                    ),
                    child: Icon(Icons.arrow_circle_right),
                  ),
                )
              : Container(
                  width: 15, // Điều chỉnh kích thước của checkbox
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
        )),
      ],
    );
  }
}

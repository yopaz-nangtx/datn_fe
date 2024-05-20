import 'package:datn_test/screens/home_screen_item/class_detail.dart';
import 'package:flutter/material.dart';

import '../model/class.dart';

class ClassListItem extends StatelessWidget {
  final ClassList classInfo;
  final bool checkPage;
  final int index;

  ClassListItem(
      {required this.classInfo, required this.checkPage, required this.index});

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
                    classInfo.name![0].toUpperCase() +
                        classInfo.name!.substring(1),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Teacher: ',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      Text(
                        classInfo.teacher!.name ?? '',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Progress: ${classInfo.numberOfLessonsStudied}/${classInfo.lessons!.length} " +
                        "lesson",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  classInfo.schedule == null
                      ? SizedBox()
                      : Text(
                          classInfo.schedule ?? '',
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Room: ${classInfo.room!.name!}",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClassDetailPage(
                              classId: classInfo.id!,
                              checkPage: checkPage,
                            )));
              },
              child: Ink(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.1), // Màu nền khi hover
                ),
                child: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

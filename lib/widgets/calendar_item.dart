import 'package:datn_test/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:datn_test/constants/route.dart';
import 'dart:convert';
import 'package:datn_test/globals.dart' as globals;

import '../globals.dart';

Container buildTaskListItem(
    context,
    String timeStart,
    bool isAM,
    String studyTime,
    String nameClass,
    String nameLesson,
    String nameTeacher,
    String phoneTeacher,
    String room) {
  String noon = isAM ? "AM" : "PM";

  return Container(
    margin: EdgeInsets.only(bottom: 25),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 15,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(5),
                  )),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        text: timeStart,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: " " + noon,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          )
                        ]),
                  ),
                  Text(
                    studyTime,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          // height: 175,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.only(right: 25, left: 30),
          padding: EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameClass,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                nameLesson,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 9,
                    backgroundImage: AssetImage("assets/icons/avatar.png"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameTeacher,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        phoneTeacher,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "281 Truong Dinh, Hoang Mai, Ha Noi",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        room,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

GestureDetector buildDateColumn(context, String weekDay, int date,
    VoidCallback onTap, bool isActive, DateTime dateTime) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: isActive
          ? BoxDecoration(
              color: Color(0xff402fcc),
              borderRadius: BorderRadius.circular(10),
            )
          : BoxDecoration(),
      height: 55,
      width: 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            weekDay,
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          Text(
            date.toString(),
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

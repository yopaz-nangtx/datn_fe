import 'package:flutter/material.dart';

Container buildTaskItem(String typeTask, String timeLeft, String className,
    String nameTask, Color color, bool isHomework) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    padding: EdgeInsets.all(12),
    // height: 120,
    // width: 250,
    decoration: BoxDecoration(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          typeTask,
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              timeLeft,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 200,
          child: Row(
            children: [
              Icon(Icons.person_pin_circle_rounded, size: 20),
              SizedBox(width: 5),
              Text(
                className,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Row(
            children: [
              Icon(isHomework ? Icons.home_work_rounded : Icons.quiz_rounded,
                  size: 20),
              SizedBox(width: 5),
              Text(
                nameTask,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Row buildTitleRow(String title, int number) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      RichText(
        text: TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: " ($number)",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ]),
      ),
    ],
  );
}

Container buildClassItem(BuildContext context, String time, bool isAM,
    String className, String roomName, String teacherName) {
  String noon = isAM ? "AM" : "PM";
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    padding: EdgeInsets.all(10),
    height: 100,
    decoration: BoxDecoration(
      color: Color(0xFFF9F9FB),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              noon,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
        Container(
          height: 100,
          width: 1,
          color: Colors.grey.withOpacity(0.5),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 160,
              child: Text(
                className,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Text(
                    roomName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("assets/icons/avatar.png"),
                  radius: 10,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  teacherName,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                )
              ],
            ),
          ],
        )
      ],
    ),
  );
}

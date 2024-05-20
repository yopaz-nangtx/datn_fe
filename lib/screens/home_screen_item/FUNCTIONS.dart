import 'package:datn_test/screens/home_screen_item/complains.dart';
import 'package:datn_test/screens/home_screen_item/your_exam.dart';
import 'package:datn_test/screens/home_screen_item/leave_apply.dart';
import 'package:datn_test/screens/home_screen_item/your_class.dart';
import 'package:datn_test/screens/home_screen_item/results.dart';
import 'package:datn_test/screens/home_screen_item/your_homework.dart';
import 'package:flutter/material.dart';

class MainFunction extends StatefulWidget {
  const MainFunction({Key? key}) : super(key: key);

  @override
  _MainFunctionState createState() => _MainFunctionState();
}

class _MainFunctionState extends State<MainFunction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourClass()),
                );
              },
              title: "Your Classes",
              icon: "assets/icons/class.png",
            ),
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourHomework()),
                );
              },
              title: "Homework",
              icon: "assets/icons/house.png",
            ),
            // CustomIconButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ExamSchedule()),
            //     );
            //   },
            //   title: "Exam",
            //   icon: "assets/icons/exam.png",
            // ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaveApply()),
                );
              },
              title: "Leave Apply",
              icon: "assets/icons/attendance.png",
            ),
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Complaints()),
                );
              },
              title: "Complaints",
              icon: "assets/icons/complain.png",
            ),
          ],
        ),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({required this.onPressed, this.title, required this.icon});
  final GestureTapCallback onPressed;
  final title;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                icon,
                height: 50,
                width: 50,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
        onPressed: onPressed,
        shape: const StadiumBorder(),
      ),
    );
  }
}

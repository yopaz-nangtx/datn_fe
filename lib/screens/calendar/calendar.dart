import 'package:datn_test/constants/app_colors.dart';
import 'package:datn_test/constants/time.dart';
import 'package:datn_test/globals.dart';
import 'package:datn_test/widgets/calendar_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:datn_test/constants/route.dart';
import 'dart:convert';
import '../../constants/constants.dart';
import 'package:datn_test/globals.dart' as globals;

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}
List<DateTime> generateDays(DateTime startDate, int numberOfDays) {
  List<DateTime> days = [];
  for (int i = 0; i < numberOfDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}

class _CalendarPageState extends State<CalendarPage> {
  List<bool> dayActiveList = List.generate(7, (index) => false);
  List<Container> lessonSchedules = [];
  @override
  void initState() {
    super.initState();
    _setToday();
  }

  fetchDataForSelectedDate(context, DateTime dateTime) async {
    var response = await http.post(
      Uri.parse(urlLessonSelectedDate),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
      body: jsonEncode(<String, String>{
        'datetime': dateTime.toString(),
      }),
    );
    print(response);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var lessonDataSchedule = jsonDecode(response.body);
      setState(() {
        lessonSchedules = [];
        for (int i = 0; i < lessonDataSchedule.length; i++) {
          for (var j = 0; j < lessonDataSchedule[i]['lessons'].length; j++) {
            lessonSchedules.add(buildTaskListItem(
                context,
                DateTime.parse(lessonDataSchedule[i]['lessons'][j]['start_time'])
                        .hour
                        .toString() +
                    ":" +
                    DateTime.parse(lessonDataSchedule[i]['lessons'][j]['start_time'])
                        .minute
                        .toString(),
                DateTime.parse(lessonDataSchedule[i]['lessons'][j]['start_time'])
                        .hour <
                    12,
                getDiffStartEndTime(
                    DateTime.parse(
                            lessonDataSchedule[i]['lessons'][j]['start_time'])
                        .hour,
                    DateTime.parse(
                            lessonDataSchedule[i]['lessons'][j]['start_time'])
                        .minute,
                    DateTime.parse(lessonDataSchedule[i]['lessons'][j]['end_time'])
                        .hour,
                    DateTime.parse(lessonDataSchedule[i]['lessons'][j]['end_time'])
                        .minute),
                lessonDataSchedule[i]["name"],
                lessonDataSchedule[i]['lessons'][j]["lesson_name"],
                lessonDataSchedule[i]['teacher']["name"],
                lessonDataSchedule[i]['teacher']["phone_number"],
                lessonDataSchedule[i]['room']["name"]));
          }
        }
      });
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              //color: Color(0xFFD4E7FE),
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFD4E7FE),
                    Color(0xFFF0F0F0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 0.3])),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          alignment: Alignment.topCenter,
          // color: Color(0xFFF0F0F0),
          height: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today, color: AppColors.kBlueClr),
                  SizedBox(
                    width: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      text: getWeekDayString(DateTime.now().weekday) + ', ',
                      style: TextStyle(
                        color: AppColors.kBlueClr,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                      children: [
                        TextSpan(
                          text: DateTime.now().day.toString() +
                              ' ' +
                              getMonthString(DateTime.now().month) +
                              ' ' +
                              DateTime.now().year.toString(),
                          style: TextStyle(
                            color: AppColors.kBlueClr,
                            fontSize: fontSizeText,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: _setToday,
                child: Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF3E3993),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 100,
          child: Container(
            height: MediaQuery.of(context).size.height - 160,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 30),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(7, (index) {
                      final now = DateTime.now();
                      final currentWeekDay =
                          DateTime(now.year, now.month, now.day)
                              .add(Duration(days: index - now.weekday + 1));

                      final weekDay = currentWeekDay.weekday; // Thứ trong tuần
                      final day = currentWeekDay.day; // Ngày trong tháng

                      return buildDateColumn(
                        context,
                        getWeekDayStringShortened(weekDay),
                        day,
                        () {
                          setState(() {
                            for (int i = 0; i < dayActiveList.length; i++) {
                              dayActiveList[i] = false;
                            }
                            dayActiveList[index] = true;
                            fetchDataForSelectedDate(context, currentWeekDay);
                          });
                        },
                        dayActiveList[index],
                        currentWeekDay,
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...lessonSchedules,
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void _setToday() {
    setState(() {
      final now = DateTime.now();
      for (int i = 0; i < dayActiveList.length; i++) {
        dayActiveList[i] = false;
      }
      dayActiveList[now.weekday - 1] = true;
      fetchDataForSelectedDate(context, now);
    });
  }
}

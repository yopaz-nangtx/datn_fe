import 'package:flutter/material.dart';

String getWeekDayString(int weekDay) {
  switch (weekDay) {
    case DateTime.monday:
      return 'Monday';
    case DateTime.tuesday:
      return 'Tuesday';
    case DateTime.wednesday:
      return 'Wednesday';
    case DateTime.thursday:
      return 'Thursday';
    case DateTime.friday:
      return 'Friday';
    case DateTime.saturday:
      return 'Saturday';
    case DateTime.sunday:
      return 'Sunday';
    default:
      return '';
  }
}

String getWeekDayStringShortened(int weekDay) {
  switch (weekDay) {
    case DateTime.monday:
      return 'Mon';
    case DateTime.tuesday:
      return 'Tue';
    case DateTime.wednesday:
      return 'Wed';
    case DateTime.thursday:
      return 'Thu';
    case DateTime.friday:
      return 'Fri';
    case DateTime.saturday:
      return 'Sat';
    case DateTime.sunday:
      return 'Sun';
    default:
      return '';
  }
}

String getMonthString(int month) {
  switch (month) {
    case DateTime.january:
      return 'Jan';
    case DateTime.february:
      return 'Feb';
    case DateTime.march:
      return 'Mar';
    case DateTime.april:
      return 'Apr';
    case DateTime.may:
      return 'May';
    case DateTime.june:
      return 'Jun';
    case DateTime.july:
      return 'Jul';
    case DateTime.august:
      return 'Aug';
    case DateTime.september:
      return 'Sep';
    case DateTime.october:
      return 'Oct';
    case DateTime.november:
      return 'Nov';
    case DateTime.december:
      return 'Dec';
    default:
      return '';
  }
}

String getTimeLeft(String time) {
  var now = DateTime.now();
  var dayLeft = DateTime.parse(time).day - DateTime.parse(now.toString()).day;
  var hourLeft =
      DateTime.parse(time).hour - DateTime.parse(now.toString()).hour;
  if (dayLeft > 0) {
    return "$dayLeft days left";
  } else {
    if (hourLeft > 0) {
      return "$hourLeft hours left";
    } else {
      return "Expiring soon";
    }
  }
}

Color getColorLeft(String time) {
  var now = DateTime.now();
  var dayLeft = DateTime.parse(time).day - DateTime.parse(now.toString()).day;
  var hourLeft =
      DateTime.parse(time).hour - DateTime.parse(now.toString()).hour;
  if (dayLeft > 0) {
    return Colors.blue;
  } else {
    if (hourLeft > 0) {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }
}

String getDiffStartEndTime(
    int startHour, int startMinute, int endHour, int endMinute) {
  if (endMinute < startMinute) {
    return "${endHour - startHour - 1}h ${60 - startMinute + endMinute}0m";
  } else {
    return "${endHour - startHour}h ${endMinute - startMinute}0m";
  }
}

String getUrlImageClass(int typeClass) {
  if (typeClass == 1)
    return 'assets/icons/listen.png';
  else if (typeClass == 2)
    return 'assets/icons/read.png';
  else if (typeClass == 3)
    return 'assets/icons/speak.png';
  else
    return 'assets/icons/write.png';
}

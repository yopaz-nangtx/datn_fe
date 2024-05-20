import 'package:flutter/material.dart';

const urlBase = 'http://127.0.0.1:8000';
const urlLogin = '$urlBase/api/login'; // api login
const urlUser = '$urlBase/api/user'; // api get user
const urlLogout = '$urlBase/api/user/logout'; // api logout
const urlLesson = '$urlBase/api/class/lesson'; // api post lesson
const urlLessonSelectedDate =
    '$urlBase/api/class/lesson_schedule_task'; // api post lesson
const urlTask = '$urlBase/api/class/task';
// api get

//api get class List
const urlGetClassList = '$urlBase/api/class/list';

//api getClassDetail

const urlGetClassDetial = '$urlBase/api/class/detail';

//api get List HomeWok

const urlGetListHomeWork = '$urlBase/api/homework/lists';

//api get List question homeWork
const urlGetQuestionHomeWork = '$urlBase/api/homework/questions';
//api get list Leave Apply
const urlGetClassLeaveApply = '$urlBase/api/attendance/lists';

// api get list leaveA Apply info

const urlGetListClassLeaeveApplyInfo = '$urlBase/api/attendance/info_classes';

// api Store Attendance

const urlPostStoreAttendance = '$urlBase/api/attendance/store';

//api get teacher list
const urlGetTeacherList = '$urlBase/api/teacher/lists';

//api post homework result store

const urlPostHomeWorkResultStore = '$urlBase/api/homework/result/store';

// api post change-info
const urlPostChangeInfor = '$urlBase/api/user/change-info';

// api post change pass
const urlPostChangePass = '$urlBase/api/user/change-pass';

import 'dart:convert';
import 'package:datn_test/constants/app_colors.dart';
import 'package:datn_test/constants/constants.dart';
import 'package:datn_test/constants/dart_notification_center.dart';
import 'package:datn_test/model/asignment.dart';
import 'package:datn_test/model/class.dart';
import 'package:datn_test/model/homework.dart';
import 'package:datn_test/model/leave_apply.dart';
import 'package:datn_test/model/teacher.dart';
import 'package:datn_test/model/user.dart';
import 'package:datn_test/navigator.dart';
import 'package:datn_test/screens/home_screen_item/leave_apply.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:datn_test/globals.dart' as globals;
import '../../constants/route.dart';
import '../../constants/time.dart';
import '../../globals.dart';
import '../../widgets/home_item.dart';

var lessonData;
var taskData;

Future<void> validateAndSubmit(
    String email, String password, BuildContext context) async {
  var response = await http.post(
    Uri.parse(urlLogin),
    body: {
      'email': email,
      'password': password,
    },
  );
  var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  try {
    if (response.statusCode == 200) {
      globals.accessToken = jsonResponse["access_token"];
      globals.tokenType = jsonResponse["type_token"];

      print('token: $jsonResponse["access_token"]');

      // get lesson data today
      response = await http.get(
        Uri.parse(urlLesson),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${globals.accessToken}',
        },
      );

      if (response.statusCode == 200) {
        lessonData = jsonDecode(response.body);
        for (int i = 0; i < lessonData.length; i++) {
          for (var j = 0; j < lessonData[i]['lessons'].length; j++) {
            lessonHomes.add(buildClassItem(
                context,
                DateTime.parse(lessonData[i]['lessons'][j]['start_time'])
                        .hour
                        .toString() +
                    ":" +
                    DateTime.parse(lessonData[i]['lessons'][j]['start_time'])
                        .minute
                        .toString(),
                DateTime.parse(lessonData[i]['lessons'][j]['start_time']).hour <
                    12,
                lessonData[i]['name'] +
                    " (" +
                    lessonData[i]['lessons'][j]['lesson_name'] +
                    ")",
                lessonData[i]['room']['name'],
                lessonData[i]['teacher']['name']));
          }
        }
      }

      // Get task today
      response = await http.get(
        Uri.parse(urlTask),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${globals.accessToken}',
        },
      );

      if (response.statusCode == 200) {
        taskData = jsonDecode(response.body);
        print(taskData.length);
        for (int i = 0; i < taskData.length; i++) {
          for (var j = 0; j < taskData[i]['homeworks'].length; j++) {
            taskItems.add(buildTaskItem(
                "Homework",
                getTimeLeft(taskData[i]['homeworks'][j]['end_time']),
                taskData[i]['name'],
                taskData[i]['homeworks'][j]['homework_name'],
                getColorLeft(taskData[i]['homeworks'][j]['end_time']),
                true));
            homeworks.add(Homework(
              id: taskData[i]['homeworks'][j]['id'],
              assignmentName: taskData[i]['homeworks'][j]['homework_name'],
              teacher: taskData[i]['teacher']['name'],
              nameClass: taskData[i]['name'],
              dueDate: taskData[i]['homeworks'][j]['end_time'],
              time: taskData[i]['homeworks'][j]['time'],
              imageUrl: getUrlImageClass(taskData[i]['type'] ?? 1),
            ));
          }
        }
      }

      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigatorPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'Invalid email or password',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
        )),
      );
    }
  } catch (e) {
    throw (e);
  }
}

Future<User?> getUserInfor() async {
  try {
    var response = await http.get(
      Uri.parse(urlUser),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
    );
    print(response);
    if (response.statusCode == 200) {
      var data = User.fromJson(jsonDecode(response.body)["data"]);
      globals.userId = data.id!;
      globals.fullName = data.name!;
      globals.email = data.email!;
      globals.phoneNumber = data.phoneNumber!;
      globals.address = data.address!;


      return data;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    throw (e);
  }
}

Future<List<ClassList>> getClassList() async {
  try {
    var response = await http.get(
      Uri.parse(urlGetClassList),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      print(parseClassList(response.body));
      return parseClassList(response.body);
    } else {
      return [];
    }
  } catch (e) {
    throw (e);
  }
}

Future<List<ClassList>> getClassDetail(int id) async {
  try {
    var response = await http.get(
      Uri.parse("$urlGetClassDetial/$id"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return parseClassList(response.body);
    } else {
      return [];
    }
  } catch (e) {
    throw (e);
  }
}

Future<List<HomeWork>> getListHomeWork() async {
  try {
    var response = await http.get(
      Uri.parse("$urlGetListHomeWork"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return parseHomeWorkList(response.body);
    } else {
      return [];
    }
  } catch (e) {
    throw (e);
  }
}

Future<List<Question>> getListQuestion(int id) async {
  try {
    var response = await http.get(
      Uri.parse("$urlGetQuestionHomeWork/$id"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return parseQuestionList(response.body);
    } else {
      return [];
    }
  } catch (e) {
    throw (e);
  }
}

Future<List<LeaveApplyModel>> getLeaveApply() async {
  try {
    var response = await http.get(
      Uri.parse("$urlGetClassLeaveApply"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return parseLeaveApplyList(response.body);
    } else {
      return [];
    }
  } catch (e) {
    throw (e);
  }
}

Future<List<ClassList>> getLeaveApplyList() async {
  try {
    var response = await http.get(
      Uri.parse(urlGetListClassLeaeveApplyInfo),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return parseClassList(response.body);
    } else {
      return [];
    }
  } catch (e) {
    throw (e);
  }
}

Future<bool> postAttendanceStore(
    String studentId, String lessonId, String reason) async {
  try {
    var url = Uri.parse(urlPostStoreAttendance);
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${globals.accessToken}',
    };
    var formData = http.MultipartRequest('POST', url);
    formData.fields.addAll(
        {'student_id': studentId, 'lesson_id': lessonId, 'reason': reason});

    formData.headers.addAll(headers);
    var response = await formData.send();
    print(response);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    throw (e);
  }
}

Future<List<TeacherList>> getTeacherList() async {
  try {
    var response = await http.get(
      Uri.parse(urlGetTeacherList),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return parseTeacherList(response.body);
    } else {
      return [];
    }
  } catch (e) {
    throw (e);
  }
}

Future<bool> postHomeWorkResultStore(String studentId, String homeworkId,
    String countCorrect, String countQuestion) async {
  try {
    var url = Uri.parse(urlPostHomeWorkResultStore);
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${globals.accessToken}',
    };
    var formData = http.MultipartRequest('POST', url);
    formData.fields.addAll({
      'student_id': studentId,
      'homework_id': homeworkId,
      'count_correct': countCorrect,
      'count_question': countQuestion
    });

    formData.headers.addAll(headers);
    var response = await formData.send();
    if (response.statusCode == 201) {
      print("Tesst log post homework");
      DartNotificationCenter.post(
          channel: Const.LOAD_LIST_HOMEWORK, options: {});
      return true;
    } else {
      return false;
    }
  } catch (e) {
    throw (e);
  }
}

Future<int> postUserChangeInfo(String name, String PhoneNumber, String email, String address) async {
  try {
    var url = Uri.parse(urlPostChangeInfor);
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${globals.accessToken}',
    };
    var formData = http.MultipartRequest('POST', url);
    formData.fields.addAll({
      'name': name,
      'phone_number': PhoneNumber,
      'email': email,
      'address': address,
    });
    formData.headers.addAll(headers);
    var response = await formData.send();
    if (response.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  } catch (e) {
    throw (e);
  }
}

Future<int> postUserChangePass(
    String oldPass, String newPass, String confirmNewPass) async {
  try {
    var url = Uri.parse(urlPostChangePass);
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${globals.accessToken}',
    };
    var formData = http.MultipartRequest('POST', url);
    formData.fields.addAll({
      'password': oldPass,
      'new_password': newPass,
      'confirm_password': confirmNewPass,
    });
    formData.headers.addAll(headers);
    var response = await formData.send();
    if (response.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  } catch (e) {
    throw (e);
  }
}

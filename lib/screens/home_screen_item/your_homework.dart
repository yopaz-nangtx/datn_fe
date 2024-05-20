import 'package:datn_test/constants/app_colors.dart';
import 'package:datn_test/constants/dart_notification_center.dart';
import 'package:datn_test/globals.dart';
import 'package:datn_test/model/homework.dart';
import 'package:datn_test/screens/login/login_api.dart';
import 'package:datn_test/widgets/homework_item.dart';
import 'package:flutter/material.dart';

class YourHomework extends StatefulWidget {
  YourHomework({Key? key}) : super(key: key);

  @override
  State<YourHomework> createState() => _YourHomeworkState();
}

class _YourHomeworkState extends State<YourHomework> {
  List<HomeWork> homework = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    DartNotificationCenter.subscribe(
      channel: Const.LOAD_LIST_HOMEWORK,
      observer: this,
      onNotification: (options) {
        loadData();
      },
    );
  }

  loadData() async {
    homework = await getListHomeWork();
    print("homeword123");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Your Homeworks',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: homework.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.only(left: 16, right: 16),
              itemCount: homework.length,
              itemBuilder: (context, index) {
                return HomeworkListItem(
                  hwInfo: homework[index],
                  index: index + 1,
                );
              },
            ),
    );
  }
}

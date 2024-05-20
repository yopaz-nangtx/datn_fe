import 'package:datn_test/screens/login/login_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/constants/ui_constants.dart';

import '../../model/class.dart';
import '../../widgets/class_item.dart';

class YourClass extends StatefulWidget {
  YourClass({Key? key}) : super(key: key);

  @override
  State<YourClass> createState() => _YourClassState();
}

class _YourClassState extends State<YourClass> {
  List<ClassList> classList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    classList = await getClassList() as List<ClassList>;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Your Classes',
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
      body: classList!.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16, right: 16),
                itemCount: classList!.length,
                itemBuilder: (context, index) {
                  return ClassListItem(
                    classInfo: classList![index],
                    checkPage: true,
                    index: index + 1,
                  );
                },
              ),
            ),
    );
  }
}

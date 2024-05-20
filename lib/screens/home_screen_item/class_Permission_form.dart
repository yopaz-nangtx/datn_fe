import 'package:datn_test/model/class.dart';
import 'package:datn_test/screens/login/login_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/globals.dart' as globals;
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PermissionForm extends StatefulWidget {
  const PermissionForm({
    super.key,
  });

  @override
  State<PermissionForm> createState() => _PermissionFormState();
}

class _PermissionFormState extends State<PermissionForm> {
  TextEditingController firstAndLastNameVC = TextEditingController(text: '');
  TextEditingController nameOfSubjectVC = TextEditingController(text: '');
  TextEditingController nameOfInstructorVC = TextEditingController(text: '');
  // TextEditingController dateOfTimeVC = TextEditingController(text: '');
  TextEditingController reasonPleaseThink = TextEditingController(text: '');
  int? id;
  List<ClassList> leaveApplyList = [];
  ClassList? inputClassList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstAndLastNameVC.text = globals.fullName;
    loadData();
  }

  loadData() async {
    leaveApplyList = await getLeaveApplyList();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    firstAndLastNameVC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Permisson Form',
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Text("First and last name",
                    style: TextStyle(fontSize: 16.0, color: Colors.black)),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  // initialValue: firstAndLastNameVC.text,
                  readOnly: true,
                  enabled:
                      false, // Đặt readOnly thành true để ngăn người dùng chỉnh sửa
                  decoration: InputDecoration(
                      hintText: firstAndLastNameVC.text,
                      // labelText: firstAndLastNameVC.text,
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Class name",
                    style: TextStyle(fontSize: 16.0, color: Colors.black)),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    final data = await showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Class list",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 0.5,
                              color: Color(0xffDCDCDC),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: leaveApplyList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () async {
                                        Navigator.pop(
                                            context, leaveApplyList[index]);
                                        setState(() {
                                          nameOfSubjectVC.text =
                                              leaveApplyList[index].name!;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 16,
                                            bottom: 16,
                                            right: 16,
                                            top: 8),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color(0xffDCDCDC),
                                                    width: 0.5))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${index + 1}. ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  leaveApplyList[index].name!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      leaveApplyList[index]
                                                              .teacher!
                                                              .name ??
                                                          '',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      },
                    );
                    if (data != null) {
                      print(data);
                      setState(() {
                        inputClassList = data;
                      });
                    }
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      TextFormField(
                        cursorColor: Colors.black,
                        readOnly: true,
                        enabled: false,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: nameOfSubjectVC.text,
                            border: OutlineInputBorder()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Căn các phần tử vào giữa
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Căn theo trục chính
                        children: [
                          Spacer(), // Dùng Spacer để đẩy Icon về phía bên phải
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                inputClassList == null
                    ? SizedBox()
                    : Text("Name of the lesson",
                        style: TextStyle(fontSize: 16.0, color: Colors.black)),
                inputClassList == null
                    ? SizedBox()
                    : SizedBox(
                        height: 15,
                      ),
                inputClassList == null
                    ? SizedBox()
                    : GestureDetector(
                        onTap: () {
                          _showLessonsBottomSheet(context, inputClassList!);
                        },
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            TextFormField(
                              cursorColor: Colors.black,
                              readOnly: true,
                              enabled: false,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.black),
                                  hintText: nameOfInstructorVC.text,
                                  border: OutlineInputBorder()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Căn các phần tử vào giữa
                              crossAxisAlignment: CrossAxisAlignment
                                  .center, // Căn theo trục chính
                              children: [
                                Spacer(), // Dùng Spacer để đẩy Icon về phía bên phải
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ],
                        ),
                      ),
                inputClassList == null
                    ? SizedBox()
                    : SizedBox(
                        height: 20,
                      ),
                Text("Reason please think"),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  controller: reasonPleaseThink,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    alignLabelWithHint: true,
                    labelText: 'Please enter a reason',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black), // Màu viền khi không focus
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black), // Màu viền khi focus
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SafeArea(
              child: GestureDetector(
            onTap: () {
              submit();
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Center(
                  child: Text(
                "Submit",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              )),
            ),
          ))
        ],
      ),
    );
  }

  void _showLessonsBottomSheet(BuildContext context, ClassList data) {
    List<Lessons> lessons = data.lessons!;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(left: 16, bottom: 16, right: 16, top: 8),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("Lesson list",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 0.5,
                color: Color(0xffDCDCDC),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    final lesson = lessons[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          nameOfInstructorVC.text = lesson.lessonName!;
                          id = lesson.id;
                        });
                        Navigator.pop(context, lesson.id);
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xffDCDCDC), width: 0.5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}. ",
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
                                  lesson.lessonName! ?? '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void submit() async {
    if (reasonPleaseThink.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Reason is not allowed to be empty"),
        ),
      );
      return;
    }
    try {
      await postAttendanceStore(
          globals.userId.toString(), id!.toString(), reasonPleaseThink.text);
      Navigator.pop(context);
    } catch (e) {
      throw (e);
    }
  }
}

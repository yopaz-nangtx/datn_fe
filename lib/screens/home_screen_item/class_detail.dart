import 'package:datn_test/model/class.dart';
import 'package:datn_test/screens/home_screen_item/pdf_view.dart';
import 'package:datn_test/screens/login/login_api.dart';
import 'package:flutter/material.dart';

class ClassDetailPage extends StatefulWidget {
  final int classId;
  final bool checkPage;
  ClassDetailPage({Key? key, required this.classId, required this.checkPage})
      : super(key: key);

  @override
  State<ClassDetailPage> createState() => _ClassDetailPageState();
}

class _ClassDetailPageState extends State<ClassDetailPage> {
  List<ClassList> classListDetail = [];
  List<Lessons> lessons = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    classListDetail = await getClassDetail(widget.classId);
    if (classListDetail.length != 0) {
      lessons = classListDetail[0].lessons!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return classListDetail.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('Your Classes Detail',
                  style: TextStyle(color: Colors.white)),
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
            body: ListView.builder(
                itemCount: lessons.length,
                padding: EdgeInsets.only(left: 16, right: 16),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
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
                                  lessons[index].lessonName![0].toUpperCase() +
                                      lessons[index].lessonName!.substring(1),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
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
                                          fontSize: 16.0, color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${classListDetail[0].teacher!.name}",
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                classListDetail[0].schedule == null
                                    ? SizedBox()
                                    : Text(
                                        "Schedule: ${classListDetail[0].schedule}",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black)),
                                classListDetail[0].schedule == null
                                    ? SizedBox()
                                    : SizedBox(
                                        height: 5,
                                      ),
                                Text(
                                  "Lesson: ${index + 1}",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        "Start Time: " +
                                            "${lessons[index].startTime}",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                widget.checkPage == true
                                    ? lessons[index].documents!.length != 0
                                        ? GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PdfViewController(
                                                          url:
                                                              '${lessons[index].documents![0].linkUrl}',
                                                          title:
                                                              '${lessons[index].documents![0].name ?? "Document"} ',
                                                        )),
                                              );
                                            },
                                            child: Text(
                                              "Documents After Class",
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .underline, // Thêm gạch chân
                                                  decorationColor: Colors
                                                      .blue, // Màu của gạch chân
                                                  decorationThickness: 2, // Đ

                                                  fontSize: 16.0,
                                                  color: Colors.black),
                                            ),
                                          )
                                        : SizedBox()
                                    // Text(
                                    //     "Documents After Class",
                                    //     style: TextStyle(
                                    //       fontSize: 16.0,
                                    //       color: Colors.black,
                                    //       // Độ dày của gạch chân
                                    //     ),
                                    //   )
                                    : SizedBox()
                              ],
                            ),
                          ],
                        ),
                      ),
                      lessons[index].attendenceStatus != null
                          ? Positioned.fill(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width:
                                        15, // Điều chỉnh kích thước của checkbox
                                    height: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                  )),
                            )
                          : SizedBox()
                    ],
                  );
                }));
  }
}

import 'package:datn_test/constants/app_colors.dart';
import 'package:datn_test/constants/constants.dart';
import 'package:datn_test/constants/time.dart';
import 'package:datn_test/model/user.dart';
import 'package:datn_test/screens/home_screen_item/FUNCTIONS.dart';
import 'package:datn_test/screens/login/login_api.dart';
import 'package:datn_test/widgets/home_item.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/globals.dart' as globals;

import '../../globals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    if (globals.accessToken != "") {
      user = await getUserInfor();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFD4E7FE),
                          Color(0xFFF0F0F0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.6, 0.3])),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.2),
                                blurRadius: 12,
                                spreadRadius: 8,
                              )
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/icons/avatar.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi " + "${user!.name ?? ''}",
                              style: TextStyle(
                                fontSize: fontSizeText * 1.2,
                                fontWeight: FontWeight.w900,
                                color: Color(0XFF343E87),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Here is a list of schedule",
                              style: TextStyle(
                                fontSize: fontSizeText * 0.95,
                                color: Colors.blueGrey,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "You need to check",
                              style: TextStyle(
                                fontSize: fontSizeText * 0.95,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 185,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height - 245,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      buildTitleRow("YOUR FUNCTIONS", 4),
                      SizedBox(
                        height: 20,
                      ),
                      MainFunction(),
                      SizedBox(
                        height: 20,
                      ),
                      buildTitleRow("SCHEDULE TODAY", lessonHomes.length),
                      SizedBox(
                        height: 20,
                      ),
                      ...lessonHomes,
                      SizedBox(
                        height: 10,
                      ),
                      buildTitleRow("YOUR TASKS", taskItems.length),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...taskItems,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
  }
}

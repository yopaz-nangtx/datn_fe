import 'package:datn_test/model/leave_apply.dart';
import 'package:flutter/material.dart';

class LeaveApplyItem extends StatelessWidget {
  final LeaveApplyModel data;
  final int index;
  const LeaveApplyItem({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border:
              Border(bottom: BorderSide(color: Color(0xffDCDCDC), width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${index}. ",
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
                'Class Name: ${data.classroom!.name![0].toUpperCase() +
                    data.classroom!.name!.substring(1)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.blue),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Lesson Name: ${data.lessonName![0].toUpperCase() + data.lessonName!.substring(1) ?? ''}',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 70,
                child: Text(
                  "Start time: ${data.lesson!.startTime}",
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 70,
                child: Text(
                  "Reason: ${data.reason![0].toUpperCase() + data.reason!.substring(1)}",
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 70,
                child: Text(
                  "Created at : ${data.createdAt}",
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

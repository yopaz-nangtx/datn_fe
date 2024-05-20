// import 'package:datn_test/constants/ui_constants.dart';
// import 'package:datn_test/widgets/homework_item.dart';
// import 'package:flutter/material.dart';

// import '../../globals.dart';
// import '../../model/homework.dart';

// class ExamSchedule extends StatelessWidget {
//   ExamSchedule({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Exams'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: exams.length,
//         itemBuilder: (context, index) {
//           return HomeworkListItem(hwInfo: exams[index]);
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';

class LeaveApplyModel {
  int? id;
  int? lessonId;
  int? studentId;
  String? reason;
  int? status;
  String? lessonName;
  Classroom? classroom;
  Lesson? lesson;

  LeaveApplyModel(
      {this.id,
      this.lessonId,
      this.studentId,
      this.reason,
      this.status,
      this.lessonName,
      this.classroom,
      this.lesson});

  LeaveApplyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lessonId = json['lesson_id'];
    studentId = json['student_id'];
    reason = json['reason'];
    status = json['status'];
    lessonName = json['lesson_name'];
    classroom = json['class_name'] != null
        ? new Classroom.fromJson(json['class_name'])
        : null;
    lesson =
        json['lesson'] != null ? new Lesson.fromJson(json['lesson']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lesson_id'] = this.lessonId;
    data['student_id'] = this.studentId;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['lesson_name'] = this.lessonName;
    if (this.classroom != null) {
      data['class_name'] = this.classroom!.toJson();
    }
    if (this.lesson != null) {
      data['lesson'] = this.lesson!.toJson();
    }
    return data;
  }
}

class Classroom {
  int? id;
  String? name;
  Null? imageUrl;
  Null? schedule;
  int? teacherId;
  int? roomId;
  String? createdAt;
  String? updatedAt;

  Classroom(
      {this.id,
      this.name,
      this.imageUrl,
      this.schedule,
      this.teacherId,
      this.roomId,
      this.createdAt,
      this.updatedAt});

  Classroom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    schedule = json['schedule'];
    teacherId = json['teacher_id'];
    roomId = json['room_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['schedule'] = this.schedule;
    data['teacher_id'] = this.teacherId;
    data['room_id'] = this.roomId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Lesson {
  int? id;
  int? classroomId;
  String? lessonName;
  String? startTime;
  String? endTime;
  int? isFinished;
  String? createdAt;
  String? updatedAt;
  Classroom? classroom;

  Lesson(
      {this.id,
      this.classroomId,
      this.lessonName,
      this.startTime,
      this.endTime,
      this.isFinished,
      this.createdAt,
      this.updatedAt,
      this.classroom});

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classroomId = json['classroom_id'];
    lessonName = json['lesson_name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isFinished = json['is_finished'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    classroom = json['classroom'] != null
        ? new Classroom.fromJson(json['classroom'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classroom_id'] = this.classroomId;
    data['lesson_name'] = this.lessonName;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_finished'] = this.isFinished;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.classroom != null) {
      data['classroom'] = this.classroom!.toJson();
    }
    return data;
  }
}

List<LeaveApplyModel> parseLeaveApplyList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<LeaveApplyModel>((json) => LeaveApplyModel.fromJson(json))
      .toList();
}

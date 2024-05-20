import 'dart:convert';

class Homework {
  final int? id;
  final String? assignmentName;
  final String? nameClass;
  final String? teacher;
  final String? dueDate;
  final int? time;
  final String? imageUrl;

  Homework({
    this.id,
    this.assignmentName,
    this.teacher,
    this.nameClass,
    this.dueDate,
    this.time,
    this.imageUrl,
  });
}

class HomeWork {
  int? id;
  int? classroomId;
  int? time;
  String? endTime;
  String? teacher;
  String? nameClass;
  String? assignmentName;
  Classroom? classroom;
  dynamic? score;
  int? countQuestion;
  int? isFinished;

  HomeWork(
      {this.id,
      this.classroomId,
      this.time,
      this.endTime,
      this.teacher,
      this.nameClass,
      this.assignmentName,
      this.classroom,
      this.countQuestion,
      this.isFinished,
      this.score});

  HomeWork.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classroomId = json['classroom_id'];
    time = json['time'];
    endTime = json['end_time'];
    teacher = json['teacher'];
    nameClass = json['nameClass'];
    assignmentName = json['assignmentName'];
    classroom = json['classroom'] != null
        ? new Classroom.fromJson(json['classroom'])
        : null;
    countQuestion = json['count_question'];
    isFinished = json['is_finished'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classroom_id'] = this.classroomId;
    data['time'] = this.time;
    data['end_time'] = this.endTime;
    data['teacher'] = this.teacher;
    data['nameClass'] = this.nameClass;
    data['assignmentName'] = this.assignmentName;
    if (this.classroom != null) {
      data['classroom'] = this.classroom!.toJson();
    }
    data['count_question'] = this.countQuestion;
    data['is_finished'] = this.isFinished;
    data['score'] = this.score;
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
  Teacher? teacher;

  Classroom(
      {this.id,
      this.name,
      this.imageUrl,
      this.schedule,
      this.teacherId,
      this.roomId,
      this.createdAt,
      this.updatedAt,
      this.teacher});

  Classroom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    schedule = json['schedule'];
    teacherId = json['teacher_id'];
    roomId = json['room_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
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
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    return data;
  }
}

class Teacher {
  int? id;
  String? username;
  String? name;
  String? email;
  String? phoneNumber;
  int? role;
  Null? phone;
  Null? location;
  Null? about;
  String? createdAt;
  String? updatedAt;

  Teacher(
      {this.id,
      this.username,
      this.name,
      this.email,
      this.phoneNumber,
      this.role,
      this.phone,
      this.location,
      this.about,
      this.createdAt,
      this.updatedAt});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    role = json['role'];
    phone = json['phone'];
    location = json['location'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['about'] = this.about;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

List<HomeWork> parseHomeWorkList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<HomeWork>((json) => HomeWork.fromJson(json)).toList();
}

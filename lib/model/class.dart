import 'dart:convert';

// class Class {
//   final int id;
//   final String name;
//   final String teacher;
//   final int sessions;
//   final String schedule;
//   final String imageUrl;
//   final int? attendenceStatus;
//   final int? numberOfLessonsStudied;
//   final String? document;

//   Class(
//       {required this.id,
//       required this.name,
//       required this.teacher,
//       required this.sessions,
//       required this.schedule,
//       required this.imageUrl,
//       this.attendenceStatus,
//       this.numberOfLessonsStudied,
//       this.document});
// }

// class ClassDetail {
//   List<Class>? classDetail;
//   ClassDetail({this.classDetail});
// }

class ClassList {
  int? id;
  String? name;
  String? imageUrl;
  String? schedule;
  int? teacherId;
  int? roomId;
  int? countLessons;
  int? numberOfLessonsStudied;
  List<Lessons>? lessons;
  Room? room;
  Teacher? teacher;
  String? createdAt;
  String? updatedAt;

  ClassList(
      {this.id,
      this.name,
      this.imageUrl,
      this.schedule,
      this.teacherId,
      this.roomId,
      this.countLessons,
      this.numberOfLessonsStudied,
      this.lessons,
      this.room,
      this.teacher,
      this.createdAt,
      this.updatedAt});

  ClassList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    schedule = json['schedule'];
    teacherId = json['teacher_id'];
    roomId = json['room_id'];
    countLessons = json['countLessons'];
    numberOfLessonsStudied = json['numberOfLessonsStudied'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
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
    data['countLessons'] = this.countLessons;
    data['numberOfLessonsStudied'] = this.numberOfLessonsStudied;
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Lessons {
  int? id;
  int? classroomId;
  String? lessonName;
  String? startTime;
  String? endTime;
  int? isFinished;
  String? createdAt;
  String? updatedAt;
  int? attendenceStatus;
  List<Documents>? documents;

  Lessons(
      {this.id,
      this.classroomId,
      this.lessonName,
      this.startTime,
      this.endTime,
      this.isFinished,
      this.createdAt,
      this.updatedAt,
      this.attendenceStatus,
      this.documents});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classroomId = json['classroom_id'];
    lessonName = json['lesson_name'];
    startTime = json['startt_time'];
    endTime = json['end_time'];
    isFinished = json['is_finished'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    attendenceStatus = json['attendenceStatus'];
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(new Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classroom_id'] = this.classroomId;
    data['lesson_name'] = this.lessonName;
    data['startt_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_finished'] = this.isFinished;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['attendenceStatus'] = this.attendenceStatus;
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  int? id;
  Null? name;
  String? linkUrl;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Documents(
      {this.id,
      this.name,
      this.linkUrl,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    linkUrl = json['link_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link_url'] = this.linkUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? lessonId;
  int? documentId;

  Pivot({this.lessonId, this.documentId});

  Pivot.fromJson(Map<String, dynamic> json) {
    lessonId = json['lesson_id'];
    documentId = json['document_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lesson_id'] = this.lessonId;
    data['document_id'] = this.documentId;
    return data;
  }
}

class Room {
  int? id;
  String? name;
  Null? createdAt;
  Null? updatedAt;

  Room({this.id, this.name, this.createdAt, this.updatedAt});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

List<ClassList> parseClassList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ClassList>((json) => ClassList.fromJson(json)).toList();
}

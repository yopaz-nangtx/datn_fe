import 'dart:convert';

void add_answers(bool i) {
  Answers.add(i);
}

void clear_answers() {
  Answers.clear();
}

List<bool> Answers = [];

class Question {
  int? id;
  int? homeworkId;
  int? examId;
  String? question;
  String? answer;
  List<String>? option;

  Question(
      {this.id,
      this.homeworkId,
      this.examId,
      this.question,
      this.answer,
      this.option});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeworkId = json['homework_id'];
    examId = json['exam_id'];
    question = json['question'];
    answer = json['answer'];
    option = json['option'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['homework_id'] = this.homeworkId;
    data['exam_id'] = this.examId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['option'] = this.option;
    return data;
  }
}

List<Question> parseQuestionList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Question>((json) => Question.fromJson(json)).toList();
}

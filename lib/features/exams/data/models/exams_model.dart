class ExamsModel {
  List<ExamItem>? data;
  List<String>? message;
  int? status;

  ExamsModel({this.data, this.message, this.status});

  ExamsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ExamItem>[];
      json['data'].forEach((v) {
        data!.add(ExamItem.fromJson(v));
      });
    }
    message = json['message'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class ExamItem {
  int? id;
  int? degreeOfExam;
  int? degreeOfStudent;
  Category? category;
  Teacher? teacher;

  ExamItem(
      {this.id,
      this.degreeOfExam,
      this.degreeOfStudent,
      this.category,
      this.teacher});

  ExamItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    degreeOfExam = json['degree_of_exam'];
    degreeOfStudent = json['degree_of_student'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    teacher =
        json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['degree_of_exam'] = degreeOfExam;
    data['degree_of_student'] = degreeOfStudent;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? title;

  Category({this.id, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class Teacher {
  int? id;
  String? name;

  Teacher({this.id, this.name});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

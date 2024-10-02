class ExamsModel {
  List<ExamItem>? data;
  List<String>? message;
  int? status;

  ExamsModel({this.data, this.message, this.status});

  ExamsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ExamItem>[];
      json['data'].forEach((v) {
        data!.add(new ExamItem.fromJson(v));
      });
    }
    message = json['message'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
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
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['degree_of_exam'] = this.degreeOfExam;
    data['degree_of_student'] = this.degreeOfStudent;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

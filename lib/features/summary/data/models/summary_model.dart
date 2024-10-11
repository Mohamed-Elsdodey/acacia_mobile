class SummaryModel {
  SummaryData? data;
  List<String>? message;
  int? status;

  SummaryModel({this.data, this.message, this.status});

  SummaryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? SummaryData.fromJson(json['data']) : null;
    message = json['message'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class SummaryData {
  String? percentage;
  String? percentageTitle;
  List<Exams>? exams;

  SummaryData({this.percentage, this.percentageTitle, this.exams});

  SummaryData.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage'];
    percentageTitle = json['percentage_title'];
    if (json['exams'] != null) {
      exams = <Exams>[];
      json['exams'].forEach((v) {
        exams!.add(Exams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['percentage'] = percentage;
    data['percentage_title'] = percentageTitle;
    if (exams != null) {
      data['exams'] = exams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exams {
  int? id;
  int? degreeOfExam;
  int? degreeOfStudent;
  String? categoryName;
  String? percentage;
  String? percentageTitle;

  Exams(
      {this.id,
      this.degreeOfExam,
      this.degreeOfStudent,
      this.categoryName,
      this.percentage,
      this.percentageTitle});

  Exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    degreeOfExam = json['degree_of_exam'];
    degreeOfStudent = json['degree_of_student'];
    categoryName = json['category_name'];
    percentage = json['percentage'];
    percentageTitle = json['percentage_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['degree_of_exam'] = degreeOfExam;
    data['degree_of_student'] = degreeOfStudent;
    data['category_name'] = categoryName;
    data['percentage'] = percentage;
    data['percentage_title'] = percentageTitle;
    return data;
  }
}

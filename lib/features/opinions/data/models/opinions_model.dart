class OpinionsModel {
  List<OpinionData>? data;
  List<String>? message;
  int? status;

  OpinionsModel({this.data, this.message, this.status});

  OpinionsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OpinionData>[];
      json['data'].forEach((v) {
        data!.add(OpinionData.fromJson(v));
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

class OpinionData {
  int? id;
  String? title;
  String? studentPerformanceEvaluation;

  OpinionData({this.id, this.title, this.studentPerformanceEvaluation});

  OpinionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    studentPerformanceEvaluation = json['student_performance_evaluation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['student_performance_evaluation'] = studentPerformanceEvaluation;
    return data;
  }
}

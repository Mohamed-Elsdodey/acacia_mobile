class SubjectReportModel {
  List<DataSubject>? data;
  List<String>? message;
  int? status;

  SubjectReportModel({this.data, this.message, this.status});

  SubjectReportModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataSubject>[];
      json['data'].forEach((v) {
        data!.add(DataSubject.fromJson(v));
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

class DataSubject {
  int? id;
  String? title;
  int? monthPercentage;
  int? allPerentage;

  DataSubject({this.id, this.title, this.monthPercentage, this.allPerentage});

  DataSubject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    monthPercentage = json['month_percentage'];
    allPerentage = json['all_perentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['month_percentage'] = monthPercentage;
    data['all_perentage'] = allPerentage;
    return data;
  }
}

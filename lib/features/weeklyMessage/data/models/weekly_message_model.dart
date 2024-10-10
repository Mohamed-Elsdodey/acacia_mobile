class WeeklyMessageModel {
  List<WeekData>? data;
  List<String>? message;
  int? status;

  WeeklyMessageModel({this.data, this.message, this.status});

  WeeklyMessageModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <WeekData>[];
      json['data'].forEach((v) {
        data!.add(WeekData.fromJson(v));
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

class WeekData {
  int? id;
  int? degreeOfExam;
  String? slug;
  String? titleAr;
  String? titleEn;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  String? weeklyMessage;

  WeekData(
      {this.id,
      this.degreeOfExam,
      this.slug,
      this.titleAr,
      this.titleEn,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.weeklyMessage});

  WeekData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    degreeOfExam = json['degree_of_exam'];
    slug = json['slug'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    weeklyMessage = json['weekly_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['degree_of_exam'] = degreeOfExam;
    data['slug'] = slug;
    data['title_ar'] = titleAr;
    data['title_en'] = titleEn;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['weekly_message'] = weeklyMessage;
    return data;
  }
}

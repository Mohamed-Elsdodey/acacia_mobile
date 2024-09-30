class AcademicReportModel {
  DataAcademic? data;
  List<String>? message;
  int? status;

  AcademicReportModel({this.data, this.message, this.status});

  AcademicReportModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataAcademic.fromJson(json['data']) : null;
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

class DataAcademic {
  int? monthAcademicPercentage;
  int? allAcademicPercentage;
  int? monthBehavioralPercentage;
  int? allBehavioralPercentage;

  DataAcademic(
      {this.monthAcademicPercentage,
      this.allAcademicPercentage,
      this.monthBehavioralPercentage,
      this.allBehavioralPercentage});

  DataAcademic.fromJson(Map<String, dynamic> json) {
    monthAcademicPercentage = json['month_academic_percentage'];
    allAcademicPercentage = json['all_academic_percentage'];
    monthBehavioralPercentage = json['month_behavioral_percentage'];
    allBehavioralPercentage = json['all_behavioral_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month_academic_percentage'] = monthAcademicPercentage;
    data['all_academic_percentage'] = allAcademicPercentage;
    data['month_behavioral_percentage'] = monthBehavioralPercentage;
    data['all_behavioral_percentage'] = allBehavioralPercentage;
    return data;
  }
}

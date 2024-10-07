class ReportsModel {
  ReportsData? data;
  List<String>? message;
  int? status;

  ReportsModel({this.data, this.message, this.status});

  ReportsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ReportsData.fromJson(json['data']) : null;
    message = json['message'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class ReportsData {
  AcademicReport? academicReport;
  BehavioralReport? behavioralReport;
  List<DescriptiveReports>? descriptiveReports;

  ReportsData({this.academicReport, this.behavioralReport, this.descriptiveReports});

  ReportsData.fromJson(Map<String, dynamic> json) {
    academicReport = json['academic_report'] != null
        ? new AcademicReport.fromJson(json['academic_report'])
        : null;
    behavioralReport = json['behavioral_report'] != null
        ? new BehavioralReport.fromJson(json['behavioral_report'])
        : null;
    if (json['descriptive_reports'] != null) {
      descriptiveReports = <DescriptiveReports>[];
      json['descriptive_reports'].forEach((v) {
        descriptiveReports!.add(new DescriptiveReports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.academicReport != null) {
      data['academic_report'] = this.academicReport!.toJson();
    }
    if (this.behavioralReport != null) {
      data['behavioral_report'] = this.behavioralReport!.toJson();
    }
    if (this.descriptiveReports != null) {
      data['descriptive_reports'] =
          this.descriptiveReports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AcademicReport {
  List<Exams>? exams;
  int? appreciationPercentage;
  String? appreciationTitle;

  AcademicReport(
      {this.exams, this.appreciationPercentage, this.appreciationTitle});

  AcademicReport.fromJson(Map<String, dynamic> json) {
    if (json['exams'] != null) {
      exams = <Exams>[];
      json['exams'].forEach((v) {
        exams!.add(new Exams.fromJson(v));
      });
    }
    appreciationPercentage = json['appreciation_percentage'];
    appreciationTitle = json[r'$appreciation_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exams != null) {
      data['exams'] = this.exams!.map((v) => v.toJson()).toList();
    }
    data['appreciation_percentage'] = this.appreciationPercentage;
    data[r'$appreciation_title'] = this.appreciationTitle;
    return data;
  }
}

class Exams {
  int? id;
  int? degreeOfExam;
  int? degreeOfStudent;
  Category? category;
  Teacher? teacher;

  Exams(
      {this.id,
      this.degreeOfExam,
      this.degreeOfStudent,
      this.category,
      this.teacher});

  Exams.fromJson(Map<String, dynamic> json) {
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

class BehavioralReport {
  int? appreciationPercentage;
  String? appreciationTitle;
  ScrollBehavioralReport? scrollBehavioralReport;

  BehavioralReport(
      {this.appreciationPercentage,
      this.appreciationTitle,
      this.scrollBehavioralReport});

  BehavioralReport.fromJson(Map<String, dynamic> json) {
    appreciationPercentage = json['appreciation_percentage'];
    appreciationTitle = json['appreciation_title'];
    scrollBehavioralReport = json['scroll_behavioral_report'] != null
        ? new ScrollBehavioralReport.fromJson(json['scroll_behavioral_report'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appreciation_percentage'] = this.appreciationPercentage;
    data['appreciation_title'] = this.appreciationTitle;
    if (this.scrollBehavioralReport != null) {
      data['scroll_behavioral_report'] = this.scrollBehavioralReport!.toJson();
    }
    return data;
  }
}

class ScrollBehavioralReport {
  int? numberOfAbsenceDay;
  int? numberOfDelayDay;
  int? positivePoint;
  int? negativePoint;
  int? totalPoint;

  ScrollBehavioralReport(
      {this.numberOfAbsenceDay,
      this.numberOfDelayDay,
      this.positivePoint,
      this.negativePoint,
      this.totalPoint});

  ScrollBehavioralReport.fromJson(Map<String, dynamic> json) {
    numberOfAbsenceDay = json['number_of_absence_day'];
    numberOfDelayDay = json['number_of_delay_day'];
    positivePoint = json['positive_point'];
    negativePoint = json['negative_point'];
    totalPoint = json['total_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number_of_absence_day'] = this.numberOfAbsenceDay;
    data['number_of_delay_day'] = this.numberOfDelayDay;
    data['positive_point'] = this.positivePoint;
    data['negative_point'] = this.negativePoint;
    data['total_point'] = this.totalPoint;
    return data;
  }
}

class DescriptiveReports {
  int? id;
  String? title;
  String? descriptiveReport;

  DescriptiveReports({this.id, this.title, this.descriptiveReport});

  DescriptiveReports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    descriptiveReport = json['descriptive_report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['descriptive_report'] = this.descriptiveReport;
    return data;
  }
}

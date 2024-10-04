class AbsenceModel {
  List<AbsenceItem>? data;
  List<String>? message;
  int? status;

  AbsenceModel({this.data, this.message, this.status});

  AbsenceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AbsenceItem>[];
      json['data'].forEach((v) {
        data!.add(AbsenceItem.fromJson(v));
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

class AbsenceItem {
  int? id;
  String? date;
  String? type;
  int? delayDay;
  int? delayMonth;
  int? absenceDay;
  int? absenceMonth;

  AbsenceItem(
      {this.id,
      this.date,
      this.type,
      this.delayDay,
      this.delayMonth,
      this.absenceDay,
      this.absenceMonth});

  AbsenceItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    type = json['type'];
    delayDay = json['delay_day'];
    delayMonth = json['delay_month'];
    absenceDay = json['absence_day'];
    absenceMonth = json['absence_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['type'] = type;
    data['delay_day'] = delayDay;
    data['delay_month'] = delayMonth;
    data['absence_day'] = absenceDay;
    data['absence_month'] = absenceMonth;
    return data;
  }
}

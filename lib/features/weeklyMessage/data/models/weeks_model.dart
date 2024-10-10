class WeeksModel {
  List<WeekItem>? data;
  List<String>? message;
  int? status;

  WeeksModel({this.data, this.message, this.status});

  WeeksModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <WeekItem>[];
      json['data'].forEach((v) {
        data!.add(WeekItem.fromJson(v));
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

class WeekItem {
  String? title;
  int? weekNumber;
  String? startWeekDate;
  String? endWeekDate;
  int? isCurrent;

  WeekItem(
      {this.title,
      this.weekNumber,
      this.startWeekDate,
      this.endWeekDate,
      this.isCurrent});

  WeekItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    weekNumber = json['week_number'];
    startWeekDate = json['start_week_date'];
    endWeekDate = json['end_week_date'];
    isCurrent = json['is_current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['week_number'] = weekNumber;
    data['start_week_date'] = startWeekDate;
    data['end_week_date'] = endWeekDate;
    data['is_current'] = isCurrent;
    return data;
  }
}

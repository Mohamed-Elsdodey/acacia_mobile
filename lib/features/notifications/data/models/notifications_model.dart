class NotificationsModel {
  List<NotificationItem>? data;
  List<String>? message;
  int? status;

  NotificationsModel({this.data, this.message, this.status});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NotificationItem>[];
      json['data'].forEach((v) {
        data!.add(NotificationItem.fromJson(v));
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

class NotificationItem {
  int? id;
  String? title;
  String? type;
  String? text;
  String? date;
  int? foreignId;
  Student? student;

  NotificationItem(
      {this.id,
      this.title,
      this.type,
      this.text,
      this.date,
      this.foreignId,
      this.student});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    text = json['text'];
    date = json['date'];
    foreignId = json['foreign_id'];
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['text'] = text;
    data['date'] = date;
    data['foreign_id'] = foreignId;
    if (student != null) {
      data['student'] = student!.toJson();
    }
    return data;
  }
}

class Student {
  int? id;
  String? name;
  String? image;
  String? phone;
  int? positivePoint;
  int? negativePoint;
  int? totalPoint;
  int? numberOfViolations;
  int? newNotificationCount;
  int? schoolRank;
  int? rowRank;
  int? roomRank;

  Student(
      {this.id,
      this.name,
      this.image,
      this.phone,
      this.positivePoint,
      this.negativePoint,
      this.totalPoint,
      this.numberOfViolations,
      this.newNotificationCount,
      this.schoolRank,
      this.rowRank,
      this.roomRank});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    positivePoint = json['positive_point'];
    negativePoint = json['negative_point'];
    totalPoint = json['total_point'];
    numberOfViolations = json['number_of_violations'];
    newNotificationCount = json['new_notification_count'];
    schoolRank = json['school_rank'];
    rowRank = json['row_rank'];
    roomRank = json['room_rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['phone'] = phone;
    data['positive_point'] = positivePoint;
    data['negative_point'] = negativePoint;
    data['total_point'] = totalPoint;
    data['number_of_violations'] = numberOfViolations;
    data['new_notification_count'] = newNotificationCount;
    data['school_rank'] = schoolRank;
    data['row_rank'] = rowRank;
    data['room_rank'] = roomRank;
    return data;
  }
}

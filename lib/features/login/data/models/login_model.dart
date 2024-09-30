class LoginModel {
  Data? data;
  List<String>? message;
  int? status;

  LoginModel({this.data, this.message, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? token;
  List<Students>? students;

  Data({this.id, this.name, this.email, this.phone, this.token, this.students});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['token'] = this.token;
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? id;
  String? name;
  String? image;
  String? phone;
  int? positivePoint;
  int? negativePoint;
  int? totalPoint;
  int? numberOfViolations;
  Row? row;
  Row? room;
  int? newNotificationCount;
  int? schoolRank;
  int? rowRank;
  int? roomRank;

  Students(
      {this.id,
      this.name,
      this.image,
      this.phone,
      this.positivePoint,
      this.negativePoint,
      this.totalPoint,
      this.numberOfViolations,
      this.row,
      this.room,
      this.newNotificationCount,
      this.schoolRank,
      this.rowRank,
      this.roomRank});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    positivePoint = json['positive_point'];
    negativePoint = json['negative_point'];
    totalPoint = json['total_point'];
    numberOfViolations = json['number_of_violations'];
    row = json['row'] != null ? new Row.fromJson(json['row']) : null;
    room = json['room'] != null ? new Row.fromJson(json['room']) : null;
    newNotificationCount = json['new_notification_count'];
    schoolRank = json['school_rank'];
    rowRank = json['row_rank'];
    roomRank = json['room_rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['positive_point'] = this.positivePoint;
    data['negative_point'] = this.negativePoint;
    data['total_point'] = this.totalPoint;
    data['number_of_violations'] = this.numberOfViolations;
    if (this.row != null) {
      data['row'] = this.row!.toJson();
    }
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    data['new_notification_count'] = this.newNotificationCount;
    data['school_rank'] = this.schoolRank;
    data['row_rank'] = this.rowRank;
    data['room_rank'] = this.roomRank;
    return data;
  }
}

class Row {
  int? id;
  String? title;

  Row({this.id, this.title});

  Row.fromJson(Map<String, dynamic> json) {
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

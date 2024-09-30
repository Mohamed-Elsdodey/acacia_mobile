class ChildernModel {
  List<DataChildern>? data;
  List<String>? message;
  int? status;

  ChildernModel({this.data, this.message, this.status});

  ChildernModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataChildern>[];
      json['data'].forEach((v) {
        data!.add(DataChildern.fromJson(v));
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

class DataChildern {
  int? id;
  String? name;
  String? image;
  String? phone;
  int? positivePoint;
  int? negativePoint;
  int? totalPoint;
  int? numberOfViolations;
  RowRoom? row;
  RowRoom? room;
  int? newNotificationCount;
  int? schoolRank;
  int? rowRank;
  int? roomRank;

  DataChildern(
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

  DataChildern.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    positivePoint = json['positive_point'];
    negativePoint = json['negative_point'];
    totalPoint = json['total_point'];
    numberOfViolations = json['number_of_violations'];
    row = json['row'] != null ? RowRoom.fromJson(json['row']) : null;
    room = json['room'] != null ? RowRoom.fromJson(json['room']) : null;
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
    if (row != null) {
      data['row'] = row!.toJson();
    }
    if (room != null) {
      data['room'] = room!.toJson();
    }
    data['new_notification_count'] = newNotificationCount;
    data['school_rank'] = schoolRank;
    data['row_rank'] = rowRank;
    data['room_rank'] = roomRank;
    return data;
  }
}

class RowRoom {
  int? id;
  String? title;

  RowRoom({this.id, this.title});

  RowRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

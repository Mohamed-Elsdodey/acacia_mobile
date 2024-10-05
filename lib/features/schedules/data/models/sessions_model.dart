class SessionsModel {
  List<SessionItem>? data;
  List<String>? message;
  int? status;

  SessionsModel({this.data, this.message, this.status});

  SessionsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SessionItem>[];
      json['data'].forEach((v) {
        data!.add(SessionItem.fromJson(v));
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

class SessionItem {
  int? id;
  String? title;

  SessionItem({this.id, this.title});

  SessionItem.fromJson(Map<String, dynamic> json) {
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

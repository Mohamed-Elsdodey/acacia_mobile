class SchedulesModel {
  int? id;
  String? title;
  List<Details>? details;

  SchedulesModel({this.id, this.title, this.details});

  SchedulesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  String? sessionName;
  String? categoryName;

  Details({this.id, this.sessionName, this.categoryName});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionName = json['session_name'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['session_name'] = sessionName;
    data['category_name'] = categoryName;
    return data;
  }
}

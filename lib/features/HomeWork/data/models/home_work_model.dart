
class HomeWorkModel {
  List<Datum>? data;
  List<String>? message;
  int? status;

  HomeWorkModel({
    this.data,
    this.message,
    this.status,
  });

  factory HomeWorkModel.fromJson(Map<String, dynamic> json) => HomeWorkModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"] == null ? [] : List<String>.from(json["message"]!.map((x) => x)),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
    "status": status,
  };
}

class Datum {
  int? id;
  String? title;
  String? homeWork;

  Datum({
    this.id,
    this.title,
    this.homeWork,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    homeWork: json["home_work"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "home_work": homeWork,
  };
}

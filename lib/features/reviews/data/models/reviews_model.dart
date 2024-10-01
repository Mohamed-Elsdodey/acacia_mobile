class ReviewsModel {
  List<ReviewItem>? data;
  List<String>? message;
  int? status;

  ReviewsModel({this.data, this.message, this.status});

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReviewItem>[];
      json['data'].forEach((v) {
        data!.add(ReviewItem.fromJson(v));
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

class ReviewItem {
  int? id;
  String? date;
  String? type;
  int? points;
  Category? category;
  Teacher? teacher;
  int? balance;
  int? totalPoints;
  int? roomRanking;

  ReviewItem(
      {this.id,
      this.date,
      this.type,
      this.points,
      this.category,
      this.teacher,
      this.balance,
      this.totalPoints,
      this.roomRanking});

  ReviewItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    type = json['type'];
    points = json['points'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    teacher =
        json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
    balance = json['balance'];
    totalPoints = json['total_points'];
    roomRanking = json['room_ranking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['type'] = type;
    data['points'] = points;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
    data['balance'] = balance;
    data['total_points'] = totalPoints;
    data['room_ranking'] = roomRanking;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

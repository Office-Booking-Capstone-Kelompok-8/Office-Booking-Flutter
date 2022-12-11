class RatingModel {
  String? id;
  int? rating;
  String? comment;
  String? createdAt;

  RatingModel({this.id, this.rating, this.comment, this.createdAt});

  RatingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rating'] = rating;
    data['comment'] = comment;
    data['createdAt'] = createdAt;
    return data;
  }
}

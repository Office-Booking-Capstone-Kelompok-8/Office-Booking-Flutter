class ReviewModel {
  String? comment;
  int? review;
  String? createdAt;

  ReviewModel(
      {required this.comment, required this.review, required this.createdAt});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    comment = json['message'];
    review = json['rating'];
    createdAt = json['createdAt'];
  }
}

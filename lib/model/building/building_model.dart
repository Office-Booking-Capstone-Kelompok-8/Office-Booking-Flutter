class BuildingModel {
  String? id;
  String? name;
  String? pictures;
  Price? price;
  String? owner;
  Location? location;
  double? rating;
  int? reviewCount;

  BuildingModel({
    this.id,
    this.name,
    this.pictures,
    this.price,
    this.owner,
    this.location,
    this.rating,
    this.reviewCount,
  });

  BuildingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pictures = json['pictures'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    owner = json['owner'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    rating = json['review']['rating'].toDouble();
    reviewCount = json['review']['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['pictures'] = pictures;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['owner'] = owner;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class Price {
  int? annual;
  int? monthly;

  Price({this.annual, this.monthly});

  Price.fromJson(Map<String, dynamic> json) {
    annual = json['annual'];
    monthly = json['monthly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['annual'] = annual;
    data['monthly'] = monthly;
    return data;
  }
}

class Location {
  String? city;
  String? district;

  Location({this.city, this.district});

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['district'] = district;
    return data;
  }
}

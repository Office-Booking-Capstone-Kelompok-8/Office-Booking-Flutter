class BuildingDetailModel {
  String? id;
  String? name;
  List<Pictures>? pictures;
  String? description;
  List<Facilities>? facilities;
  int? capacity;
  int? size;
  Review? review;
  Price? price;
  String? owner;
  Location? location;
  Agent? agent;

  BuildingDetailModel(
      {this.id,
      this.name,
      this.pictures,
      this.description,
      this.facilities,
      this.capacity,
      this.size,
      this.review,
      this.price,
      this.owner,
      this.location,
      this.agent});

  BuildingDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['pictures'] != null) {
      pictures = <Pictures>[];
      json['pictures'].forEach((v) {
        pictures!.add(Pictures.fromJson(v));
      });
    }
    description = json['description'];
    if (json['facilities'] != null) {
      facilities = <Facilities>[];
      json['facilities'].forEach((v) {
        facilities!.add(Facilities.fromJson(v));
      });
    }
    capacity = json['capacity'];
    size = json['size'];
    review = json['review'] != null ? Review.fromJson(json['review']) : null;
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    owner = json['owner'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    agent = json['agent'] != null ? Agent.fromJson(json['agent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (pictures != null) {
      data['pictures'] = pictures!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    if (facilities != null) {
      data['facilities'] = facilities!.map((v) => v.toJson()).toList();
    }
    data['capacity'] = capacity;
    data['size'] = size;
    if (review != null) {
      data['review'] = review!.toJson();
    }
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['owner'] = owner;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (agent != null) {
      data['agent'] = agent!.toJson();
    }
    return data;
  }
}

class Pictures {
  String? id;
  int? index;
  String? url;
  String? alt;

  Pictures({this.id, this.index, this.url, this.alt});

  Pictures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    url = json['url'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['index'] = index;
    data['url'] = url;
    data['alt'] = alt;
    return data;
  }
}

class Facilities {
  int? id;
  String? name;
  String? icon;
  String? iconName;
  String? description;

  Facilities({this.id, this.name, this.icon, this.iconName, this.description});

  Facilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    iconName = json['iconName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['iconName'] = iconName;
    data['description'] = description;
    return data;
  }
}

class Review {
  double? rating;
  int? count;

  Review({this.rating, this.count});

  Review.fromJson(Map<String, dynamic> json) {
    rating = json['rating'].toDouble();
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['count'] = count;
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
  String? address;
  City? city;
  District? district;
  Geo? geo;

  Location({this.address, this.city, this.district, this.geo});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    district =
        json['district'] != null ? District.fromJson(json['district']) : null;
    geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (geo != null) {
      data['geo'] = geo!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
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

class District {
  int? id;
  int? cityId;
  String? name;

  District({this.id, this.cityId, this.name});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['cityId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cityId'] = cityId;
    data['name'] = name;
    return data;
  }
}

class Geo {
  double? long;
  double? lat;

  Geo({this.long, this.lat});

  Geo.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['long'] = long;
    data['lat'] = lat;
    return data;
  }
}

class Agent {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? picture;

  Agent({this.id, this.name, this.email, this.phone, this.picture});

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['picture'] = picture;
    return data;
  }
}

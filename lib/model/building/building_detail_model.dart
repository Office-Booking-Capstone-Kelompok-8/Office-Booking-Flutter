class BuildingDetailModel {
  BuildingDetailModel({
    this.id,
    this.name,
    this.pictures,
    this.description,
    this.facilities,
    this.capacity,
    this.price,
    this.owner,
    this.location,
  });
  String? id;
  String? name;
  List<Pictures>? pictures;
  String? description;
  List<Facilities>? facilities;
  int? capacity;
  int? size;
  Price? price;
  String? owner;
  Location? location;

  BuildingDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pictures =
        List.from(json['pictures']).map((e) => Pictures.fromJson(e)).toList();
    description = json['description'];
    facilities = List.from(json['facilities'])
        .map((e) => Facilities.fromJson(e))
        .toList();
    capacity = json['capacity'];
    size = json['size'];
    price = Price.fromJson(json['price']);
    owner = json['owner'];
    location = Location.fromJson(json['location']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['pictures'] = pictures!.map((e) => e.toJson()).toList();
    data['description'] = description;
    data['facilities'] = facilities!.map((e) => e.toJson()).toList();
    data['capacity'] = capacity;
    data['size'] = size;
    data['price'] = price!.toJson();
    data['owner'] = owner;
    data['location'] = location!.toJson();
    return data;
  }
}

class Pictures {
  Pictures({
    required this.id,
    required this.index,
    required this.url,
    required this.alt,
  });
  String? id;
  int? index;
  String? url;
  String? alt;

  Pictures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    url = json['url'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['index'] = index;
    data['url'] = url;
    data['alt'] = alt;
    return data;
  }
}

class Facilities {
  Facilities({
    required this.name,
    required this.icon,
    required this.iconName,
    required this.description,
  });
  String? name;
  String? icon;
  String? iconName;
  String? description;

  Facilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    iconName = json['iconName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['iconName'] = iconName;
    data['description'] = description;
    return data;
  }
}

class Price {
  Price({
    required this.annual,
    required this.monthly,
  });
  int? annual;
  int? monthly;

  Price.fromJson(Map<String, dynamic> json) {
    annual = json['annual'];
    monthly = json['monthly'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['annual'] = annual;
    data['monthly'] = monthly;
    return data;
  }
}

class Location {
  Location({
    required this.address,
    required this.city,
    required this.district,
    required this.geo,
  });
  String? address;
  String? city;
  String? district;
  Geo? geo;

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    district = json['district'];
    geo = Geo.fromJson(json['geo']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    data['city'] = city;
    data['district'] = district;
    data['geo'] = geo!.toJson();
    return data;
  }
}

class Geo {
  Geo({
    required this.long,
    required this.lat,
  });
  int? long;
  int? lat;

  Geo.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['long'] = long;
    data['lat'] = lat;
    return data;
  }
}

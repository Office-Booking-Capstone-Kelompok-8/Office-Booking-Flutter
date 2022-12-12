class ReservationDetailModel {
  String? id;
  Building? building;
  String? companyName;
  String? startDate;
  String? endDate;
  Status? status;
  String? createdAt;
  String? updatedAt;

  ReservationDetailModel(
      {this.id,
      this.building,
      this.companyName,
      this.startDate,
      this.endDate,
      this.status,
      this.createdAt,
      this.updatedAt});

  ReservationDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    building =
        json['building'] != null ? Building.fromJson(json['building']) : null;
    companyName = json['companyName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (building != null) {
      data['building'] = building!.toJson();
    }
    data['companyName'] = companyName;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Building {
  String? id;
  String? name;
  String? picture;
  String? city;
  String? district;
  String? address;

  Building(
      {this.id,
      this.name,
      this.picture,
      this.city,
      this.district,
      this.address});

  Building.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    city = json['city'];
    district = json['district'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['picture'] = picture;
    data['city'] = city;
    data['district'] = district;
    data['address'] = address;
    return data;
  }
}

class Status {
  int? id;
  String? message;

  Status({this.id, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    return data;
  }
}
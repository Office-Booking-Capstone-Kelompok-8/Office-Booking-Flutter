class ReservationDetailModel {
  String? id;
  Building? building;
  String? companyName;
  String? startDate;
  String? endDate;
  int? duration;
  Status? status;
  int? amount;
  String? message;
  String? expiredAt;
  String? createdAt;
  String? updatedAt;

  ReservationDetailModel(
      {this.id,
      this.building,
      this.companyName,
      this.startDate,
      this.endDate,
      this.duration,
      this.status,
      this.amount,
      this.message,
      this.expiredAt,
      this.createdAt,
      this.updatedAt});

  ReservationDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    building =
        json['building'] != null ? Building.fromJson(json['building']) : null;
    companyName = json['companyName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    duration = json['duration'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    amount = json['amount'];
    message = json['message'];
    expiredAt = json['expiredAt'];
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
    data['duration'] = duration;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    data['amount'] = amount;
    data['message'] = message;
    data['expiredAt'] = expiredAt;
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
  String? status;

  Status({this.id, this.status});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    return data;
  }
}

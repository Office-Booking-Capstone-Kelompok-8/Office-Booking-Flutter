class ReservationModel {
  String? id;
  Building? building;
  String? companyName;
  String? startDate;
  String? endDate;
  int? duration;
  int? amount;
  Status? status;
  String? expiredAt;
  String? createdAt;

  ReservationModel(
      {this.id,
      this.building,
      this.companyName,
      this.startDate,
      this.endDate,
      this.duration,
      this.amount,
      this.status,
      this.expiredAt,
      this.createdAt});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    building =
        json['building'] != null ? Building.fromJson(json['building']) : null;
    companyName = json['companyName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    duration = json['duration'];
    amount = json['amount'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    expiredAt = json['expiredAt'];
    createdAt = json['createdAt'];
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
    data['amount'] = amount;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    data['expiredAt'] = expiredAt;
    data['createdAt'] = createdAt;
    return data;
  }
}

class Building {
  String? id;
  String? name;
  String? picture;
  String? city;

  Building({this.id, this.name, this.picture, this.city});

  Building.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['picture'] = picture;
    data['city'] = city;
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

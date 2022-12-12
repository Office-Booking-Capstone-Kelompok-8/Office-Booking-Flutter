class ReservationModel {
  String? id;
  Building? building;
  String? companyName;
  String? startDate;
  String? endDate;
  Status? status;
  String? createdAt;

  ReservationModel(
      {this.id,
      this.building,
      this.companyName,
      this.startDate,
      this.endDate,
      this.status,
      this.createdAt});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    building =
        json['building'] != null ? Building.fromJson(json['building']) : null;
    companyName = json['companyName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
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
    if (status != null) {
      data['status'] = status!.toJson();
    }
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

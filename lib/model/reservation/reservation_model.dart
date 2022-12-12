class ReservationModel {
  String? id;
  Buildings? buildings;
  String? companyName;
  String? startDate;
  String? endDate;
  Status? status;

  ReservationModel(
      {this.id,
      this.buildings,
      this.companyName,
      this.startDate,
      this.endDate,
      this.status});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buildings = json['buildings'] != null
        ? Buildings.fromJson(json['buildings'])
        : null;
    companyName = json['companyName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (buildings != null) {
      data['buildings'] = buildings!.toJson();
    }
    data['companyName'] = companyName;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    return data;
  }
}

class Buildings {
  String? id;
  String? name;

  Buildings({this.id, this.name});

  Buildings.fromJson(Map<String, dynamic> json) {
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

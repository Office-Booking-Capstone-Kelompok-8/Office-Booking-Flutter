class PaymentBuildingModel {
  String? id;
  int? amount;
  String? startDate;
  int? duration;
  Method? method;
  String? proof;
  String? paidAt;
  String? expiresAt;
  String? createdAt;
  String? updatedAt;

  PaymentBuildingModel(
      {this.id,
      this.amount,
      this.startDate,
      this.duration,
      this.method,
      this.proof,
      this.paidAt,
      this.expiresAt,
      this.createdAt,
      this.updatedAt});

  PaymentBuildingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    startDate = json['startDate'];
    duration = json['duration'];
    method = json['method'] != null ? Method.fromJson(json['method']) : null;
    proof = json['proof'];
    paidAt = json['paidAt'];
    expiresAt = json['expiresAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['startDate'] = startDate;
    data['duration'] = duration;
    if (method != null) {
      data['method'] = method!.toJson();
    }
    data['proof'] = proof;
    data['paidAt'] = paidAt;
    data['expiresAt'] = expiresAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Method {
  String? id;
  String? icon;
  String? name;
  String? accountNumber;
  String? accountName;

  Method({this.id, this.icon, this.name, this.accountNumber, this.accountName});

  Method.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    data['accountNumber'] = accountNumber;
    data['accountName'] = accountName;
    return data;
  }
}

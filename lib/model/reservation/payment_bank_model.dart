class PaymentBankModel {
  int? id;
  String? bankName;
  String? bankIcon;
  String? accountName;
  String? accountNumber;
  String? description;

  PaymentBankModel(
      {this.id,
      this.bankName,
      this.bankIcon,
      this.accountName,
      this.accountNumber,
      this.description});

  PaymentBankModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bankName'];
    bankIcon = json['bankIcon'];
    accountName = json['accountName'];
    accountNumber = json['accountNumber'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bankName'] = bankName;
    data['bankIcon'] = bankIcon;
    data['accountName'] = accountName;
    data['accountNumber'] = accountNumber;
    data['description'] = description;
    return data;
  }
}

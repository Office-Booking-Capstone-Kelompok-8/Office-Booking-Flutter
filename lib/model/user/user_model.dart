class UserModel {
  String? id;
  String? email;
  String? name;
  String? phone;
  String? picture;
  int? role;
  bool? verified;
  UserModel(
      {this.id,
      this.email,
      this.name,
      this.phone,
      this.picture,
      this.role,
      this.verified});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    picture = json['picture'];
    role = json['role'];
    verified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['picture'] = picture;
    data['role'] = role;
    data['isVerified'] = verified;
    return data;
  }
}

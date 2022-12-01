class UserModel {
  String? id;
  String? email;
  String? name;
  String? phone;
  String? picture;
  String? role;
  UserModel(
      {this.id, this.email, this.name, this.phone, this.picture, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    picture = json['picture'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['picture'] = picture;
    data['role'] = role;
    return data;
  }
}

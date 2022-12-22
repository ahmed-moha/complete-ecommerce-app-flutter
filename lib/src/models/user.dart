class UserModel {
  String? type;
  String? sId;
  String? username;
  String? name;
  String? email;
  String? photo;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.type,
      this.sId,
      this.username,
      this.name,
      this.email,
      this.photo,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sId = json['_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['_id'] = sId;
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['photo'] = photo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

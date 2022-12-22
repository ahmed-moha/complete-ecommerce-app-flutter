class CategoryModel {
  String? name;
  String? desc;
  String? photo;
  String? sId;
  String? created;
  String? updatedAt;

  CategoryModel(
      {this.name,
      this.desc,
      this.photo,
      this.sId,
      this.created,
      this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    photo = json['photo'];
    sId = json['_id'];
    created = json['created'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = desc;
    data['photo'] = photo;
    data['_id'] = sId;
    data['created'] = created;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

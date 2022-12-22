class BannerModel {
  String? sId;
  String? title;
  String? description;
  List<String>? photos;
  String? created;
  String? updatedAt;

  BannerModel(
      {this.sId,
      this.title,
      this.description,
      this.photos,
      this.created,
      this.updatedAt});

  BannerModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    photos = json['photos'].cast<String>();
    created = json['created'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['photos'] = photos;
    data['created'] = created;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

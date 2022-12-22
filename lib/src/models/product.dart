class ProductModel {
  String? sId;
  String? name;
  String? desc;
  double? price;
   double? initialPrice;
  List<String>? photos;
  int? quantity;
  String? categoryId;
  bool? status;
  int? iV;

  ProductModel(
      {this.sId,
      this.name,
      this.desc,
      this.price,
      this.photos,
      this.quantity,
      this.categoryId,
      this.status,
      this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    desc = json['desc'];
    price = json['price'];
    initialPrice=json['price'];
    photos = json['photos'].cast<String>();
    quantity = json['quantity'];
    categoryId = json['categoryId'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['desc'] = desc;
    data['price'] = price;
    data['price'] = initialPrice;
    data['photos'] = photos;

    data['quantity'] = quantity;
    data['categoryId'] = categoryId;
    data['status'] = status;
    data['__v'] = iV;
    return data;
  }
}

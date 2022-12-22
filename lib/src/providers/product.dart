import 'dart:convert';

import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/models/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  gtProducts() async {
    var response = await http.get(
      Uri.parse("${kEndPoint}products"),
    );
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      if (!decodedData["status"]) throw decodedData["data"];
      List data = decodedData["data"];
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      final decodedData = jsonDecode(response.body);
      throw decodedData["data"];
    }
  }

  getProdcustByCategory({required String id}) async {
    var response =
        await http.get(Uri.parse("${kEndPoint}products/category/$id"));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      if (!decodedData["status"]) throw decodedData["data"];
      List data = decodedData["data"];
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      final decodedData = jsonDecode(response.body);
      throw decodedData["data"];
    }
  }

}

import 'dart:convert';

import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryProvider {
  getCategory() async {
    var response = await http.get(
      Uri.parse("${kEndPoint}categories"),
    );
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      if (!decodedData["status"]) throw decodedData["data"];
      List data = decodedData["data"];
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    }
  }
}

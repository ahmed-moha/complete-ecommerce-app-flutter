import 'dart:convert';

import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/models/banner.dart';
import 'package:http/http.dart' as http;

class BannerProvider {
  getBanners() async {
    var response = await http.get(Uri.parse("${kEndPoint}banners"));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      if (!decodedData["status"]) throw decodedData["data"];
      List data = decodedData["data"];
      print(data);
      return data.map((e) => BannerModel.fromJson(e)).toList();
    }
  }
}

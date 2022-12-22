import 'dart:convert';

import 'package:ecommerce_app/src/constants.dart';
import 'package:http/http.dart' as http;

class Base {
  getAllData({
    required String path,
  }) async {
    var response = await http.get(Uri.parse("$kEndPoint$path"));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      if (!decodedData["status"]) throw decodedData["data"];
      return decodedData["data"];
    } else {
      final decodedData = jsonDecode(response.body);
      throw decodedData["data"];
    }
  }
}

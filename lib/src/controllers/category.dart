import 'dart:developer';

import 'package:ecommerce_app/src/models/category.dart';
import 'package:ecommerce_app/src/providers/category.dart';
import 'package:flutter/cupertino.dart';

class CategoryController extends ChangeNotifier {
  List<CategoryModel> categories = [];
  bool isLoading = false;
  CategoryController() {
    getCategory();
  }
  getCategory() async {
    try {
      isLoading = true;
      notifyListeners();
      categories = await CategoryProvider().getCategory();
      notifyListeners();
    } catch (e) {
      log(e.toString(), name: "Category Error");
    }
    isLoading = false;
    notifyListeners();
  }
}

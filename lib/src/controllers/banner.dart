import 'dart:developer';

import 'package:ecommerce_app/src/models/banner.dart';
import 'package:ecommerce_app/src/providers/banner.dart';
import 'package:flutter/cupertino.dart';

class BannerController extends ChangeNotifier {
  List<BannerModel> banners = [];
  bool isLoading = false;
  BannerController(){
    getBanners();
  }
  getBanners() async {
    try {
      isLoading = true;
      notifyListeners();
      banners = await BannerProvider().getBanners();
      notifyListeners();
    } catch (e) {
      log(e.toString(), name: "Banners Error");
    }
    isLoading = false;
    notifyListeners();
  }
}

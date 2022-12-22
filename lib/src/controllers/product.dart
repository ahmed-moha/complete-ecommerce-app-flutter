import 'dart:developer';

import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/models/product.dart';
import 'package:ecommerce_app/src/providers/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends ChangeNotifier {
  final box = GetStorage();
  int quantity = 1;
  List<ProductModel> cartList = [];
  List<ProductModel> products = [];
  List<ProductModel> categoryProducts = [];
  bool isLoading = false;
  bool isCategoryIdLoaidng = false;
  ProductController() {
    getProducts();
    getCarts();
  }
  getProducts() async {
    try {
      setLoading(true);
      products = await ProductProvider().gtProducts();
      notifyListeners();
    } catch (e) {
      log(e.toString(), name: "GetProducts Error");
    }
    setLoading(false);
  }

  getProductById({required String id}) async {
    try {
      setCategoryLoading(true);
      categoryProducts = await ProductProvider().getProdcustByCategory(id: id);
      notifyListeners();
    } catch (e) {
      log(e.toString(), name: "GetCategoryById Errror");
    }
    setCategoryLoading(false);
  }

  setLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  setCategoryLoading(bool isLoading) {
    isCategoryIdLoaidng = isLoading;
    notifyListeners();
  }

  updateQuantity(ProductModel product, context, {bool isSubtract = false}) {
    if (isSubtract) {
      if (quantity > 1) {
        quantity--;
        var data = products.firstWhere((element) => product == element);
        data.price = data.price! - data.initialPrice!;
        notifyListeners();
      }
    } else {
      if (product.quantity! >= 1) {
        if (quantity < product.quantity!) {
          quantity++;
          print(products);
          var data = products.firstWhere(
            (element) => element == product,
          );
          data.price = data.initialPrice! * quantity;
          notifyListeners();
        } else {
          kAlert(context, "No product available");
        }
      }
    }
  }

  addToCart(ProductModel product) async {
    cartList.add(product);
    notifyListeners();
    final carts = cartList.map((e) => e.toJson()).toList();
    box.write(kCart, carts);
  }

  removeFromCart(ProductModel product) {
    cartList.removeWhere((element) => element.sId == product.sId);
    notifyListeners();
    final carts = cartList.map((e) => e.toJson()).toList();
    box.remove(kCart);
    box.write(kCart, carts);
  }

  getCarts() async {
    if (box.hasData(kCart)) {
      final data = box.read(kCart);
      for (var i in data) {
        cartList.add(ProductModel.fromJson(i));
      }
      notifyListeners();
    }
  }
}

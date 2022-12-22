import 'dart:developer';

import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/models/user.dart';
import 'package:ecommerce_app/src/providers/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends ChangeNotifier {
  // Init call user controller
  UserController() {
    getUser();
  }

  // Getstorage instance
  final box = GetStorage();

  // user model
  UserModel user = UserModel();

  // login part
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  bool isLoginLoading = false;

  // Register part
  TextEditingController rUsername = TextEditingController();
  TextEditingController rPassword = TextEditingController();
  TextEditingController rName = TextEditingController();
  TextEditingController rEmail = TextEditingController();
  final registerFormKey = GlobalKey<FormState>();
  bool isRegesterLoading = false;

  login({Function? success}) async {
    if (loginFormKey.currentState?.validate() ?? false) {
      isLoginLoading = true;
      notifyListeners();
      try {
        String username = this.username.text;
        String password = this.password.text;
        user =
            await UserProvider().login(username: username, password: password);
        notifyListeners();
        success!();
      } catch (e) {
        log(e.toString(), name: "Login Error");
      }
      isLoginLoading = false;
      notifyListeners();
    }
  }

  register(context) async {
    if (registerFormKey.currentState?.validate() ?? false) {
      isRegesterLoading = true;
      notifyListeners();
      try {
        String username = rUsername.text;
        String password = rPassword.text;
        String name = rName.text;
        String email = rEmail.text;
        user = await UserProvider().register(
            username: username, password: password, email: email, name: name);
        notifyListeners();
        kAlert(context, "Successfully Registered");
      } catch (e) {
        log(e.toString(), name: "Login Error");
        kAlert(context, e.toString());
      }
      isRegesterLoading = false;
      notifyListeners();
    }
  }

  google({Function? success}) async {
    try {
      isLoginLoading = true;
      notifyListeners();
      user = await UserProvider().google();
      notifyListeners();
      success!();
    } catch (e) {
      log(e.toString(), name: "Google Sign in Error");
    }
    isLoginLoading = false;
    notifyListeners();
  }

  getUser() {
    if (box.hasData(kuser)) {
      final json = box.read(kuser);
      if (json != null) {
        user = UserModel.fromJson(json);
        notifyListeners();
      }
    }
  }
}

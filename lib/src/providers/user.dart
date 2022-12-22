import 'dart:convert';

import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final box = GetStorage();
  login({required String username, required String password}) async {
    var response = await http.post(
      Uri.parse("${kEndPoint}users/login"),
      body: {"username": username, "password": password},
    );
    if (response.statusCode == 200) {
      print(response.body);
      final decodedData = jsonDecode(response.body);
      if (!decodedData["status"]) throw decodedData["data"];
      print(decodedData);
      saveUser(UserModel.fromJson(decodedData["data"]));
      return UserModel.fromJson(decodedData["data"]);
    } else {
      final decodedData = jsonDecode(response.body);
      throw decodedData["data"];
    }
  }

  register(
      {required String name,
      required String username,
      required String password,
      required String email,
      String? type}) async {
    var body = {
      "name": name,
      "username": username,
      "password": password,
      "email": email,
      "type": type ?? "Normal"
    };
    var response =
        await http.post(Uri.parse("${kEndPoint}users/register"), body: body);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      if (!decodedData["status"]) throw decodedData["data"];
      saveUser(UserModel.fromJson(decodedData["data"]));
      return UserModel.fromJson(decodedData["data"]);
    } else {
      print(response.body);
      final decodedData = jsonDecode(response.body);
      throw decodedData["message"];
    }
  }

  google() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var user = await FirebaseAuth.instance.signInWithCredential(credential);
    if (user.additionalUserInfo?.isNewUser ?? false) {
      return register(
          name: user.user?.displayName ?? "Stranger",
          username: user.user!.email!,
          password: user.user!.uid,
          email: user.user!.email!,
          type: "Google");
    } else {
      return login(
        username: user.user!.email!,
        password: user.user!.uid,
      );
    }
  }

  saveUser(UserModel user) async {
    await box.write(kuser, user.toJson());
  }
}

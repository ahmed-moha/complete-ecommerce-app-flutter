import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/controllers/banner.dart';
import 'package:ecommerce_app/src/controllers/category.dart';
import 'package:ecommerce_app/src/controllers/home.dart';
import 'package:ecommerce_app/src/controllers/product.dart';
import 'package:ecommerce_app/src/controllers/user.dart';
import 'package:ecommerce_app/src/views/home.dart';
import 'package:ecommerce_app/src/views/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  // Get Storage Initialization
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final box = GetStorage();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserController>(
            create: (create) => UserController()),
        ChangeNotifierProvider<HomeController>(
            create: (create) => HomeController()),
        ChangeNotifierProvider<BannerController>(
            create: (create) => BannerController()),
        ChangeNotifierProvider<CategoryController>(
            create: (create) => CategoryController()),
        ChangeNotifierProvider<ProductController>(
            create: (create) => ProductController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: box.hasData(kuser) ? const Home() : const LoginScreen(),
      ),
    ),
  );
}

import 'package:flutter/cupertino.dart';

import '../views/screens/favorites.dart';
import '../views/screens/home.dart';
import '../views/screens/profile.dart';
import '../views/screens/search.dart';

class HomeController extends ChangeNotifier {
  int screenIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];
  updateScreenIndex(index) {
    screenIndex = index;
    notifyListeners();
  }
}

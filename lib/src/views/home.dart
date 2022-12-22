import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, user, _) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor),
        child: Scaffold(
          // appBar: AppBar(title: const Text("Home")),
          body: SafeArea(child: user.screens[user.screenIndex]),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: Colors.grey.shade400,
            currentIndex: user.screenIndex,
            onTap: user.updateScreenIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyLight.home,
                  ),
                  activeIcon: Icon(
                    IconlyBold.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyLight.search,
                  ),
                  activeIcon: Icon(
                    IconlyBold.search,
                  ),
                  label: "Serach"),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyLight.heart,
                  ),
                  activeIcon: Icon(
                    IconlyBold.heart,
                  ),
                  label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyLight.profile,
                  ),
                  activeIcon: Icon(
                    IconlyBold.profile,
                  ),
                  label: "Profile"),
            ],
          ),
        ),
      );
    });
  }
}

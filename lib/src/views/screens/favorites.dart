import 'package:flutter/material.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Center(child: Text("Favorites"))
        ],
      ),
    );
  }
}
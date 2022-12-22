import 'package:flutter/material.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Center(child: Text("Search"))
        ],
      ),
    );
  }
}
import 'package:ecommerce_app/src/components/header_card.dart';
import 'package:ecommerce_app/src/components/seprator_card.dart';
import 'package:ecommerce_app/src/components/title_card.dart';
import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/controllers/category.dart';
import 'package:ecommerce_app/src/controllers/product.dart';
import 'package:ecommerce_app/src/views/category_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/banner_card.dart';
import '../../components/category_card.dart';
import '../../components/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card
          const HeaderCard(),
          const SizedBox(
            height: kPadding,
          ),
          // Title Part
          const TitleCard(),

          const SizedBox(
            height: kPadding,
          ),
          // Banners Part
          const BannerCard(),
          const SizedBox(
            height: kPadding,
          ),
          // Category Part
          const Seprator(title: "Categories"),
          Consumer<CategoryController>(
            builder: (context, category, _) {
              if (category.isLoading) {
                return const Text("Loading....");
              } else if (category.categories.isEmpty) {
                return const SizedBox();
              } else {
                return Container(
                  height: 85,
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.categories.length,
                    itemBuilder: (context, index) => CategoryCard(
                      category: category.categories[index],
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryProduct(
                              id: category.categories[index].sId!,
                              name:  category.categories[index].name!,
                            ),
                          )),
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: kPadding,
          ),
          // Category Part
          const Seprator(title: "Popular Products"),
          Consumer<ProductController>(builder: (context, product, _) {
            if (product.isLoading) {
              return const Text("Loading...");
            } else if (product.products.isEmpty) {
              return const SizedBox();
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kPadding, vertical: 8),
                child: GridView.builder(
                  itemCount: product.products.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // mainAxisExtent: 270,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemBuilder: (context, index) =>
                      ProductCard(product: product.products[index]),
                ),
              );
            }
          })
        ],
      ),
    );
  }
}

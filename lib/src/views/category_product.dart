import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:ecommerce_app/src/components/product_card.dart';
import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/controllers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({super.key, required this.id, required this.name});
  final String id;
  final String name;

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct>
    with AfterLayoutMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Provider.of<ProductController>(context, listen: false)
        .getProductById(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title:  Text(
          widget.name,
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Consumer<ProductController>(
              builder: (context, product, child) {
                if (product.isCategoryIdLoaidng) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (product.categoryProducts.isEmpty) {
                  return const Center(
                    child: Text("No Products Found 😒"),
                  );
                } else {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: product.categoryProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15),
                      itemBuilder: (context, index) =>
                          ProductCard(product: product.categoryProducts[index]),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/src/models/product.dart';
import 'package:ecommerce_app/src/views/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  ProductDetailScreen(product: product),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                  color: Colors.black12.withOpacity(0.04))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(product.photos?[0] ?? "",
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Container(
                      //  color: Colors.cyan,

                      alignment: Alignment.bottomRight,
                      child: const Icon(IconlyLight.heart),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: kPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product.name ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: kPadding,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "\$${product.initialPrice}",
                        style: const TextStyle(
                            fontSize: kPadding, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

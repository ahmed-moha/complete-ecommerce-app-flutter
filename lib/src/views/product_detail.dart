import 'package:badges/badges.dart';
import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/controllers/product.dart';
import 'package:ecommerce_app/src/models/product.dart';
import 'package:ecommerce_app/src/views/cart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ProductController>(builder: (context, product, _) {
              return Badge(
                badgeContent: Text(
                  product.cartList.length.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),)),
                  child: const Icon(IconlyLight.bag),
                ),
              );
            }),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  product.photos![0],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: kPadding,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: kPadding),
                child: Text(
                  product.name ?? "",
                  style: const TextStyle(fontSize: kPadding),
                ),
              ),
              const SizedBox(
                height: kPadding,
              ),
              Consumer<ProductController>(builder: (context, prod, _) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "\$${product.price!.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  prod.updateQuantity(product, context),
                              child: const Icon(Icons.add),
                            ),
                            Text(
                              "${prod.quantity}",
                              style: const TextStyle(
                                  fontSize: kPadding,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => prod.updateQuantity(product, context,
                                  isSubtract: true),
                              child: const Icon(FontAwesomeIcons.minus),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
              const SizedBox(
                height: kPadding,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: const Text("Description")),
              const SizedBox(
                height: kPadding,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: kPadding),
                child: Text(
                  product.desc ?? "",
                  style: const TextStyle(fontSize: kPadding),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          Consumer<ProductController>(builder: (context, product, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kPadding, vertical: kPadding),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => product.addToCart(this.product),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: const StadiumBorder()),
                    child: const Text("Add to Cart"),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

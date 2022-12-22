import 'package:ecommerce_app/src/models/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/product.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              blurRadius: 25, color: Colors.black12, offset: Offset(0, 10))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 2,
              child: Image.network(
                product.photos![0],
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(product.name ?? ""),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8, left: 8),
                  child: Text("\$${product.price!.toStringAsFixed(2)}"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Consumer<ProductController>(builder: (context, prod, _) {
                        return Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    prod.updateQuantity(product, context),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPrimaryColor,
                                  ),
                                  child: const Icon(Icons.add,
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${prod.quantity}",
                                style: const TextStyle(
                                    fontSize: kPadding,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () => prod.updateQuantity(
                                    product, context,
                                    isSubtract: true),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPrimaryColor,
                                  ),
                                  child: const Icon(FontAwesomeIcons.minus,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
          Consumer<ProductController>(builder: (context, pro, _) {
            return Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.all(8),
                child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) =>  AlertDialog(
                          content: const Text("Are you sure you want to delete"),
                          actions: [
                            TextButton(onPressed: (){
                              pro.removeFromCart(product);
                              Navigator.pop(context);
                            }, child: const Text("Delete")),
                             TextButton(onPressed: ()=>Navigator.pop(context), child: const Text("No")),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(IconlyLight.delete)),
              ),
            );
          })
        ],
      ),
    );
  }
}

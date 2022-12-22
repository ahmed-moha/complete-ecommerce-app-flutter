import 'package:ecommerce_app/src/components/cart_card.dart';
import 'package:ecommerce_app/src/controllers/product.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Cart",style: TextStyle(color: Colors.black),),
        backgroundColor: Theme.of(context).cardColor,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [IconButton(onPressed: (){}, icon: const Icon(IconlyLight.delete))],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ProductController>(
              builder: (context, cart, child) {
                if (cart.cartList.isEmpty) {
                  return const Center(
                    child: Text("No carts found 😒"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: cart.cartList.length,
                    itemBuilder: (context, index) =>  CartCard(product: cart.cartList[index]),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

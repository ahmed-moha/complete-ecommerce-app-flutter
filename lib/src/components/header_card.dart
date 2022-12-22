import 'package:ecommerce_app/src/controllers/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    Key? key,
    this.onDrawerTap,
    this.onImageTap,
  }) : super(key: key);
  final void Function()? onDrawerTap;
  final void Function()? onImageTap;
  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(builder: (context, user, _) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onDrawerTap,
              child: Container(
                padding: const EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 10),
                      blurRadius: 25,
                      color: Colors.black12.withOpacity(0.02),
                    )
                  ],
                ),
                child: const Icon(Icons.blur_on),
              ),
            ),
            const Text(
              "E-Commerce",
              style: TextStyle(fontSize: 20),
            ),
            GestureDetector(
              onTap: onImageTap,
              child: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                      Image.network(user.user.photo ?? "", fit: BoxFit.cover),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

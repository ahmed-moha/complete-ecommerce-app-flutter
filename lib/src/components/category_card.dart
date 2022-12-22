import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/models/category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category, this.onTap,
  }) : super(key: key);
  final CategoryModel category;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        margin: const EdgeInsets.only(right: kPadding),
        width: 85,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 25,
                color: Colors.black12.withOpacity(0.05),
              )
            ]),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  category.photo ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 2,
              child: Text(
                category.name ?? "",
                style: const TextStyle(fontSize: 10),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

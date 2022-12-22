import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce_app/src/controllers/banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BannerController>(builder: (context, banner, _) {
      if (banner.isLoading) {
        return Container(
          width: double.infinity,
          height: 150,
          color: Colors.grey.shade200,
        );
      } else if (banner.banners.isEmpty) {
        return const SizedBox();
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: kPadding),
          width: double.infinity,
          height: 150,
          child: Carousel(
            boxFit: BoxFit.cover,
            dotSize: 4.0,
            dotSpacing: kPadding,
            dotBgColor: Colors.transparent,
            dotVerticalPadding: -4,
            images: banner.banners
                .map((e) => Image.network(
                      e.photos![0],
                      fit: BoxFit.cover,
                    ))
                .toList(),
          ),
        );
      }
    });
  }
}

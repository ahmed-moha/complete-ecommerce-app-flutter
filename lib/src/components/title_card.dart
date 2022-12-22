import 'package:flutter/material.dart';

import '../constants.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: kPadding, vertical: kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Find",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 3,
          ),
          RichText(
            text: const TextSpan(
                text: "best food ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: "nearby...",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  )
                ]),
          )
        ],
      ),
    );
  }
}

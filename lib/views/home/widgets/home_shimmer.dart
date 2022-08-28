import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget homeShimmer(BuildContext context) {
  var mediaSize = MediaQuery.of(context).size;
  return SizedBox(
    height: 26.4 * mediaSize.height / 100,
    child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Shimmer.fromColors(
              baseColor: const Color(0xffE0E0E0).withOpacity(0.2),
              highlightColor: Color(0xffE0E0E0),
              enabled: false,
              period: const Duration(seconds: 1),
              child: Container(
                height: 13.2 * mediaSize.height / 100,
                width: 91 * mediaSize.width / 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Center(
                  child: Text("sdsdsdsdsd"),
                ),
              ),
            ),
          );
        }),
  );
}

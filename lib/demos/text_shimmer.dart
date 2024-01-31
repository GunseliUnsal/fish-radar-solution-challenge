import 'dart:math';

import 'package:fish_radar/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            20,
            (index) => Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: Random().nextInt(300).toDouble() + 100,
                  height: 14,
                  color: shimmerColor,
                )),
          ),
        ),
      ),
    );
  }
}

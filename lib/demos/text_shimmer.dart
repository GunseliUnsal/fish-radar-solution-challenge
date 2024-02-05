import 'dart:math';

import 'package:fish_radar/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerColumnWidget extends StatelessWidget {
  const ShimmerColumnWidget({
    required this.count,
  });
  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            count,
            (index) => Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  width: Random().nextInt(300).toDouble() + 100,
                  height: 12,
                  color: shimmerColor,
                )),
          ),
        ),
      ),
    );
  }
}

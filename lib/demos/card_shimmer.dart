import 'package:fish_radar/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerCard() {
  return Padding(
    padding: const EdgeInsets.all(7.0),
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                        color: Color.fromARGB(31, 105, 105, 105),
                        height: double.maxFinite,
                        width: double.infinity),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                      color: Color.fromARGB(31, 105, 105, 105),
                      height: 20,
                      width: 80),
                )),
          ),
        ],
      ),
    ),
  );
}

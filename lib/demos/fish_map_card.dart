import 'package:fish_radar/api/model/fish_map_model.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/text_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

Widget fishMapCardShimmerRow() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FishMapCardShimmer(),
        ),
      ),
    ),
  );
}

class FishMapCardShimmer extends StatelessWidget {
  const FishMapCardShimmer({super.key});

  /*const FishMapCard({
    required this.fish,
  });
  final FishMapCard fish;*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
      ),
      child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: 300,
              height: 150,
              color: Colors.white,
              child: Stack(children: [
                Positioned(
                    right: 8,
                    top: 8,
                    child: Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 30,
                          height: 30,
                          color: shimmerColor,
                        ),
                      ),
                    )),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 26, top: 26),
                      child: Shimmer.fromColors(
                        direction: ShimmerDirection.ltr,
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 14,
                          width: 60,
                          color: shimmerColor,
                        ),
                      )),
                  Positioned(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 26, top: 12),
                        child: Shimmer.fromColors(
                          direction: ShimmerDirection.ltr,
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 8,
                                width: 180,
                                color: shimmerColor,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 8,
                                width: 100,
                                color: shimmerColor,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 8,
                                width: 200,
                                color: shimmerColor,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 8,
                                width: 160,
                                color: shimmerColor,
                              ),
                            ],
                          ),
                        )),
                  )
                ]),
              ]),
            ),
          )),
    );
  }
}

class FishMapCard extends StatelessWidget {
  FishMapCard({super.key, required this.fish});

  FishMapModel fish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 8),
      child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: 300,
              height: 150,
              color: Colors.white,
              child: Stack(children: [
                Positioned(
                    right: 8,
                    top: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: fish.warning
                          ? GestureDetector(
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  child: const Icon(
                                    Icons.info_outline_rounded,
                                    color: Colors.amber,
                                    size: 30,
                                  )),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Container(
                                          width: 300,
                                          padding: EdgeInsets.all(16),
                                          color: Colors.white,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Lottie.asset(
                                                  "assets/raw/warning.json",
                                                  height: 150,
                                                  repeat: false),
                                              const Text(
                                                "WARNING",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                fish.fishName,
                                                style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8,
                                                    right: 8,
                                                    top: 8,
                                                    bottom: 20),
                                                child: Text(
                                                  fish.warningDescription ?? "",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  maxLines: 5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              ElevatedButton(
                                                  style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll<
                                                                Color>(
                                                            Colors.amber),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    "Understand",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          : Container(),
                    )),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 26, top: 26),
                      child: Text(
                        fish.fishName,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Positioned(
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 26, top: 4, right: 26),
                        child: Text(
                          fish.description,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 12),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        )),
                  )
                ]),
              ]),
            ),
          )),
    );
  }
}

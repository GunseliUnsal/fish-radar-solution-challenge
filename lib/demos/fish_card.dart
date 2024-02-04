import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_radar/api/db/hive_model.dart';
import 'package:fish_radar/api/model/fish_model.dart';
import 'package:fish_radar/api/utils/constants.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:fish_radar/api/model/fish_card_model.dart';
import 'package:fish_radar/pages/fish_detail_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shimmer/shimmer.dart';


class FishCard extends StatefulWidget {
  const FishCard({super.key, required this.fish});
  final FishModel fish;
  @override
  State<FishCard> createState() => _FishCard();
}

class _FishCard extends State<FishCard> {
  late Future<Box<FavoriteFish>> _boxFuture;

  @override
  void initState() {
    super.initState();
    _boxFuture = openHiveBox();
  }

  Future<Box<FavoriteFish>> openHiveBox() async {
    return await Hive.openBox<FavoriteFish>('favorites');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<FavoriteFish>>(
      future: _boxFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final box = snapshot.data!;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FishDetailPage(
                    fishCard: FishCardModel(
                      imageURL: widget.fish.imgSrcSet!.x2 ??
                          widget.fish.imgSrcSet!.x1_5 ??
                          "gggg", // Use the appropriate image URL
                      name: widget.fish.name ?? "FISH_TITLE",
                      description: 'Description of ${widget.fish.name}',
                      onTap: () {
                        // Handle tap action if needed
                      },
                    ),
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, box, child) {
                  bool isFavorite = box.get(widget.fish.id) != null;
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    colorBlendMode: BlendMode.darken,
                                    alignment: Alignment.topRight,
                                    fadeInCurve: Curves.easeIn,
                                    imageUrl: widget.fish.imgSrcSet!.x2 ??
                                        widget.fish.imgSrcSet!.x1_5 ??
                                        "",
                                    placeholder: (context, url) => Image.asset(
                                      "assets/png/placeholder.png",
                                      fit: BoxFit.fitWidth,
                                    ), // Placeholder widget
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      "assets/png/placeholder.png",
                                      fit: BoxFit.cover,
                                    ), // Error widget if image fails to load
                                    height: double.maxFinite,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.black12,
                                    child: IconButton(
                                      alignment: Alignment.topRight,
                                      icon: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 15,
                                        color: Colors.red,
                                      ),
                                      onPressed: () async {
                                        if (isFavorite) {
                                          await box.delete(widget.fish.id);
                                        } else {
                                          await box.put(
                                            widget.fish.id,
                                            FavoriteFish(
                                              id: widget.fish.id,
                                              name: widget.fish.name,
                                              img: widget.fish.imgSrcSet!.x2 ??
                                                  widget.fish.imgSrcSet!.x1_5 ??
                                                  "",
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                            child: Text(
                              widget.fish.name,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return shimmerCard();
        }
      },
    );
  }
}

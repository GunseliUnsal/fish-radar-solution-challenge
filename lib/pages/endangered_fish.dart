import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_radar/api/model/fish_model.dart';
import 'package:flutter/material.dart';
import 'package:fish_radar/pages/fish_card.dart';
import 'package:fish_radar/pages/fish_detail_page.dart';

class EndangeredFishCard extends StatefulWidget {
  const EndangeredFishCard({super.key, required this.fish});
  final FishModel fish;
  @override
  State<EndangeredFishCard> createState() => _EndangeredFishCard();
}

class _EndangeredFishCard extends State<EndangeredFishCard> {
  bool standardSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FishDetailPage(
                fishCard: FishCard(
                  imageURL: widget.fish.imgSrcSet!.x2 ??
                      widget.fish.imgSrcSet!.x1_5 ??
                      "gggg", // Use the appropriate image URL
                  name: widget.fish.name,
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Stack(children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    colorBlendMode: BlendMode.darken,
                    alignment: Alignment.center,
                    fadeInCurve: Curves.easeIn,
                    imageUrl: widget.fish.imgSrcSet!.x2 ?? widget.fish.imgSrcSet!.x1_5 ?? "",
                    placeholder: (context, url) =>
                        Image.asset("assets/png/placeholder.png", fit: BoxFit.fitWidth), // Placeholder widget
                    errorWidget: (context, url, error) => Image.asset("assets/png/placeholder.png",
                        fit: BoxFit.fitWidth), // Error widget if image fails to load
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                    height: 200,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.black.withAlpha(0), Colors.black12, Colors.black45],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.fish.name,
                        style: TextStyle(shadows: const [
                          Shadow(
                            blurRadius: 10.0, // shadow blur
                            color: Colors.black45, // shadow color
                            offset: Offset(2.0, 2.0), // how much shadow will be shown
                          ),
                        ], color: Colors.white.withAlpha(200), fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    )),
              ),
            ])));
  }
}

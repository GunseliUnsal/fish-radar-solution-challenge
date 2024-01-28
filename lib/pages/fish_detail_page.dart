import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'fish_card.dart';

class FishDetailPage extends StatelessWidget {
  final FishCard fishCard;

  FishDetailPage({required this.fishCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: fishCard.imageURL,
              placeholder: (context, url) => Image.asset(
                  "assets/png/placeholder.png"), // Placeholder widget
              errorWidget: (context, url, error) => Image.asset(
                  "assets/png/placeholder.png"), // Error widget if image fails to load
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              fishCard.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(fishCard.description),
          ],
        ),
      ),
    );
  }
}

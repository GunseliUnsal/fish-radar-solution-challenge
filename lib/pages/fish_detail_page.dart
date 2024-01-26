import 'package:flutter/material.dart';
import 'fish_card.dart';

class FishDetailPage extends StatelessWidget {
  final FishCard fishCard;

  FishDetailPage({required this.fishCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fishCard.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              fishCard.imageURL,
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

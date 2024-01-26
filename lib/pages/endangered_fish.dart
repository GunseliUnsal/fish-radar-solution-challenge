import 'package:flutter/material.dart';
import 'package:fish_radar/pages/fish_card.dart';
import 'package:fish_radar/pages/fish_detail_page.dart';

class EndangeredFishCard extends StatelessWidget {
  final String imageURL = 'https://example.com/endangered_fish.jpg';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FishDetailPage(
              fishCard: FishCard(
                imageURL: imageURL,
                name: 'Endangered Fish',
                description: 'Description of Endangered Fish',
              ),
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              imageURL,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Endangered Fish',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Description of Endangered Fish'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

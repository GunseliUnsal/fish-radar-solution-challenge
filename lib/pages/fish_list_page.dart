import 'package:flutter/material.dart';
import 'fish_card.dart';
import 'fish_detail_page.dart';
import 'endangered_fish.dart';

class FishListPage extends StatefulWidget {
  @override
  _FishListPageState createState() => _FishListPageState();
}

class _FishListPageState extends State<FishListPage> {
  List<FishCard> fishcardlar = [
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 1',
      description: 'Description of Fish 1',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 2',
      description: 'Description of Fish 2',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 3',
      description: 'Description of Fish 3',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 4',
      description: 'Description of Fish 4',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 5',
      description: 'Description of Fish 5',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 6',
      description: 'Description of Fish 6',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 7',
      description: 'Description of Fish 7',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 8',
      description: 'Description of Fish 8',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 9',
      description: 'Description of Fish 9',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 10',
      description: 'Description of Fish 10',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 11',
      description: 'Description of Fish 11',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 12',
      description: 'Description of Fish 12',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 13',
      description: 'Description of Fish 13',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 14',
      description: 'Description of Fish 14',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 15',
      description: 'Description of Fish 15',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 16',
      description: 'Description of Fish 16',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 17',
      description: 'Description of Fish 17',
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 18',
      description: 'Description of Fish 18',
    ),
  ];

  List<FishCard> filteredFishCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF192E51),
        title: TextField(
          onChanged: (value) {
            setState(() {
              filteredFishCards = fishcardlar
                  .where((fishCard) =>
                      fishCard.name.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF192E51),
        child: Column(
          children: [
            EndangeredFishCard(),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFishCards.isEmpty
                    ? fishcardlar.length
                    : filteredFishCards.length,
                itemBuilder: (BuildContext context, int index) {
                  FishCard fishCard = filteredFishCards.isEmpty
                      ? fishcardlar[index]
                      : filteredFishCards[index];

                  return Card(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FishDetailPage(fishCard: fishCard),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ListTile(
                            leading: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    fishCard.imageURL,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              fishCard.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(fishCard.description),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  fishCard.isFavorite = !fishCard.isFavorite;
                                });
                              },
                              child: Icon(
                                fishCard.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: fishCard.isFavorite ? Colors.red : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

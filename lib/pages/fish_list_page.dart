import 'package:fish_radar/constants/colors.dart';
import 'package:flutter/material.dart';
import 'fish_card.dart';
import 'endangered_fish.dart';

import 'package:fish_radar/fishdetails/sea_bass.dart';
import 'package:fish_radar/fishdetails/gilthead_sea_bream.dart';
import 'package:fish_radar/fishdetails/carol_fish.dart';

class FishListPage extends StatefulWidget {
  @override
  _FishListPageState createState() => _FishListPageState();
}

class _FishListPageState extends State<FishListPage> {
  List<FishCard> fishcardlar = [
    FishCard(
      imageURL:
          'assets/fish_pic/seabass.jpeg', //bide buralarda benim yüklediğim fotoğraflar gözükmüyor
      name: 'Sea Bass',
      description:
          'Sea bass is a delicious sea fish that lives in cold and temperate waters.',
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SeaBassPage()));
        /*Gunseli burada Fish Detail kısımlarına gitmek için onTap içine yolu
        tanımladım ama context kısmında hata veriyor. Başka kodlar fln denedik
        ama doğru çözümü bulamadık.
        */
      },
    ),
    FishCard(
      imageURL: 'assets/fish_pic/giltheadsea.jpg',
      name: 'Gilthead Sea Bream',
      description:
          'Sea bream is a popular marine fish that lives in warm and temperate seas. ',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'assets/fish_pic/carolfish.png',
      name: 'Coral (Grouper)',
      description: 'It feeds on corals, other fish, crustaceans and seafood. ',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 4',
      description: 'Description of Fish 4',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 5',
      description: 'Description of Fish 5',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 6',
      description: 'Description of Fish 6',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 7',
      description: 'Description of Fish 7',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 8',
      description: 'Description of Fish 8',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 9',
      description: 'Description of Fish 9',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 10',
      description: 'Description of Fish 10',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 11',
      description: 'Description of Fish 11',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 12',
      description: 'Description of Fish 12',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 13',
      description: 'Description of Fish 13',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 14',
      description: 'Description of Fish 14',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 15',
      description: 'Description of Fish 15',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 16',
      description: 'Description of Fish 16',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 17',
      description: 'Description of Fish 17',
      onTap: () {},
    ),
    FishCard(
      imageURL: 'https://example.com/image1.jpg',
      name: 'Fish 18',
      description: 'Description of Fish 18',
      onTap: () {},
    ),
  ];

  List<FishCard> filteredFishCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
        color: backgroundColor,
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
                    color: whiteColor,
                    child: InkWell(
                      /*onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FishDetailPage(fishCard: fishCard),
                          ),
                        );
                      },
                       */
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

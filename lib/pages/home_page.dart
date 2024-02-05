import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:fish_radar/api/model/fish_card_model.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/text_shimmer.dart';
import 'package:fish_radar/pages/education_page.dart';
import 'package:fish_radar/pages/fish_detail_page.dart';
import 'package:fish_radar/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:fish_radar/pages/favorite_page.dart';
import 'package:fish_radar/demos/home_page_card.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.fishDescription,
      required this.fishTitle,
      required this.pageController,
      required this.notchBottomBarController});

  final String fishDescription;
  final String fishTitle;
  final PageController pageController;
  final NotchBottomBarController notchBottomBarController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String image = "assets/png/linear_fish.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FishDetailPage(
                      fishCard: FishCardModel(
                        imageURL: image, // Use the appropriate image URL
                        name: widget.fishTitle,
                        description: '',
                        onTap: () {
                          // Handle tap action if needed
                        },
                      ),
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  _FishTitle(
                    fishTitle: widget.fishTitle,
                  ),
                  _FishDescription(
                    fishDescription: widget.fishDescription,
                  ),
                  /*const Positioned(
                      bottom: 0,
                      left: 10,
                      child: ShimmerColumnWidget(count: 3)),*/
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomePageCard(
                  titleText: 'LEARN HOW TO SAVE OCEAN',
                  subtitleText: 'Use our module',
                  leadingIcon: const Icon(Icons.school_outlined),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EducationPage()));
                  },
                ),
                HomePageCard(
                  titleText: 'FIND FISHES AROUND YOU',
                  subtitleText: 'Open Google maps',
                  leadingIcon: const Icon(Icons.map_sharp),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapPage()));
                  },
                ),
                HomePageCard(
                  titleText: 'FISH YOU ARE CURIOUS ABOUT',
                  subtitleText: 'See your favorite fish',
                  leadingIcon: const Icon(Icons.favorite_border_outlined),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoritePage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FishDescription extends StatelessWidget {
  const _FishDescription({
    required this.fishDescription,
  });
  final String fishDescription;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 20,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width -
                40, // Ekran genişliği - padding
            child: Text(
              fishDescription,
              style:
                  TextStyle(color: whiteColor.withOpacity(0.8), fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 3, // İstediğiniz satır sayısı
            ),
          ),
        ],
      ),
    );
  }
}

class _FishTitle extends StatelessWidget {
  const _FishTitle({
    required this.fishTitle,
  });

  final String fishOfTheDayText = "FISH OF THE DAY";
  final String fishTitle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fishOfTheDayText,
            style: TextStyle(color: whiteColor.withOpacity(0.8), fontSize: 12),
          ),
          Text(
            fishTitle,
            style: TextStyle(color: whiteColor, fontSize: 24),
          ),
        ],
      ),
    );
  }
}

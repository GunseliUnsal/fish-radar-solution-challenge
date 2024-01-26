import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:fish_radar/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:fish_radar/demos/home_page_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.fishDescription,
    required this.fishTitle,
    required this.pageController,
    required this.notchBottomBarController,
  }) : super(key: key);

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
            height: 300,
            width: 400,
            child: GestureDetector(
              onTap: () {
                widget.pageController.jumpToPage(2);
                widget.notchBottomBarController.jumpTo(2);
              },
              child: Stack(
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  _FishTitle(
                    fishTitle: widget.fishTitle,
                  ),
                  _FishDescription(
                    fishDescription: widget.fishDescription,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                HomePageCard(
                  titleText: 'LEARN HOW TO SAVE OCEAN',
                  subtitleText: 'Use our module',
                  leadingIcon: const Icon(Icons.school_outlined),
                  onTap: () {
                    // Burada istediğiniz işlemleri yapabilirsiniz.
                    print("1. kart");
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
                        builder: (context) => const MapPage(),
                      ),
                    );
                  },
                ),
                HomePageCard(
                  titleText: 'FISH YOU ARE CURIOUS ABOUT',
                  subtitleText: 'See your favorite fish',
                  leadingIcon: const Icon(Icons.favorite_border_outlined),
                  onTap: () {
                    // Burada istediğiniz işlemleri yapabilirsiniz.
                    print("3. kart");
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
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
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
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          Text(
            fishTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}

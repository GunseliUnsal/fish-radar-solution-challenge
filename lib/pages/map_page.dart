import 'package:fish_radar/demos/card.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            "Example Map Page",
            style: TextStyle(color: Colors.white),
          )),
          Expanded(
            child: ListView(
              children: [
                HomePageCard(
                  titleText: 'EXAMPLE MAP PAGE',
                  subtitleText: 'Use our module',
                  leadingIcon: const Icon(Icons.school_outlined),
                  onTap: () {},
                ),
                HomePageCard(
                  titleText: 'COMMON FISHES AROUND YOU',
                  subtitleText: 'Open Google maps',
                  leadingIcon: const Icon(Icons.map_sharp),
                  onTap: () {},
                ),
                HomePageCard(
                  titleText: 'EXAMPLE MAP PAGE',
                  subtitleText: 'See your favorite fish',
                  leadingIcon: const Icon(Icons.favorite_border_outlined),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

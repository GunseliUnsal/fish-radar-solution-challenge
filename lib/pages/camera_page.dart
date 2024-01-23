import 'package:fish_radar/demos/home_page_card.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text(
          "Example Camera Gemini Page",
          style: TextStyle(color: Colors.white),
        )),
        Expanded(
          child: ListView(
            children: [
              HomePageCard(
                titleText: 'EXAMPLE CAMERA GEMINI PAGE',
                subtitleText: 'Use our module',
                leadingIcon: const Icon(Icons.school_outlined),
                onTap: () {},
              ),
              HomePageCard(
                titleText: 'EXAMPLE GEMINI PAGE',
                subtitleText: 'Open Google maps',
                leadingIcon: const Icon(Icons.map_sharp),
                onTap: () {},
              ),
              HomePageCard(
                titleText: 'CAMERA GEMINI PAGE',
                subtitleText: 'See your favorite fish',
                leadingIcon: const Icon(Icons.favorite_border_outlined),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

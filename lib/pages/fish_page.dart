import 'package:fish_radar/demos/card.dart';
import 'package:flutter/material.dart';

class FishPage extends StatefulWidget {
  const FishPage({super.key});

  @override
  State<FishPage> createState() => _FishPageState();
}

class _FishPageState extends State<FishPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text(
          "Hello maloşi",
          style: TextStyle(color: Colors.white),
        )),
        Expanded(
          child: ListView(
            children: [
              CardExample(
                titleText: 'PUAHSDHKAJSDSAD',
                subtitleText: 'Use our module',
                leadingIcon: const Icon(Icons.school_outlined),
                onTap: () {},
              ),
              CardExample(
                titleText: 'BU FLUTTER COK ZEVKLİ',
                subtitleText: 'Open Google maps',
                leadingIcon: const Icon(Icons.map_sharp),
                onTap: () {},
              ),
              CardExample(
                titleText: 'BALIK TÜRLERİ HAKKINDA BİLGİ',
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

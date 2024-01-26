import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/navigator.dart';
import 'package:fish_radar/pages/map_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fish Radar',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NavigatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

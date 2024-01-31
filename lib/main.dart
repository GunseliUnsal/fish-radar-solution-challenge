import 'package:fish_radar/api/db/hive_service.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/navigator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:fish_radar/api/db/hive_model.dart';

Future<void> main() async {
  await HiveService.initHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NavigatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

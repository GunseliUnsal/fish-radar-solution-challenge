import 'dart:convert';
import 'dart:math';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_radar/api/model/fish_card_model.dart';
import 'package:fish_radar/api/model/fish_daily_model.dart';
import 'package:fish_radar/api/model/fish_model.dart';
import 'package:fish_radar/api/utils/constants.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/text_shimmer.dart';
import 'package:fish_radar/pages/education_page.dart';
import 'package:fish_radar/pages/fish_detail_page.dart';
import 'package:fish_radar/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:fish_radar/pages/favorite_page.dart';
import 'package:fish_radar/demos/home_page_card.dart';
import 'package:flutter/services.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.pageController,
      required this.notchBottomBarController});

  final PageController pageController;
  final NotchBottomBarController notchBottomBarController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  final String image = "assets/png/linear_fish.png";
  Random random = Random();
  late FishModel currentFish = FishModel(
      id: 128,
      name: "Blue shark",
      url: "https://en.wikipedia.org/wiki/Amberjack",
      imgSrcSet: ImgSrcSet(
          x1_5:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Tibur%C3%B3n_azul_%28Prionace_glauca%29%2C_canal_Fayal-Pico%2C_islas_Azores%2C_Portugal%2C_2020-07-27%2C_DD_28.jpg/330px-Tibur%C3%B3n_azul_%28Prionace_glauca%29%2C_canal_Fayal-Pico%2C_islas_Azores%2C_Portugal%2C_2020-07-27%2C_DD_28.jpg",
          x2: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Tibur%C3%B3n_azul_%28Prionace_glauca%29%2C_canal_Fayal-Pico%2C_islas_Azores%2C_Portugal%2C_2020-07-27%2C_DD_28.jpg/330px-Tibur%C3%B3n_azul_%28Prionace_glauca%29%2C_canal_Fayal-Pico%2C_islas_Azores%2C_Portugal%2C_2020-07-27%2C_DD_28.jpg"));

  @override
  void initState() {
    super.initState();
    _loadDailyFish();
  }

  Future<void> _loadDailyFish() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dailyFishModelString = prefs.getString('dailyFishModel');

    if (dailyFishModelString != null && dailyFishModelString.isNotEmpty) {
      FishDailyModel fishDailyModel =
          FishDailyModel.fromJson(jsonDecode(dailyFishModelString));
      if (fishDailyModel.day == _getCurrentFormattedDate()) {
        if (fishDailyModel.fishID != -1) {
          currentFish = await _getFishById(fishDailyModel.fishID ?? 138);
          _isLoading = false;
        } else {
          currentFish = await _generateDailyFish(fishDailyModel);
          _isLoading = false;
        }
      } else {
        currentFish = await _generateDailyFish(fishDailyModel);
        _isLoading = false;
      }
    } else {
      prefs.setString(
          'dailyFishModel',
          jsonEncode(
              FishDailyModel(day: _getCurrentFormattedDate(), fishID: -1)));
      _loadDailyFish();
    }
    setState(() {});
  }

  Future<void> _saveToPref(FishDailyModel fishDailyModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> fishDailyModelMap = fishDailyModel.toJson();
    prefs.setString('dailyFishModel', jsonEncode(fishDailyModelMap));
  }

  Future<FishModel> _generateDailyFish(FishDailyModel fishDailyModel) async {
    final String response = await rootBundle.loadString('assets/fish.json');
    List<dynamic> jsonList = jsonDecode(response);
    List<FishModel> fishList =
        jsonList.map((fish) => FishModel.fromJson(fish)).toList();

    if (fishDailyModel.preSelectedFish != null) {
      if (fishDailyModel.fishID != -1) {
        for (int fishID in fishDailyModel.preSelectedFish!) {
          int randomNumber = random.nextInt(fishList.length) + 1;

          if (randomNumber != fishID) {
            fishDailyModel.day = _getCurrentFormattedDate();
            fishDailyModel.fishID = randomNumber;
            fishDailyModel.preSelectedFish?.add(randomNumber);

            _saveToPref(fishDailyModel);
            break;
          } else if (fishDailyModel.preSelectedFish!.length ==
              fishList.length) {
            fishDailyModel.preSelectedFish = [];
            fishDailyModel.day = _getCurrentFormattedDate();
            fishDailyModel.fishID = randomNumber;
            fishDailyModel.preSelectedFish?.add(randomNumber);

            _saveToPref(fishDailyModel);
            break;
          }
        }
      } else {
        int randomNumber = random.nextInt(fishList.length) + 1;
        fishDailyModel.day = _getCurrentFormattedDate();
        fishDailyModel.fishID = randomNumber;
        fishDailyModel.preSelectedFish?.add(randomNumber);

        _saveToPref(fishDailyModel);
      }
    } else {
      int randomNumber = random.nextInt(fishList.length) + 1;
      fishDailyModel.day = _getCurrentFormattedDate();
      fishDailyModel.fishID = randomNumber;
      fishDailyModel.preSelectedFish?.add(randomNumber);

      _saveToPref(fishDailyModel);
    }

    return _getFishById(fishDailyModel.fishID!);
  }

  Future<FishModel> _getFishById(int id) async {
    final String response = await rootBundle.loadString('assets/fish.json');
    List<dynamic> jsonList = jsonDecode(response);
    List<FishModel> fishList =
        jsonList.map((fish) => FishModel.fromJson(fish)).toList();

    // Check if the fishList is empty
    if (fishList.isEmpty) {
      throw Exception('Fish list is empty');
    }

    // Use firstWhere with a default value to handle not found case
    return fishList.firstWhere(
      (element) => element.id == id,
      orElse: () {
        throw Exception('Fish with id $id not found');
      },
    );
  }

  String _getCurrentFormattedDate() {
    DateTime now = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(now);
  }

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
                        imageURL: currentFish.imgSrcSet!.x2 ??
                            currentFish.imgSrcSet!.x1_5 ??
                            "", // Use the appropriate image URL
                        name: currentFish.name,
                        description: '',
                        onTap: () {
                          // Handle tap action if needed
                        },
                      ),
                    ),
                  ),
                );
              },
              child: _isLoading
                  ? Image.asset(
                      "assets/png/placeholder.png",
                      width: double.maxFinite,
                    )
                  : Stack(
                      children: [
                        GradientImage(
                          imageUrl: currentFish.imgSrcSet!.x2 ??
                              currentFish.imgSrcSet!.x1_5 ??
                              "",
                        ),
                        _FishTitle(
                          fishTitle: currentFish.name,
                        ),
                        _FishDescription(fishName: currentFish.name)
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

class _FishDescription extends StatefulWidget {
  const _FishDescription({
    required this.fishName,
  });
  final String fishName;

  @override
  _FishDescriptionState createState() => _FishDescriptionState();
}

class _FishDescriptionState extends State<_FishDescription> {
  late String generatedGeminiText = "";
  final gemini = GoogleGemini(apiKey: Constants.GEMINI_API_KEY);
  @override
  void initState() {
    super.initState();
    generateGeminiText(widget.fishName);
  }

  void generateGeminiText(String fishName) {
    gemini
        .generateFromText(
            "Give 5 paragraphs of brief information about $fishName fish, do not skip lines, do not use special characters, do not order paragraphs")
        .then((value) {
      setState(() {
        generatedGeminiText = value.text;
      });
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return generatedGeminiText.isNotEmpty
        ? Positioned(
            bottom: 0,
            left: 20,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      40, // Ekran genişliği - padding
                  child: Text(
                    generatedGeminiText,
                    style: TextStyle(
                        color: whiteColor.withOpacity(0.8), fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3, // İstediğiniz satır sayısı
                  ),
                ),
              ],
            ),
          )
        : _FishDescriptionShimmer();
  }
}

class _FishDescriptionShimmer extends StatelessWidget {
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
              child: Shimmer.fromColors(
                direction: ShimmerDirection.ltr,
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 6,
                      width: 280,
                      color: shimmerColor.withOpacity(0.3),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 6,
                      width: 200,
                      color: shimmerColor.withOpacity(0.3),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 6,
                      width: 300,
                      color: shimmerColor.withOpacity(0.3),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 6,
                      width: 260,
                      color: shimmerColor.withOpacity(0.3),
                    ),
                  ],
                ),
              )),
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

class GradientImage extends StatelessWidget {
  final String imageUrl;

  const GradientImage({required this.imageUrl}); // Added 'const' for efficiency

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          width: double.infinity,
          height: 268,
          fit: BoxFit.cover,
          placeholder: (context, url) => Image.asset(
            "assets/png/placeholder.png",
            fit: BoxFit.fitWidth,
          ),
          errorWidget: (context, url, error) => Image.asset(
            "assets/png/placeholder.png", // Use a dedicated error image
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: 269, // Align gradient with image
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter, // Start gradient at bottom
              end: Alignment.topCenter, // End gradient at top
              colors: [
                backgroundColor,
                backgroundColor.withOpacity(0.0), // Top color fully transparent
              ],
            ),
          ),
        ),
      ],
    );
  }
}

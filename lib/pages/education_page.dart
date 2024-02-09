import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/module_page_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fish_radar/pages/climate_change.dart';
import 'package:fish_radar/pages/foreignspecies.dart';
import 'package:fish_radar/pages/humanimpact.dart';
import 'package:fish_radar/pages/overfishing.dart';
import 'package:fish_radar/pages/pollution.dart';
import 'package:fish_radar/pages/seatemperature.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    //Check the value saved from SharedPreferences when the page is created
    _loadProgressValue();
  }

  void _loadProgressValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double savedProgress = prefs.getDouble('progressValue') ?? 0.0;

    setState(() {
      progressValue = savedProgress;
    });
  }

  void _saveProgressValue() async {
    // Save progress value to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('progressValue', progressValue);
  }

  void _upgradeProgress(double value) {
    setState(() {
      progressValue += value;

      if (progressValue >= 1.0) {
        //Nothing reset
        progressValue = 1.0;
      }

      //Save the progress value at each increment
      _saveProgressValue();
    });
  }

  final PageController _controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      ModulePageCard(
        titleText: 'CLIMATE CHANGE',
        subtitleText:
            'In the fight against climate change, a global effort is crucial. Collaborative actions between individuals, communities, and nations are necessary to create sustainable solutions for a better future.',
        rowIcon: const ImageIcon(
          AssetImage("assets/icon/climate.png"),
          color: Colors.white,
          size: 70,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ClimateChange(onComplete: _upgradeProgress)));
        },
      ),
      ModulePageCard(
        titleText: 'OVERFISHING',
        subtitleText:
            'Overcoming the challenges of overfishing requires a collective effort from individuals, communities, and governments. By promoting sustainable practices and raising awareness, we can work towards preserving marine ecosystems for future generations.',
        rowIcon: const ImageIcon(
          AssetImage("assets/icon/overfishing.png"),
          color: Colors.white,
          size: 70,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Overfishing(onComplete: _upgradeProgress)));
        },
      ),
      ModulePageCard(
        titleText: 'POLLUTION',
        subtitleText:
            'Addressing pollution requires a collective effort at the individual, community, and societal levels. By adopting sustainable practices and advocating for positive change, we can contribute to a healthier and cleaner environment.',
        rowIcon: const ImageIcon(
          AssetImage("assets/icon/pollution.png"),
          color: Colors.white,
          size: 70,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Pollution(onComplete: _upgradeProgress)));
        },
      ),
      ModulePageCard(
        titleText: 'HUMAN IMPACT ON COASTAL AREAS',
        subtitleText:
            'Human impact on coastal areas is a global concern that requires a holistic approach. By promoting sustainable practices, responsible development, and community involvement, we can work towards preserving the ecological integrity of coastal environments for future generations.',
        rowIcon: const ImageIcon(
          AssetImage("assets/icon/humanimpact.png"),
          color: Colors.white,
          size: 70,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HumanImpact(onComplete: _upgradeProgress)));
        },
      ),
      ModulePageCard(
        titleText: 'FOREIGN SPECIES TO SEA CREATURES',
        subtitleText:
            'Addressing the introduction of foreign species to sea creatures requires coordinated efforts at the global and local levels. By supporting regulations, practicing responsible behavior, and promoting awareness, individuals can contribute to the preservation of marine biodiversity.',
        rowIcon: const ImageIcon(
          AssetImage("assets/icon/fishspecies.png"),
          color: Colors.white,
          size: 70,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ForeignSpecies(onComplete: _upgradeProgress)));
        },
      ),
      ModulePageCard(
        titleText: 'SEA TEMPETURE CHANGES',
        subtitleText:
            'Addressing sea temperature changes requires a collective effort to reduce human impact on the climate. By promoting sustainability, supporting climate-friendly policies, and raising awareness, individuals can contribute to the preservation of the health and balance of our oceans.',
        rowIcon: const ImageIcon(
          AssetImage("assets/icon/watertemperature.png"),
          color: Colors.white,
          size: 70,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SeaTemperature(onComplete: _upgradeProgress)));
        },
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.white, //button color
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Training Modules",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    "  (%${(progressValue * 100).toInt()})",
                    style: TextStyle(
                      color: shimmerColor.withOpacity(0.7),
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ]),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SizedBox(
                height: 430, // Card height
                child: PageView.builder(
                  itemCount: items.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return ListenableBuilder(
                      listenable: _controller,
                      builder: (context, child) {
                        double factor = 1;
                        if (_controller.position.hasContentDimensions) {
                          factor = 1 - (_controller.page! - index).abs();
                        }
                        return Center(
                          child: SizedBox(
                            height: 400 + (factor * 30),
                            child: Card(
                              color: bottomNavbarColor,
                              elevation: 4,
                              child: items[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}

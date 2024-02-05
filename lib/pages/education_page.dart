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

      if (progressValue >= 1.0){
        //Nothing reset
        progressValue = 1.0;
      }

      //Save the progress value at each increment
      _saveProgressValue();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Training Modules",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: LinearPercentIndicator(
                  lineHeight: 20,
                  percent: progressValue,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.green,
                ),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ModulePageCard(
                    titleText: 'CLIMATE CHANGE',
                    subtitleText: 'Use our module',
                    rowIcon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClimateChange(onComplete: _upgradeProgress)));
                    },
                  ),
                  ModulePageCard(
                    titleText: 'OVERFISHING',
                    subtitleText: 'Use our module',
                    rowIcon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Overfishing(onComplete: _upgradeProgress)));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ModulePageCard(
                    titleText: 'POLLUTION',
                    subtitleText: 'Use our module',
                    rowIcon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Pollution(onComplete: _upgradeProgress)));
                    },
                  ),
                  ModulePageCard(
                    titleText: 'HUMAN IMPACT ON COASTAL AREAS',
                    subtitleText: 'Use our module',
                    rowIcon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HumanImpact(onComplete: _upgradeProgress)));
                    },
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ModulePageCard(
                    titleText: 'FOREIGN SPECIES TO SEA CREATURES',
                    subtitleText: 'Use our module',
                    rowIcon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForeignSpecies(onComplete: _upgradeProgress)));
                    },
                  ),
                  ModulePageCard(
                    titleText: 'SEA TEMPETURE CHANGES',
                    subtitleText: 'Use our module',
                    rowIcon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeaTemperature(onComplete: _upgradeProgress)));
                    },
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
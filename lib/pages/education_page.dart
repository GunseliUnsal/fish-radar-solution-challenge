import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/module_page_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  double progressValue = 0.0;

  void startProgress() {
    // Bu metod, düğmeye tıklandığında ilerleme çubuğunu bir dilim artırmak için kullanılacak.
    const double slice = 0.142;

    setState(() {
      progressValue += slice;

      if (progressValue >= 1.0) {
        // Eğer ilerleme çubuğu tamamen dolarsa, sıfırla.
        progressValue = 0.0;
      }
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
              const Center(
                child: Text(
                  "Example Education Page",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

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

              LinearPercentIndicator(
                lineHeight: 20,
                percent: progressValue,
                linearStrokeCap: LinearStrokeCap.roundAll,
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
                    onTap: () {},
                  ),
                  ModulePageCard(
                    titleText: 'OVERFISHING',
                    subtitleText: 'Use our module',
                    rowIcon: const Icon(
                      Icons.water_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {},
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
                    onTap: () {},
                  ),
                  ModulePageCard(
                    titleText: 'HUMAN IMPACT ON COASTAL AREAS',
                    subtitleText: 'Use our module',
                    rowIcon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {},
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
                    onTap: () {},
                  ),
                  ModulePageCard(
                    titleText: 'SEA TEMPETURE CHANGES',
                    subtitleText: 'Use our module',
                    rowIcon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {},
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ModulePageCard(
                    titleText: 'CORAL REEF DAMAGES',
                    subtitleText: 'Use our module',
                    rowIcon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {},
                  ),
                  ElevatedButton(
                    /*
                    This button is just to control the progress of the bar.
                    In the second editing part, I will remove this and replace it
                    with the version in the design.
                     */
                    onPressed: startProgress,
                    child: Icon(
                      Icons.plus_one_outlined,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';

class ClimateChange extends StatelessWidget {
  //Callback function received from EducationPage
  final void Function(double) onComplete;

  //Constructor to receive the callback
  const ClimateChange({Key? key, required this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white, //button color
        ),
        title: const Text(
          'Climate Change',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'assets/images/climatechange.jpg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'In the fight against climate change, a global effort is crucial. Collaborative actions between individuals, communities, and nations are necessary to create sustainable solutions for a better future.',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                ExpansionTile(
                  title: Text(
                    'What is Climate Change?\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      'Climate change refers to systematic alterations observed in long-term weather patterns worldwide. These changes result from the accumulation of greenhouse gases in the atmosphere, disrupting natural climate patterns. Climate change brings about a range of effects such as temperature rise, sea-level elevation, extreme weather events, and shifts in ecosystems.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Causes of Climate Change\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1. Greenhouse Gas Emissions: Human activities like fossil fuel usage, industrial processes, and deforestation contribute to the accumulation of greenhouse gases in the atmosphere. These gases trap heat, leading to an increase in global temperatures.\n'
                      '2. Deforestation: The clearing of forest areas reduces carbon absorption, contributing to increased carbon emissions into the atmosphere. Forests play a crucial role in mitigating climate change.\n'
                      '3. Industrial Activities: Emissions from industrial facilities increase greenhouse gas concentrations, contributing to climate change.\n\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Effects of Climate Change\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1. Temperature Rise: Global warming leads to more frequent and severe heatwaves, droughts, and temperature-related events.\n'
                      '2. Sea-Level Rise: Melting ice caps and glaciers cause sea levels to rise, affecting coastal areas with increased risks of erosion and flooding.\n'
                      '3. Extreme Weather Events: Hurricanes, floods, droughts, and wildfires become more frequent and intense due to climate change.\n'
                      '4. Ecosystem Changes: Temperature shifts impact the distribution of plant and animal species, causing habitat loss and species extinction.\n\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Solutions to Climate Change\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1. Sustainable Energy Use: Transitioning to clean and renewable energy sources can reduce reliance on fossil fuels, decreasing greenhouse gas emissions.\n'
                      '2. Supporting Forestry: Sustainable forest management and reforestation projects enhance carbon absorption, aiding in climate change mitigation.\n'
                      '3. Energy Efficiency: Embracing energy-efficient technologies and practices can reduce overall energy consumption, lowering greenhouse gas emissions.\n\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'What Can We Do?\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1. Conscious Consumption: Opting for sustainable products, minimizing energy consumption, and reducing waste contribute to individual efforts in combating climate change.\n'
                      '2. Community Engagement: Raising awareness about climate change and advocating for policy changes at the community level is essential to drive larger societal shifts.\n'
                      '3. Green Transportation: Choosing public transport, cycling, or walking as eco-friendly transportation options helps individuals reduce their carbon footprint.\n\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool alreadyClicked = prefs.getBool('climateChangeClicked') ?? false;

          if (!alreadyClicked) {
            // Call the callback with the current progress
            onComplete(0.166);
            prefs.setBool('climateChangeClicked', true);

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Congratulations!'), //completed button
                  content: const Text('You have completed this module.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Okay'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

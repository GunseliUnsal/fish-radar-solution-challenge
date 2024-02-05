import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';

class Pollution extends StatelessWidget {
  //Callback function received from EducationPage
  final void Function(double) onComplete;

  //Constructor to receive the callback
  const Pollution({Key? key, required this.onComplete}) : super(key: key);

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
          'Pollution',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'assets/images/pollution.jpg',
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
                  'Addressing pollution requires a collective effort at the individual, community, and societal levels. By adopting sustainable practices and advocating for positive change, we can contribute to a healthier and cleaner environment.',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                ExpansionTile(
                  title: Text(
                    'Varieties of Pollution\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      'Pollution manifests in various forms, each posing unique challenges to the environment and human health. Common types include air pollution, water pollution, soil contamination, noise pollution, and light pollution.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Causes of Pollution\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Industrial Activities: Factories and manufacturing processes release pollutants into the air and water, contributing significantly to pollution.\n'
                          '2.	Vehicle Emissions: Combustion engines emit pollutants, such as carbon monoxide and particulate matter, leading to air pollution.\n'
                          '3.	Improper Waste Disposal: Inadequate waste management, including improper disposal of plastics and hazardous waste, contaminates land and water.\n\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Effects of Pollution\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Health Impacts: Air pollution can cause respiratory diseases, while water contamination may lead to waterborne illnesses. Long-term exposure to pollutants is linked to chronic health issues.\n'
                          '2.	Biodiversity Loss: Pollution negatively affects ecosystems, leading to the decline of plant and animal species and disrupting food chains.\n'
                          '3.	Climate Change: Certain pollutants contribute to the greenhouse effect, exacerbating global warming and climate change.\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Solutions to Pollution\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Reducing Emissions: Implementing and enforcing strict emission standards for industries and vehicles can reduce air pollution.\n'
                          '2.	Waste Reduction and Recycling: Promoting waste reduction, recycling programs, and proper disposal methods help minimize the impact of improper waste management.\n'
                          '3.	Green Technologies: Investing in and adopting eco-friendly technologies can reduce the environmental footprint of industrial processes.\n\n',
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
                      '1.	Reduce Energy Consumption: Use energy-efficient appliances, switch to renewable energy sources, and practice energy conservation in daily activities.\n'
                          '2.	Promote Sustainable Transportation: Choose public transportation, carpool, bike, or walk to reduce vehicle emissions. Consider electric or hybrid vehicles.\n'
                          '3.	Practice Responsible Consumption: Opt for products with minimal packaging, recycle, and choose environmentally friendly alternatives to reduce waste.\n'
                          '4.	Support Environmental Policies: Advocate for and support policies that regulate and reduce pollution. Participate in community clean-up initiatives.\n'
                          '5.	Educate and Raise Awareness: Spread awareness about the impact of pollution and educate others on sustainable practices. Encourage environmentally responsible behaviors.\n\n',
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
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool alreadyClicked = prefs.getBool('pollutionClicked') ?? false;

          if (!alreadyClicked) {
            // Call the callback with the current progress
            onComplete(0.166);
            prefs.setBool('pollutionClicked', true);

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
import 'package:flutter/material.dart';

class SeaTemperature extends StatelessWidget {
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
          'Sea Temperature Changes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 6, 56, 97),
      ),
      backgroundColor: const Color.fromARGB(255, 6, 56, 97),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'assets/images/seatemperature.png', //image
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
                  'Addressing sea temperature changes requires a collective effort to reduce human impact on the climate. By promoting sustainability, supporting climate-friendly policies, and raising awareness, individuals can contribute to the preservation of the health and balance of our oceans.',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                ExpansionTile(
                  title: Text(
                    'Causes of Sea Temperature Changes\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Climate Change: Human activities, such as the burning of fossil fuels, deforestation, and industrial processes, contribute to the release of greenhouse gases, leading to global warming and subsequent changes in sea temperatures.\n'
                      '2.	Ocean Currents: Natural variations in ocean currents can result in localized changes in sea temperatures, influencing the climate of coastal areas.\n'
                      '3.	El Niño and La Niña Events: Periodic climate phenomena like El Niño and La Niña can lead to abnormal warming or cooling of sea surface temperatures, impacting weather patterns globally.\n\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Effects of Sea Temperature Changes\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Coral Bleaching: Elevated sea temperatures can cause coral reefs to expel symbiotic algae, resulting in coral bleaching and the deterioration of reef ecosystems.\n'
                      '2.	Melting Ice Caps and Glaciers: Warmer sea temperatures contribute to the melting of polar ice caps and glaciers, leading to rising sea levels and threats to coastal communities.\n'
                      '3.	Shifts in Marine Ecosystems: Changes in sea temperatures can alter the distribution and migration patterns of marine species, affecting the balance of marine ecosystems.\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Solutions to Mitigate Sea Temperature Changes\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Reducing Greenhouse Gas Emissions: Implementing measures to reduce carbon emissions and transitioning to renewable energy sources can help mitigate global warming and sea temperature changes.\n'
                      '2.	Conservation of Coastal Vegetation: Protecting and restoring coastal vegetation, such as mangroves and seagrasses, can act as natural buffers against the impacts of rising sea temperatures.\n'
                      '3.	Sustainable Fishing Practices: Implementing sustainable fishing practices helps maintain the health of marine ecosystems, preventing the further disruption caused by temperature changes.\n\n',
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
                      '1.	Conserve Energy: Reduce energy consumption to minimize the release of greenhouse gases. Use energy-efficient appliances and support renewable energy initiatives.\n'
                      '2.	Support Climate Policies: Advocate for and support policies aimed at addressing climate change, reducing emissions, and protecting marine environments.\n'
                      '3.	Practice Responsible Tourism: Choose eco-friendly tourism options that prioritize the conservation of marine ecosystems and promote sustainable practices.\n'
                      '4.	Raise Awareness: Educate others about the impacts of sea temperature changes on marine life and ecosystems. Encourage environmentally conscious choices in daily life.\n\n',
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
        onPressed: () {
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
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

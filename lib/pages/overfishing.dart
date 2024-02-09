import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';

class Overfishing extends StatelessWidget {
  //Callback function received from EducationPage
  final void Function(double) onComplete;

  //Constructor to receive the callback
  const Overfishing({Key? key, required this.onComplete}) : super(key: key);

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
          'Overfishing',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'assets/images/overfishing.jpg',
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
                  'Overcoming the challenges of overfishing requires a collective effort from individuals, communities, and governments. By promoting sustainable practices and raising awareness, we can work towards preserving marine ecosystems for future generations.',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                ExpansionTile(
                  title: Text(
                    'What is Overfishing?\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      'Overfishing is a phenomenon where the rate of fishing exceeds the ability of fish populations to reproduce and replenish themselves. This unsustainable practice depletes marine resources, disrupts ecosystems, and poses a significant threat to global fisheries.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Causes of Overfishing\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Overcapacity: Advances in fishing technology, such as larger vessels and more efficient gear, have led to an overcapacity in the fishing industry. This enables the capture of larger quantities of fish than ecosystems can naturally sustain.\n'
                      '2.	Unregulated Fishing: In many regions, inadequate or lax regulations contribute to overfishing. The absence of effective fisheries management allows for excessive exploitation of marine species.\n'
                      '3.	Illegal, Unreported, and Unregulated (IUU) Fishing: IUU fishing undermines conservation efforts by operating outside legal frameworks. This illicit activity often goes unnoticed, exacerbating overfishing issues.\n\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Effects of Overfishing\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Depletion of Fish Stocks: Overfishing leads to a rapid decline in fish populations, threatening the livelihoods of fishing communities and depleting a critical food source for billions of people.\n'
                      '2.	Ecosystem Imbalance: Removing specific fish species in large numbers disrupts the balance within marine ecosystems. This imbalance can have cascading effects on other species and the overall health of the ocean.\n'
                      '3.	Loss of Biodiversity: Overfishing contributes to the decline of various fish species, impacting biodiversity and reducing the resilience of marine ecosystems to environmental changes.\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Solutions to Overfishing\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Effective Fisheries Management: Implementing and enforcing science-based fisheries management plans can help regulate fishing activities, set catch limits, and protect vulnerable species.\n'
                      '2.	Marine Protected Areas (MPAs): Establishing MPAs helps conserve marine habitats and allows fish populations to recover by limiting human interference in designated areas.\n'
                      '3.	Technological Innovation: Developing and promoting sustainable fishing practices and gear, such as selective fishing gear and bycatch reduction devices, can minimize the impact on non-target species.\n\n',
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
                      '1.	Choose Sustainable Seafood: Make informed choices by opting for sustainably sourced seafood. Look for eco-certifications and labels indicating that the seafood comes from well-managed fisheries.\n'
                      '2.	Support Responsible Fishing Practices: Support businesses and fisheries that adhere to sustainable and responsible fishing practices. Encourage the adoption of eco-friendly measures within the industry.\n'
                      '3.	Raise Awareness: Educate others about the consequences of overfishing and the importance of sustainable fishing practices. Advocate for stronger regulations and responsible consumption.\n\n',
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
          bool alreadyClicked = prefs.getBool('overfishingClicked') ?? false;

          if (!alreadyClicked) {
            // Call the callback with the current progress
            onComplete(0.166);
            prefs.setBool('overfishingClicked', true);

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

import 'package:flutter/material.dart';

class HumanImpact extends StatelessWidget {
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
          'Foreign Species to Sea Creatures',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 6, 56, 97),
      ),
      backgroundColor: const Color.fromARGB(255, 6, 56, 97),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'assets/images/foreignspecies.jpg',
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
                  'Addressing the introduction of foreign species to sea creatures requires coordinated efforts at the global and local levels. By supporting regulations, practicing responsible behavior, and promoting awareness, individuals can contribute to the preservation of marine biodiversity.',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                ExpansionTile(
                  title: Text(
                    'Causes of Introduction of Foreign Species to Sea Creatures\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Ballast Water Discharge: Ships often discharge ballast water in new locations, unintentionally introducing non-native species to different ecosystems.\n'
                      '2.	Aquaculture Practices: Intentional or accidental release of farmed species into the wild can lead to the introduction of non-indigenous organisms.\n'
                      '3.	Global Trade: Movement of goods between countries can result in the transfer of marine species attached to ship hulls or transported in trade vessels.\n\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Effects of Introduction of Foreign Species\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Competition for Resources: Non-native species may outcompete native species for resources such as food and habitat, leading to population declines among local marine life.\n'
                      '2.	Predation and Disruption: Foreign predators may prey on native species, upsetting the balance within ecosystems and contributing to declines in native populations.\n'
                      '3.	Altered Ecosystem Dynamics: The introduction of foreign species can disrupt natural ecosystem processes and interactions, leading to cascading effects on biodiversity.\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Solutions to Address the Introduction of Foreign Species\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Ballast Water Management: Implementing effective ballast water treatment and management practices can help reduce the unintentional spread of non-native species.\n'
                      '2.	Strict Aquaculture Regulations: Implementing and enforcing regulations to prevent the release of farmed species into the wild can minimize the impact on native ecosystems.\n'
                      '3.	Biosecurity Measures: Implementing biosecurity measures in trade and transportation to prevent the unintentional transfer of marine species between regions.\n\n',
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
                      '1.	Support Legislation: Advocate for and support the implementation of international and national legislation aimed at regulating the introduction and spread of foreign species.\n'
                      '2.	Be Mindful of Aquaculture Practices: Choose seafood from responsibly managed aquaculture operations and be aware of the potential environmental impacts of certain aquaculture practices.\n'
                      '3.	Practice Responsible Boating: Clean boat hulls thoroughly to prevent the inadvertent transfer of marine organisms between different water bodies.\n'
                      '4.	Educate Others: Raise awareness about the importance of preventing the introduction of foreign species to sea creatures and the potential consequences for marine ecosystems.\n\n',
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

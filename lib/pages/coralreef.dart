import 'package:flutter/material.dart';

class CoralReef extends StatelessWidget {
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
          'Coral Reef Damages',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 6, 56, 97),
      ),
      backgroundColor: const Color.fromARGB(255, 6, 56, 97),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'assets/images/coralreef.webp', //image
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
                  'Coral reef damages pose a significant threat to marine biodiversity, economies, and cultures worldwide. Addressing these issues requires a collective effort, from global initiatives to individual actions. By understanding the causes, effects, and potential solutions, we can work towards preserving these vital ecosystems for current and future generations.',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                ExpansionTile(
                  title: Text(
                    'Causes of Coral Reef Damages\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Climate Change: Rising sea temperatures and ocean acidification, both driven by climate change, contribute to coral bleaching and hinder the growth and resilience of coral reefs.\n'
                      '2.	Overfishing: Unregulated and excessive fishing practices, including the use of destructive gear, compromise the balance of coral reef ecosystems by depleting key species and disrupting food chains.\n'
                      '3.	Pollution: Runoff from land-based activities introduces pollutants such as agricultural runoff, chemicals, and plastics into the ocean, negatively impacting coral health and contributing to diseases.\n'
                      '4.	Coastal Development: Urbanization and coastal infrastructure projects often result in habitat destruction, increased sedimentation, and pollution, all of which harm coral reefs.\n'
                      '5.	Invasive Species: The introduction of non-native species, whether intentionally or accidentally, can outcompete or prey on native coral reef organisms, disrupting the delicate ecological balance.\n\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Effects of Coral Reef Damages\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1. Loss of Biodiversity: Coral reef damages lead to the decline of various marine species, impacting the biodiversity and ecological richness that these ecosystems support.\n'
                      '2.	Economic Impact: Fishing and tourism industries that rely on healthy coral reefs suffer economic losses, affecting the livelihoods of coastal communities.\n'
                      '3.	Decline in Ecosystem Services: Coral reefs provide essential ecosystem services, such as shoreline protection and nutrient cycling. Damages to reefs result in a loss of these crucial functions.\n'
                      '4.	Cultural Disruption: Many communities around the world have cultural ties to coral reefs. Damages to these ecosystems can lead to a loss of cultural identity and practices.\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Solutions to Coral Reef Damages\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Climate Change Mitigation: Implement and support initiatives that reduce greenhouse gas emissions to mitigate the impacts of climate change on coral reefs.\n'
                      '2.	Sustainable Fishing Practices: Enforce and adopt sustainable fishing practices to ensure the long-term health of coral reef ecosystems.\n'
                      '3.	Marine Protected Areas (MPAs): Establish and effectively manage MPAs to provide safe havens for coral reefs, allowing them to recover and thrive.\n'
                      '4.	Waste Reduction and Recycling: Minimize plastic pollution and other forms of marine debris by practicing responsible waste disposal and supporting recycling programs.\n\n',
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
                      '1.	Conscious Consumer Choices: Choose sustainable seafood options and products that are environmentally friendly to reduce the demand for practices that harm coral reefs.\n'
                      '2.	Participate in Coral Reef Conservation Programs: Support and engage in local and global coral reef conservation initiatives, whether through volunteer work, donations, or awareness campaigns.\n'
                      '3.	Educate and Advocate: Raise awareness about the importance of coral reefs and advocate for policies that promote their protection at the local, national, and international levels.\n'
                      '4.	Responsible Tourism: When visiting coral reef areas, engage in eco-friendly tourism activities and adhere to guidelines that minimize your impact on these delicate ecosystems.\n\n',
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

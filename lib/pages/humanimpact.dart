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
          'Human Impact on Coastal Areas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 6, 56, 97),
      ),
      backgroundColor: const Color.fromARGB(255, 6, 56, 97),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'assets/images/humanimpact.jpg',
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
                  'Human impact on coastal areas is a global concern that requires a holistic approach. By promoting sustainable practices, responsible development, and community involvement, we can work towards preserving the ecological integrity of coastal environments for future generations.',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                ExpansionTile(
                  title: Text(
                    'Causes of Human Impact on Coastal Areas\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Urbanization: Rapid population growth and urban development along coastlines lead to habitat destruction and increased pressure on natural resources.\n'
                      '2.	Industrial Activities: Coastal industries contribute to pollution, habitat degradation, and the alteration of coastal ecosystems.\n'
                      '3.	Tourism: Uncontrolled tourism can lead to shoreline erosion, damage to coral reefs, and the loss of biodiversity in coastal regions.\n\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Effects of Human Impact on Coastal Areas\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Loss of Biodiversity: Habitat destruction, pollution, and overexploitation of marine resources result in a decline in coastal biodiversity.\n'
                      '2.	Shoreline Erosion: Alterations to natural coastal features, including construction and dredging, can exacerbate erosion and increase the vulnerability of coastal communities to storms.\n'
                      '3.	Coral Reef Degradation: Human activities, such as overfishing and pollution, contribute to the degradation of coral reefs, impacting marine life and coastal protection.\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Solutions to Mitigate Human Impact\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Text(
                      '1.	Sustainable Coastal Development: Implementing sustainable urban planning practices helps balance human needs with the preservation of coastal ecosystems.\n'
                      '2.	Marine Protected Areas (MPAs): Establishing MPAs helps conserve marine habitats and allows ecosystems to recover from human disturbances.\n'
                      '3.	Responsible Tourism Practices: Encouraging responsible tourism, including guidelines for marine activities, reduces the negative impact on coastal environments.\n\n',
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
                      '1.	Conserve Water Resources: Reduce water consumption to alleviate the stress on coastal ecosystems and prevent saltwater intrusion.\n'
                      '2.	Promote Sustainable Fishing: Support sustainable fishing practices, adhere to catch limits, and choose seafood from responsibly managed fisheries.\n'
                      '3.	Participate in Coastal Clean-ups: Engage in community-led initiatives to clean up coastal areas, removing debris and preventing pollution.\n'
                      '4.	Advocate for Environmental Policies: Support and advocate for policies that regulate coastal development, protect habitats, and promote sustainable practices.\n'
                      '5.	Raise Awareness: Educate communities about the importance of coastal ecosystems, the impact of human activities, and the need for conservation efforts.\n\n',
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

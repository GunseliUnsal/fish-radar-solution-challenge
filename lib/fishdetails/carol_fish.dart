import 'package:fish_radar/constants/colors.dart';
import 'package:flutter/material.dart';

//sea bass = levrek
class CarolFish extends StatefulWidget {
  const CarolFish({super.key});

  @override
  State<CarolFish> createState() => _CarolFishState();
}

class _CarolFishState extends State<CarolFish> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRect(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [backgroundColor, Colors.black.withOpacity(0.5)],
                      stops: const [0.02, 0.7], //shading in photo
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcATop,
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/fish_pic/carolfish.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: whiteColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),

              Positioned(
                top: 30,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color:
                    isFavorite ? Colors.red : Colors.white,
                  ),
                ),
              ),

              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  'Coral (Grouper)',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text(
                  'Coral (Epinephelus)',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  'About\n\n'
                      'Coral is a popular marine fish that lives in warm and temperate seas. It is known for its solid structure and delicious meat.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  'FEATURES\n\n'
                      'The coral generally has a thick body and a wide mouth. The scales are large and their colors may vary. On average, it can reach a length of 60-120 cm.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  'IMPORTANCE\n\n'
                      'Coral is a valuable fish in gastronomy. It is used in various dishes in restaurants and home kitchens.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  'PLACES OF RESIDENCE\n\n'
                      'Coral is commonly found in tropical and subtropical seas. Coral reefs, rocky areas and shallow waters are its preferred habitats.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  'MIGRATION BEHAVIOR\n\n'
                      'Corals generally have a stationary lifestyle, but some species can migrate seasonally to different depths.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  'Nutrition\n\n'
                      'It feeds on corals, other fish, crustaceans and seafood. Baking or grilling this fish helps it retain its flavor.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

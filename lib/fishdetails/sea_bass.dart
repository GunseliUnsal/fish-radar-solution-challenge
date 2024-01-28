import 'package:fish_radar/constants/colors.dart';
import 'package:flutter/material.dart';

//sea bass = levrek
class SeaBassPage extends StatefulWidget {
  const SeaBassPage({super.key});

  @override
  State<SeaBassPage> createState() => _SeaBassPageState();
}

class _SeaBassPageState extends State<SeaBassPage> {
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
                          image: AssetImage("assets/fish_pic/seabass.jpeg"),
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
                  'Sea Bass',
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
                    'Sea Bass (Dicentrarchus labrax)',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    'About\n\n'
                        'Sea bass is a delicious sea fish that lives in cold and temperate waters. It is usually found in coastal areas and shallow waters. Its meat is white and delicious, making it a popular consumption fish.',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Text(
                    'FEATURES\n\n'
                        'Sea bass is a fish with a body slightly tucked to the sides and shiny silver scales. On average, it can reach 70 cm in length, but some can reach larger sizes.',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                     ),
                  ),
                  const SizedBox(height: 15),

                  Text(
                    'IMPORTANCE\n\n'
                        'Sea bass is an important species in commercial and sport fishing. It is a fish preferred in restaurants and home kitchens due to its delicious meat.',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Text(
                    'PLACES OF RESIDENCE\n\n'
                        'Sea bass is found in regions such as the northern and eastern coasts of the Atlantic Ocean, the Mediterranean, the Black Sea, and the Marmara Sea.',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Text(
                    'MIGRATION BEHAVIOR\n\n'
                        'Sea bass can make seasonal migrations depending on temperature changes and breeding season.',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Text(
                    'Nutrition\n\n'
                        'Sea bass generally feeds on small fish, crustaceans, and mollusks. Consumers are advised to flavor the fish with fresh herbs and mild spices while cooking it.',
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

import 'package:fish_radar/constants/colors.dart';
import 'package:flutter/material.dart';

//GiltheadSeaBream = çipura
class GiltheadSeaBream extends StatefulWidget {
  const GiltheadSeaBream({super.key});

  @override
  State<GiltheadSeaBream> createState() => _GiltheadSeaBreamState();
}

class _GiltheadSeaBreamState extends State<GiltheadSeaBream> {
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
                        image: AssetImage("assets/fish_pic/giltheadsea.jpg"),
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
                  'Gilthead Sea Bream',
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
                  'Sea Bream (Sparus aurata)',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  'About\n\n'
                      'Sea bream is a popular marine fish that lives in warm and temperate seas. It is known for its delicious meat and golden head.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  'FEATURES\n\n'
                      'Sea bream is a popular marine fish that lives in warm and temperate seas. It is known for its delicious meat and golden head.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  'IMPORTANCE\n\n'
                      'Sea bream is a fish that is in high demand in gastronomy. It is widely used in restaurants and home kitchens.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  'PLACES OF RESIDENCE\n\n'
                      'Sea bream is found in the Mediterranean, Aegean Sea and some parts of the Atlantic Ocean. Shallow beaches and rocky areas are its preferred habitats.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  'MIGRATION BEHAVIOR\n\n'
                      'Sea bream generally have a sedentary lifestyle, but they may migrate seasonally to shallow waters.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  'Nutrition\n\n'
                      'It feeds on sea bream, shellfish, small fish and molluscs. It is recommended to cook it baked or grilled, which preserves its flavor.',
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

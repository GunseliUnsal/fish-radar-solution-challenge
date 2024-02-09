import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_radar/api/utils/constants.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/text_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../api/model/fish_card_model.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FishDetailPage extends StatefulWidget {
  final FishCardModel fishCard;
  FishDetailPage({Key? key, required this.fishCard}) : super(key: key);

  @override
  _FishDetailPageState createState() => _FishDetailPageState();
}

class _FishDetailPageState extends State<FishDetailPage> {
  bool isGeminiTextGenerated = false;
  late String generatedGeminiText;
  final gemini = GoogleGemini(apiKey: Constants.GEMINI_API_KEY);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateGeminiText();
  }

  void generateGeminiText() {
    gemini
        .generateFromText(
            "Give detailed and regular information about ${widget.fishCard.name} fish, JUST return all answer html body format.")
        .then((value) {
      setState(() {
        generatedGeminiText = value.text.replaceAll("```html", "");
        isGeminiTextGenerated = true;
        print(value.text);
      });
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    child: CachedNetworkImage(
                      colorBlendMode: BlendMode.darken,
                      alignment: Alignment.topRight,
                      fadeInCurve: Curves.easeIn,
                      imageUrl: widget.fishCard.imageURL,
                      placeholder: (context, url) => Image.asset(
                        "assets/png/placeholder.png",
                        fit: BoxFit.fitWidth,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/png/placeholder.png",
                        fit: BoxFit.fitWidth,
                      ),
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 44, left: 8),
                  child: IconButton(
                    color: Colors.white.withOpacity(0.2),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white.withOpacity(0.7),
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.fishCard.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey.withOpacity(0.2),
            ),
            if (isGeminiTextGenerated)
              Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: Column(
                    children: [
                      HtmlWidget(
                        generatedGeminiText,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const FeedBack()
                    ],
                  ))
            else
              const ShimmerColumnWidget(count: 20),
          ],
        ),
      ),
    );
  }
}

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  double initialRate = 5;
  var txt = TextEditingController();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            )),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.all(16),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "How Would You Rate Our App ?",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          RatingBar.builder(
                            initialRating: initialRate,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              initialRate = rating;
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Please Let us know how can we improve ourselves",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors
                                    .grey, // Choose your desired border color
                                width: 1.0, // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.circular(
                                  8.0), // Adjust the border radius as needed
                            ),
                            child: TextField(
                              controller: txt,
                              maxLength: 500,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(
                                    8.0), // Adjust content padding as needed
                                hintText:
                                    'Your Feedback...', // Add any placeholder text if needed
                                border: InputBorder
                                    .none, // Remove TextField's default border
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                    onPressed: _loading
                                        ? null
                                        : () {
                                            Navigator.pop(context);
                                          },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: backgroundColor),
                                    )),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: backgroundColor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                    onPressed: _loading
                                        ? null
                                        : () async {
                                            String message = "";
                                            if (txt.text.isNotEmpty) {
                                              _loading = true;
                                              try {
                                                final collection =
                                                    FirebaseFirestore.instance
                                                        .collection("feedback");
                                                await collection.doc().set({
                                                  'timestamp': FieldValue
                                                      .serverTimestamp(),
                                                  'rate': initialRate,
                                                  'message': txt.text,
                                                });
                                                _loading = false;
                                                message =
                                                    "Feedback sent succesfully";
                                              } catch (e) {
                                                print(e);
                                                _loading = false;
                                                message =
                                                    "Error when sending Feedback";
                                              }

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(message)));
                                              Navigator.pop(context);
                                            } else {
                                              message =
                                                  "Feedback cannot be empty.";
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(message)));
                                            }
                                          },
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: (Text(
          "Give us feedback",
          style: TextStyle(
              color: backgroundColor,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        )));
  }
}

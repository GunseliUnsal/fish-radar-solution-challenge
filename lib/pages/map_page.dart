import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:fish_radar/api/model/fish_map_model.dart';
import 'package:fish_radar/api/utils/constants.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/fish_map_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  late LatLng _currentPosition;
  bool _isLoading = true;

  late String generatedGeminiText;
  final gemini = GoogleGemini(apiKey: Constants.GEMINI_API_KEY);

  List<FishMapModel> _fishMapList = [];
  bool _isFishMapListLoading = true;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);
    generateGeminiText(location);
    setState(() {
      _currentPosition = location;
      _isLoading = false;
    });
  }

  void geminiList(String geminiString) async {
    try {
      print(" STRİNG : " + geminiString.toString());
      List<dynamic> jsonList = jsonDecode(geminiString);
      List<FishMapModel> fishMapList =
          jsonList.map((e) => FishMapModel.fromJson(e)).toList();
      _isFishMapListLoading = false;
      _fishMapList = fishMapList;

      print(" LİST : " + _fishMapList.toString());
    } catch (e) {
      print(" CATCH ERROR : " + e.toString());
    }
  }

  void generateGeminiText(LatLng location) {
    gemini.generateFromText(
        """List the fish that can be found in the $location, if it is forbidden to keep the fish, indicate this with a description under the warning and return the entire answer in json form as follows:
      [
        {
          "fish_name":"fish",
          "description":"description",
          "warning": true,
          "warning_description" : ""
        }
      ]
      """).then((value) {
      setState(() {
        generatedGeminiText = value.text;
        generatedGeminiText =
            generatedGeminiText.replaceAll("```json", "").replaceAll("```", "");
        geminiList(generatedGeminiText);
      });
    }).catchError((e) => print(e));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _isLoading
          ? permissionRequired()
          : Stack(children: [
              GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                zoomGesturesEnabled: false,
                rotateGesturesEnabled: false,
                myLocationButtonEnabled: false,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _currentPosition,
                  zoom: 12.0,
                ),
                scrollGesturesEnabled: false,
                onCameraMove: null,
                circles: {
                  Circle(
                      circleId: const CircleId('currentCircle'),
                      center: _currentPosition,
                      radius: 3000,
                      fillColor: lightBlueColor.withOpacity(0.5),
                      strokeColor: backgroundColor.withOpacity(0.8),
                      strokeWidth: 3),
                },
              ),
              possibleFishAroundYou(),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                top: height - 200,
                child: Container(
                  child: _isFishMapListLoading
                      ? fishMapCardShimmerRow()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _fishMapList.length,
                          itemBuilder: (context, index) {
                            var currentFish = _fishMapList[index];
                            return currentFish != null
                                ? FishMapCard(fish: currentFish)
                                : Container();
                          },
                        ),
                ),
              )
            ]),
    );
  }
}

Widget possibleFishAroundYou() {
  return Center(
    heightFactor: lerpDouble(4, 0, 0),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(300),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                width: 280.0,
                height: 45.0,
                decoration:
                    BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
                child: Center(
                  child: Text(
                    'Possible fish population around you',
                    style: TextStyle(
                        color: backgroundColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                )))),
  );
}

Widget permissionRequired() {
  return Container(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
            opacity: 0.5, // Set the opacity value as needed
            child:
                Lottie.asset("assets/raw/loadinglocation.json", height: 120)),
        const Text(
          "Resolving your current location",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        ),
      ],
    ),
  );
}

import 'dart:ui';

import 'package:fish_radar/api/utils/constants.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';

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

  void generateGeminiText(LatLng location) {
    gemini.generateFromText(
        """List the fish that can be found in the $location, if it is forbidden to keep the fish, indicate this with a description under the warning and return the entire answer in json form as follows:
      [
        {
          "fish_img_url":".png",
          "fish_name":"fish",
          "description":"description",
          "warning": true,
          "warning_description" : ""
        }
      ]""").then((value) {
      setState(() {
        generatedGeminiText = value.text;
        print(value.text);
      });
    }).catchError((e) => print(e));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
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

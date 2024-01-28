import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  static const LatLng _pGooglePlex = LatLng(45.521563, -122.677433);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _pGooglePlex,
          zoom: 11.0,
        ),
        markers: {
          const Marker(
            markerId: MarkerId("_currentLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pGooglePlex,
          ),
          const Marker(
            markerId: MarkerId("_sourceLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pApplePark,
          ),
        },
      ),
    );
  }
}

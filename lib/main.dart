import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'actionJson.dart';

void main() => runApp(
      MaterialApp(
        home: WorkPlace(),
        debugShowCheckedModeBanner: false,
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  static LatLng _center = const LatLng(45.521563, -122.699433);
  static LatLng _another = const LatLng(45.502984, -122.63325);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: GoogleMap(
          mapType: MapType.terrain,
          markers: {portLandMarker,portLandMarker2},
          onMapCreated: _onMapCreated,
            initialCameraPosition:
                CameraPosition(target: _center, zoom: 11.00)));
  }

  Marker portLandMarker=Marker(markerId: MarkerId("Portland"),
  position: _center,
  infoWindow: InfoWindow(title: "Portland",snippet: "Location A"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

  Marker portLandMarker2=Marker(markerId: MarkerId("Portland"),
      position: _another,
      infoWindow: InfoWindow(title: "Another Location",snippet: "Location B"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));
}

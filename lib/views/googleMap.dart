import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/trailistController.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends GetView<TrailistController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  late GoogleMapController mapController;
  final LatLng _center = const LatLng(36.103134, 129.386898);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text(controller.currentTrailistName,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color.fromRGBO(254, 113, 117, 100))),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black26),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          markers: getMarkers(),
        ),
      ),
    );
  }

  Set<Marker> getMarkers() {
    final Set<Marker> markers = new Set();

    for (int i = 0; i < controller.locations.length; i++) {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(i.toString()),
        position: LatLng(controller.locations[i].geolocation.latitude,
            controller.locations[i].geolocation.longitude), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: controller.locations[i].locationName,
          snippet: controller.locations[i].address,
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    }

    return markers;
  }
}

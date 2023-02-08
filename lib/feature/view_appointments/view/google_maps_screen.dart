import 'package:demo_api/feature/view_appointments/model/google_map_args.dart';
import 'package:demo_api/static/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  late GoogleMapController mapController;
  late GoogleMapArgs currentLocation;
  final Map<String, Marker> _markers = {};
  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      setState(() {
        currentLocation = Get.arguments;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Static.googleMapsView)),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: currentLocation.location, zoom: 16),
        onMapCreated: (controller) {
          mapController = controller;
          addMarker(id: 'test', args: currentLocation);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }

  addMarker({required String id, required GoogleMapArgs args}) {
    var marker = Marker(
        markerId: MarkerId(id),
        position: args.location,
        infoWindow: InfoWindow(
            title: args.pinCode,
            snippet: "This is the Location of the Customer"),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet));
    _markers[id] = marker;
    setState(() {});
  }
}

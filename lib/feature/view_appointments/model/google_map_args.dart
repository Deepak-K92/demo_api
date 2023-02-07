import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapArgs{
  final LatLng location;
  final String pinCode;

  GoogleMapArgs({ required this.location, required this.pinCode});

}
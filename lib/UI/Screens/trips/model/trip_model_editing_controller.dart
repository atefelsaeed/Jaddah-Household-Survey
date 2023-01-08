import 'package:flutter/cupertino.dart';

class TripModelEditingController {
  final TextEditingController area;

  final TextEditingController zoneNumber;

  final TextEditingController buildingName;

  final TextEditingController streetName;

  final TextEditingController streetNumber;

  final TextEditingController nearestLandMark;
  final TextEditingController blockNearestTwoCrossStreets;

  TripModelEditingController(
      {required this.streetName,
        required this.buildingName,
        required this.streetNumber,
        required this.zoneNumber,
        required this.nearestLandMark,
        required this.blockNearestTwoCrossStreets,
        required this.area});
}
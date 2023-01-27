import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/main.dart';

import 'custom_buttton.dart';

alertMap(Function callBack) {
  final Completer<GoogleMapController> completer = Completer();
  late double initZoom = 19.151926040649414;
  late LatLng initCoordinates = LatLng(37.43296265331129, -122.08832357078792);
  /*"Y": "21.4754090019",
            "X": "39.1832734517",*/
  List<Placemark> placeMarks = [];
  LatLng? value;

  futureCall() async {
    var position = await _determinePosition();
    placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // Constants.location != LatLng(position.latitude, position.longitude);

    final GoogleMapController controller = await completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: initZoom)));
  }

  showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false, // user must tap button!
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          print("fff");
          return false;
        },
        child: AlertDialog(
            content: FutureBuilder(
                future: futureCall(),
                builder: (_, dataSnapshot) {
                  return Stack(
                    children: <Widget>[
                      SizedBox(
                        height: height(context),
                        width: width(context),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: initCoordinates,
                            zoom: initZoom,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            completer.complete(controller);
                          },
                          onCameraMove: (CameraPosition newPosition) {
                            value = newPosition.target;
                          },
                          mapType: MapType.normal,
                          myLocationButtonEnabled: true,
                          myLocationEnabled: true,
                          zoomGesturesEnabled: true,
                          padding: const EdgeInsets.all(0),
                          buildingsEnabled: true,
                          cameraTargetBounds: CameraTargetBounds.unbounded,
                          compassEnabled: true,
                          indoorViewEnabled: false,
                          mapToolbarEnabled: true,
                          minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                          rotateGesturesEnabled: true,
                          scrollGesturesEnabled: true,
                          tiltGesturesEnabled: true,
                          trafficEnabled: false,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        //you can use "right" and "bottom" too
                        child: Padding(
                          padding: EdgeInsets.all(AppSize.padding2(context)),
                          child: DefaultButton(
                              text: 'checkLoaction',
                              function: () {
                                activeLocation(
                                    placeMarks, context, value, callBack);
                              },
                              isWidget: true),
                        ),
                      ),
                      Positioned(
                        top: height(context) / 2 - 100,
                        right: width(context) / 2 - 100,
                        child: Container(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              //  await   placeMarker(value,placeMarks);
                              /* activeLocation(
                                  placeMarks, context, value, callBack);*/
                            },
                            child: const Icon(
                              Icons.pin_drop_outlined,
                              size: 40,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 30,
                        child: Container(
                          color: Colors.white,
                          child: IconButton(
                            onPressed: () async {
                              activeLocation(
                                  placeMarks, context, value, callBack);
                            },
                            icon: const Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                      ),
                    ],
                  );
                })),
      );
    },
  );
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}

activeLocation(List<Placemark> placeMarks, BuildContext context, LatLng? value1,
    callBack) async {
  placeMarks =
      await placemarkFromCoordinates(value1!.latitude, value1.longitude)
          .then((value) async {
    await callBack(value, context, value1);
    return value;
  });
}

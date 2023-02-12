import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';

import '../../main.dart';
import 'custom_buttton.dart';

class Constants {
  static LatLng location = const LatLng(21.492500, 39.177570);
  LatLng? location2;

  static double defaultZoom = 19.151926040649414;
}

/*class AlertMap extends StatefulWidget {
  const AlertMap({
    Key? key,
    required this.title,
    required this.callBack,
  }) : super(key: key);

   final Function callBack;
  final String title;

  @override
  _AlertMapState createState() => _AlertMapState();
}

class _AlertMapState extends State<AlertMap> {
  final Completer<GoogleMapController> completer = Completer();
  late double initZoom = Constants.defaultZoom;
  late LatLng initCoordinates = Constants.location;
  List<Placemark> placeMarks = [];
  LatLng? value;

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

  activeLocation(List<Placemark> placeMarks, BuildContext context,
      LatLng? value1, callBack) async {
    placeMarks =
        await placemarkFromCoordinates(value1!.latitude, value1.longitude)
            .then((value) async {
      await callBack(value, context, value1);
      print(value);
      return value;
    });
  }

  futureCall() async {
    var position = await _determinePosition();
    print('position');
    print(position.longitude);
    placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Constants.location != LatLng(position.latitude, position.longitude);

    final GoogleMapController controller = await completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: initZoom)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
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
                    print(value);
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
                      text: "حفظ",
                      function: () async {
                        await widget.callBack(value);
                       /* setState(()  {


                            Constants.location2 = value;
                          print('location2');
                          print(Constants.location2);
                        });*/
                        Navigator.pop(context);
                        setState(() {});
                        // activeLocation(
                        //     placeMarks, context, value, widget.callBack);
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
                      // await   placeMarker(value,placeMarks);
                      // activeLocation(
                      //     placeMarks, context, value, widget.callBack);
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
                      // activeLocation(
                      //     placeMarks, context, value, callBack);
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}*/
alertMap(Function callBack) {
  final Completer<GoogleMapController> completer = Completer();
  late double initZoom = Constants.defaultZoom;
  late LatLng initCoordinates = Constants.location;
  List<Placemark> placeMarks = [];
  LatLng? value;

  late GoogleMapController controller;
  futureCall() async {
    var position = await _determinePosition();
    placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Constants.location != LatLng(position.latitude, position.longitude);
    controller = await completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: initZoom)));
  }

  showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false, // user must tap button!
    builder: (context) {
      return AlertDialog(
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
                      top: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width(context) * .7,
                          child: SearchMapPlaceWidget(
                            strictBounds: true,
                            hasClearButton: true,
                            placeType: PlaceType.address,
                            bgColor: ColorManager.grayLiner,
                            textColor: ColorManager.primaryColor,
                            iconColor: ColorManager.primaryColor,
                            placeholder: 'بحث',
                            apiKey: 'AIzaSyAMIcLjXga58HVN5RkLX5NGf1zh-Qkk4fg',
                            onSelected: (Place place) async {
                              Geolocation? geolocation =
                                  await place.geolocation;
                              controller.animateCamera(CameraUpdate.newLatLng(
                                  geolocation!.coordinates));
                              controller.animateCamera(
                                  CameraUpdate.newLatLngBounds(
                                      geolocation.bounds, 0));
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      //you can use "right" and "bottom" too
                      child: Padding(
                        padding: EdgeInsets.all(AppSize.padding2(context)),
                        child: DefaultButton(
                            text: "حفظ",
                            function: () {
                              callBack(value);
                              Navigator.pop(context);
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
                      top: 5,
                      left: 5,
                      child: Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: ColorManager.primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                          padding: const EdgeInsets.all(3),
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ),
                    )
                  ],
                );
              }));
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
    await callBack(value);
    return value;
  });
}

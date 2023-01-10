import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/survey.dart';
import '../../../../Providers/surveys.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  _SaveButtonState createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  late bool clicked;

  @override
  void initState() {
    super.initState();
    clicked = false;
  }

  Future<LocationData> getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error(0);
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error(1);
      }
    }

    return await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    SurveyProvider survey = Provider.of<SurveyProvider>(context, listen: true);
    SurveysProvider surveys =
        Provider.of<SurveysProvider>(context, listen: false);
    GlobalKey<FormState> _key = GlobalKey();
    return IconButton(
      icon: const Icon(Icons.save),
      onPressed: clicked
          ? null
          : () {
              if (_key.currentState!.validate()) {
                setState(() {
                  clicked = true;
                });
                _key.currentState!.save();
                getLocation().then(
                  (value) {
                    // survey.id = auth.uid.toString();
                    // survey.data.provider.journeyStarDistrictName=survey.journeyStarDistrictName;
                    // survey.headerLat = value.latitude ?? 0;
                    // survey.headerDate = DateTime.now();
                    // survey.headerLong = value.longitude ?? 0;
                    // survey.headerEndTime = DateTime.now();
                    // survey.headerFormNumber = 0;
                    // survey.headerEmpNumber = auth.uid;
                    // survey.headerCity = "";
                    // if (survey.type != SurveyType.freight) {
                    //   if (survey.journeyExamples.isNotEmpty) {
                    //     survey.journeyExamples.first.transportType =
                    //         survey.journeyGoType;
                    //     // survey.journeyExamples.first.startPose
                    //     //         .name =
                    //     //     survey.journeyStartLocationName ;
                    //
                    //     survey.journeyExamples.last.transportType =
                    //         survey.journeyBackType;
                    //     // survey.journeyExamples.last.endPose.name =
                    //     //     survey.journeyEndLocationName ;
                    //   }
                    // }
                    surveys.addSurvey(survey.data);
                    setState(() {
                      // initManualLocation = survey.manualLocation;
                      clicked = false;
                    });
                  },
                ).onError(
                  (error, stackTrace) {
                    print(error);
                    log(stackTrace.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("يجب تشغيل خدمة تحديد الموقع"),
                        duration: Duration(seconds: 3),
                        elevation: 1,
                      ),
                    );
                    setState(() {
                      clicked = false;
                    });
                  },
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("يوجد خطأ بالبيانات"),
                    duration: Duration(seconds: 3),
                    elevation: 1,
                  ),
                );
              }
            },
    );
  }
}

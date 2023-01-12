import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/save_data.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/auth.dart';
import '../../../../Providers/survey_hhs.dart';
import '../../../Widgets/custom_buttton.dart';
import '../../Surveies/surveys_screen.dart';

class ActionVecScreen extends StatelessWidget {
  const ActionVecScreen({super.key});

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
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    Auth auth = Provider.of<Auth>(context, listen: false);

    SurveysProvider surveys = Provider.of<SurveysProvider>(context,
        listen: false); // TODO: implement build
    return DefaultButton(
      function: () {
        getLocation().then(
          (value) {
            Random random = Random();
            int randomNumber = random.nextInt(10000);
            surveyPt.headerLat = value.latitude ?? 0;
            surveyPt.interViewDate = DateTime.now();
            surveyPt.headerLong = value.longitude ?? 0;
            surveyPt.headerEmpNumber = auth.uid;
            surveyPt.headerInterviewNumber = (auth.uid + randomNumber);
            surveyPt.id = auth.uid.toString();
            SaveVehiclesData.saveData(context);

            surveys.addSurvey(surveyPt.data);
            print('Saving Data :: ');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SurveysScreen(),
              ),
            );
          },
        ).onError(
          (error, stackTrace) {
            print(error);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("يجب تشغيل خدمة تحديد الموقع"),
                duration: Duration(seconds: 3),
                elevation: 1,
              ),
            );
          },
        );
      },
      isWidget: true,
      text: "Finish",
      widget: const Icon(Icons.arrow_forward),
    );
  }
}

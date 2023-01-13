import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/UI/Screens/ChooseSurvey/itemHomeSurvey.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../Models/survey.dart';
import '../../../Providers/auth.dart';
import '../../../Providers/surveys.dart';
import '../../../Resources/colors.dart';
import '../../../Resources/sizes.dart';
import '../../Widgets/connection_error.dart';
import '../Survey/syrvey_screen.dart';
import '../UserSurveys/userSurveys.dart';
import 'chooseSurveyBody.dart';

class ChooseSurveysScreen extends StatefulWidget {
  const ChooseSurveysScreen({Key? key}) : super(key: key);

  // static const routeName = "surveys-screen";
  static const routeName = "/";

  @override
  State<ChooseSurveysScreen> createState() => _ChooseSurveysScreenState();
}

class _ChooseSurveysScreenState extends State<ChooseSurveysScreen> {
  Future<LocationData> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return Future.error(0);
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return Future.error(1);
      }
    }

    return await location.getLocation();
  }

  late bool clicked;

  @override
  void initState() {
    super.initState();

    clicked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: ColorManager.primaryColor,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => const SurveyScreen()));
      //       },
      //       icon: const Icon(Icons.add),
      //     ),
      //     const SizedBox(width: 20),
      //     IconButton(
      //       onPressed: () async {
      //         await getLocation().then((value) {}).onError(
      //               (error, stackTrace) {
      //             log(stackTrace.toString());
      //             ScaffoldMessenger.of(context).showSnackBar(
      //               const SnackBar(
      //                 content: Text("The location service must be running"),
      //                 duration: Duration(seconds: 3),
      //                 elevation: 1,
      //               ),
      //             );
      //             setState(() {
      //               clicked = false;
      //             });
      //           },
      //         );
      //       },
      //       icon: const Icon(Icons.sync),
      //     ),
      //     const SizedBox(width: 30),
      //     IconButton(
      //       onPressed: Provider.of<Auth>(context).logout,
      //       icon: const Icon(Icons.logout),
      //     ),
      //   ],
      // ),
      body: FutureBuilder(
          future: Provider.of<SurveysProvider>(context, listen: false).fetch(),
          builder: (fctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return dataSnapshot.hasError
                  ? Padding(
                      padding: const EdgeInsets.all(50),
                      child: ConnectionError(() => setState(() => {})),
                    )
                  : dataSnapshot.hasData
                      ? ChooseSurveyBody()
                      : const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(
                              'لا يوجد استبيانات',
                            ),
                          ),
                        );
            }
          }),
    );
  }
}

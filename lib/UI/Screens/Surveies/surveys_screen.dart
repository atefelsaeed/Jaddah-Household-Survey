import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../Providers/auth.dart';
import '../../../Providers/surveys.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/connection_error.dart';
import '../Survey/syrvey_screen.dart';
import 'Components/survey_list.dart';

class SurveysScreen extends StatefulWidget {
  const SurveysScreen({Key? key}) : super(key: key);

  // static const routeName = "surveys-screen";
  static const routeName = "/";

  @override
  State<SurveysScreen> createState() => _SurveysScreenState();
}

class _SurveysScreenState extends State<SurveysScreen> {
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
      appBar: AppBar(
        title: const Text("تطوير انظمة تخطيط النقل"),
        backgroundColor: ColorManager.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SurveyScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.person),
                                Text("PT"),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.local_taxi),
                                Text("CAR"),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.car_rental),
                                Text("Freight"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () async {
              await getLocation().then((value) {}).onError(
                (error, stackTrace) {
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
            },
            icon: const Icon(Icons.sync),
          ),
          const SizedBox(width: 30),
          IconButton(
            onPressed: Provider.of<Auth>(context).logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.homeBackground), fit: BoxFit.fill),
        ),
        child: Center(
          child: FutureBuilder(
            future:
                Provider.of<SurveysProvider>(context, listen: false).fetch(),
            builder: (fctx, dataSnapshot) =>
                dataSnapshot.connectionState == ConnectionState.waiting
                    ? const Padding(
                        padding: EdgeInsets.all(40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : dataSnapshot.hasError
                        ? Padding(
                            padding: const EdgeInsets.all(50),
                            child: ConnectionError(() => setState(() => {})),
                          )
                        : dataSnapshot.hasData
                            ? const SurveyList()
                            : const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Center(
                                  child: Text(
                                    'لا يوجد اي استبيانات',
                                  ),
                                ),
                              ),
          ),
        ),
      ),
    );
  }
}

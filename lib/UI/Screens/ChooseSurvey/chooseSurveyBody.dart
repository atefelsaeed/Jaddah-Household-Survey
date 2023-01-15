import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jaddah_household_survey/Models/survey.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:provider/provider.dart';

import '../../../Providers/auth.dart';
import '../../../Resources/assets_manager.dart';
import '../../../Resources/colors.dart';
import '../../../Resources/sizes.dart';
import '../Survey/syrvey_screen.dart';
import 'itemHomeSurvey.dart';

class ChooseSurveyBody extends StatefulWidget {
   ChooseSurveyBody({Key? key}) : super(key: key);

  @override
  State<ChooseSurveyBody> createState() => _ChooseSurveyBodyState();
}

class _ChooseSurveyBodyState extends State<ChooseSurveyBody> {
  late final subscription;

  @override
  initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen(
          (ConnectivityResult result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) setState(() {});
        // Got a new connectivity status!
      },
    );
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    SurveysProvider p = Provider.of<SurveysProvider>(context);
    Auth auth = Provider.of<Auth>(context, listen: false);
    p.syncAll();
    List<Survey> surveyList = p.surveys;
    print("Survey List length: ${surveyList.length}");

    FirebaseMessaging.onMessage.listen((e) async {
      p.syncAll();
      Fluttertoast.showToast(
        msg: "Syncing",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // _messageHandler(e);
    });
    return Container(
        height: height(context),
        width: width(context),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.homeBackground),
              fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSize.spaceHeight5(context),
              Text(
                'مرحباً ${auth.user!.name}',
                style: TextStyle(
                  color: ColorManager.wight,
                  fontSize: width(context) * .065,
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SurveyScreen(),
                      ),
                    );
                  },
                  child: ItemHomeSurvey(
                      count: surveyList.length != null
                          ? surveyList.length
                          : 0)),
              InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         const UserSurveysScreen(),
                    //   ),
                    // );
                  },
                  child: const ItemHomeSurvey(count: 0)),
              InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         const UserSurveysScreen(),
                    //   ),
                    // );
                  },
                  child: const ItemHomeSurvey(count: 0)),
            ],
          ),
        ));
  }
}
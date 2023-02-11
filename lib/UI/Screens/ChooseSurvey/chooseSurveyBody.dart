import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jaddah_household_survey/Models/survey.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:jaddah_household_survey/Providers/user_surveys.dart';
import 'package:jaddah_household_survey/Resources/strings.dart';
import 'package:jaddah_household_survey/UI/Screens/UserSurveys/userSurveys.dart';
import 'package:provider/provider.dart';

import '../../../Providers/auth.dart';
import '../../../Resources/assets_manager.dart';
import '../../../Resources/colors.dart';
import '../../../Resources/sizes.dart';
import 'itemHomeSurvey.dart';

class ChooseSurveyBody extends StatefulWidget {
  const ChooseSurveyBody({Key? key}) : super(key: key);

  @override
  State<ChooseSurveyBody> createState() => _ChooseSurveyBodyState();
}

class _ChooseSurveyBodyState extends State<ChooseSurveyBody> {

  @override
  initState() {
    super.initState();
    UserSurveysProvider userSurveysProvider =
    Provider.of<UserSurveysProvider>(context, listen: false);
    userSurveysProvider.multiSync();
  }

  @override
  Widget build(BuildContext context) {
    // final survey = Provider.of<SurveyProvider>(context, listen: true);
    SurveysProvider p = Provider.of<SurveysProvider>(context);
    // p.syncAll();
    Auth auth = Provider.of<Auth>(context, listen: false);
    List<Survey> surveyList = p.surveys;
    print("Survey List length: ${surveyList.length}");

    FirebaseMessaging.onMessage.listen((e) async {
      UserSurveysProvider userSurveysProvider =
      Provider.of<UserSurveysProvider>(context, listen: false);
      userSurveysProvider.multiSync();
      print('sync message');
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
              image: AssetImage(ImageAssets.homeBackground), fit: BoxFit.fill),
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
                      builder: (context) =>
                          UserSurveysScreen(id: auth.user!.id),
                    ),
                  );
                },
                child: ItemHomeSurvey(count: surveyList.length),
              ),
              AppSize.spaceHeight5(context),
              Text(
                'إصدار التطبيق  ${AppStrings.appVersion}',
                style: TextStyle(
                  color: ColorManager.wight,
                  fontSize: width(context) * .035,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ));
  }
}

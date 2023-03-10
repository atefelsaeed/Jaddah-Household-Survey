// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import 'package:jaddah_household_survey/Helper/locale_database/operations/survey_pt_operations.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:jaddah_household_survey/Providers/user_surveys.dart';
import 'package:jaddah_household_survey/UI/Screens/ChooseSurvey/chooseSurveyScreen.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/trip_conditions.dart';
import 'package:jaddah_household_survey/UI/Widgets/show_dialog_error.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Helper/locale_database/operations/hhs_user_surveys_operations.dart';
import '../../app_constants.dart';

class CheckTripsValidation {
  static void showError(context, Widget widget) => showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return widget;
      });

  static validatePerson(BuildContext context) async {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    UserSurveysProvider userSurvey =
        Provider.of<UserSurveysProvider>(context, listen: false);

    SurveysProvider surveys =
        Provider.of<SurveysProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String status = (prefs.getString('SystemStatus') ?? 'Online');
    //======Trip-Validations======================
    var length = TripModeList.tripModeList.length;
    for (int e = 0; e <= length; e++) {
      //set TripModeList base

      if (e < length) {
        var base = TripModeList.tripModeList[e];
        int tripNumber = 1 + e;
        if (base.chosenPerson.isEmpty) {
          return Validator.showSnack(
              context, " يجب إخيار ! صاحب الرحلة؟ $tripNumber رحلة");
        } else if (!TripConditions().checkIsCarDriver(e, context)) {
          return null;
        } else if (!TripConditions()
            .checkIsTravelAloneAdultsNumber1(e, context)) {
          return null;
        } else if (!TripConditions()
            .checkIsTravelAloneChildrenNumber1(e, context)) {
          return null;
        } else if (!TripConditions()
            .checkIsTravelAloneAdultsNumberQ4HHS(e, context)) {
          return null;
        } else if (!TripConditions()
            .checkIsTravelAloneChildrenNumberQ4HHS(e, context)) {
          return null;
        }

        ///startBeginningModel!.tripAddressLat && tripAddressLong
        else if (status == 'Online' &&
            (base.startBeginningModel!.tripAddressLat == null ||
                base.startBeginningModel!.tripAddressLat!.isEmpty ||
                TripModeList
                        .tripModeList[e].startBeginningModel!.tripAddressLong ==
                    null ||
                base.startBeginningModel!.tripAddressLong!.isEmpty)) {
          return Validator.showSnack(
              context, " يجب إخيار ! 1. من أین بدأت الیوم؟ $tripNumber رحلة");
        } else if ((TripModeList.tripModeList[e].isHome == true) &&
            (TripModeList.tripModeList[e].tripReason != "في المنزل")) {
          // if (TripModeList.tripModeList[e].tripReason != "في المنزل") {
          return showError(
              context,
              ShowErrorDialog(
                  title: 'تنبيه !! $tripNumber رحلة',
                  content:
                      ' في حاله اختيار المنزل فسوال اين بدات اليوم يجب ان يكون الغرض من التواجد المنزل !!!!"'));
          // } else {
          //   return true;
          // }
        } else if ((TripModeList.tripModeList[e].isHome == true) &&
            (TripModeList.tripModeList[e].isHomeEnding != false)) {
          // if (TripModeList.tripModeList[e].isHomeEnding != false) {
          return showError(
            context,
            ShowErrorDialog(
                title: 'تنبيه !!',
                content:
                    ' لا يمكن أن يكون المنزل هو مكان المغادرة والوصول في نفس الرحلة !!!! $tripNumber رحلة"'),
          );
          // } else {
          //   return true;
          // }
        } else if ((TripModeList.tripModeList[e].isHome == true) &&
            (TripModeList.tripModeList[e].purposeTravel == "في المنزل")) {
          // if (TripModeList.tripModeList[e].purposeTravel == "في المنزل") {
          return showError(
            context,
            ShowErrorDialog(
                title: 'تنبيه !! $tripNumber رحلة',
                content:
                    'لا يمكن أن يكون الغرض المنزل لأن المغادرة كانت من المنزل !!!!"'),
          );
          // } else {
          //   return true;
          // }
        }

        ///purposeTravel
        else if (base.purposeTravel == null || base.purposeTravel == '') {
          return Validator.showSnack(context,
              " يجب إخيار ! ما ھو الغرض من التواجد ھناك؟ $tripNumber رحلة");
        }

        ///endingAddress!.tripAddressLat && tripAddressLong
        else if (status == 'Online' &&
            (base.endingAddress!.tripAddressLat == null ||
                base.endingAddress!.tripAddressLong == null ||
                TripModeList
                    .tripModeList[e].endingAddress!.tripAddressLat!.isEmpty ||
                TripModeList
                    .tripModeList[e].endingAddress!.tripAddressLong!.isEmpty)) {
          return Validator.showSnack(
              context, " يجب إخيار ! 4. الى أي عنوان ذھبت؟ رحلة $tripNumber");
        }

        ///tripReason
        else if (base.tripReason == null || base.tripReason == "") {
          return Validator.showSnack(context,
              " يجب إخيار !  ما ھو الغرض من الذھاب إلى ھذا  المكان؟ $tripNumber رحلة");
        }

        ///travelWay!.accessMode
        else if (base.travelWay!.accessMode == null ||
            base.travelWay!.accessMode == "") {
          return Validator.showSnack(
              context, " يجب إخيار ! الوضع الرئیسي $tripNumber رحلة");
        }

        ///travelWay!.mainMode
        else if (base.travelWay!.mainMode == null ||
            base.travelWay!.mainMode == '') {
          return Validator.showSnack(
              context, " يجب إخيار ! وضع وصول؟ $tripNumber رحلة");
        }

        ///isTravelAlone
        else if (base.isTravelAlone == null) {
          return Validator.showSnack(context,
              " يجب إخيار ! هل ذهبت بمفردك أم مع آخرین؟ $tripNumber رحلة");
        }

        ///travelTypeModel.travelType
        else if (base.travelTypeModel.travelType == null ||
            base.travelTypeModel.travelType == '') {
          return Validator.showSnack(
              context, " يجب إخيار ! بماذا ذهبت ؟ $tripNumber رحلة");
        }

        ///travelTypeModel.carParkingPlace
        else if ((base.travelTypeModel.travelType == "سيارة" ||
                base.travelTypeModel.travelType == "دراجة نارية") &&
            (base.travelTypeModel.carParkingPlace == null ||
                base.travelTypeModel.carParkingPlace!.isEmpty)) {
          return Validator.showSnack(
              context, " يجب إخيار ! أین أوقفت؟ $tripNumber رحلة");
        }

        ///travelTypeModel.carParkingPlace
        else if ((base.travelTypeModel.travelType == "تاكسي") &&
            (base.travelTypeModel.taxiTravelType == null ||
                base.travelTypeModel.taxiTravelType!.isEmpty)) {
          return Validator.showSnack(
              context, " يجب إخيار ! أین أوقفت؟ $tripNumber رحلة");
        }

        ///arrivalDepartTime.numberRepeatTrip
        else if (TripModeList
                    .tripModeList[e].arrivalDepartTime.numberRepeatTrip ==
                null ||
            base.arrivalDepartTime.numberRepeatTrip == '') {
          return Validator.showSnack(context,
              " يجب إخيار ! كم مرة تقوم بهذە الرحلة؟ $tripNumber رحلة");
        }

        ///Validation Done
        else {
          UserSurveysProvider userSurveysProvider =
          Provider.of<UserSurveysProvider>(context, listen: false);
          SurveyPTProvider surveyPt =
          Provider.of<SurveyPTProvider>(context, listen: false);
          SurveysProvider surveys =
          Provider.of<SurveysProvider>(context, listen: false);

          if (userSurveysProvider.userSurveyStatus == 'not filled') {
            surveys.addNotFilledSurvey(surveyPt.data);
            debugPrint('addNotFilledSurvey');
          }
          if (!TripConditions().personWithoutTrip(
            i: e,
            context: context,
            function: () async {
              //=======Add-survey-to-surveys-list================
              if (userSurvey.userSurveyStatus == "not filled") {
                debugPrint(userSurvey.userSurveyStatus.toString());
                await surveys.addSurvey(surveyPt.data);
                //=====Check-If-this-survey-is-exit-or not if not add it to userSurveys list and update this list
                userSurvey.userSurveys[userSurvey.index].status = 'filled';
                for (var element in userSurvey.userSurveys) {
                  await HHSUserSurveysOperations().addItemToDatabase(element);
                }

                debugPrint('Add User Surveys to local database');
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const ChooseSurveysScreen()),
                    (Route<dynamic> route) => false);
                //Delete values in table Survey PT
                await SurveyPtOperations().deleteSurveyPTTable();
                //Reset isFilled value
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool(AppConstants.isFilled, false);
              } else if ((userSurvey.userSurveyStatus == "edit")) {
                debugPrint(userSurvey.userSurveyStatus.toString());
                userSurvey.updateSurvey(surveyPt.data);
                debugPrint('updateSurvey');
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const ChooseSurveysScreen()),
                    (Route<dynamic> route) => false);
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool(AppConstants.isFilled, false);
              }
            },
          )) {
            return null;
          } else {
            //=======Add-survey-to-surveys-list================
            if (userSurvey.userSurveyStatus == "not filled") {
              debugPrint(userSurvey.userSurveyStatus.toString());
              await surveys.addSurvey(surveyPt.data);
              //=====Check-If-this-survey-is-exit-or not if not add it to userSurveys list and update this list
              userSurvey.userSurveys[userSurvey.index].status = 'filled';
              for (var element in userSurvey.userSurveys) {
                await HHSUserSurveysOperations().addItemToDatabase(element);
              }

              debugPrint('Add User Surveys to local database');
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const ChooseSurveysScreen()),
                      (Route<dynamic> route) => false);
              //Delete values in table Survey PT
              await SurveyPtOperations().deleteSurveyPTTable();
              //Reset isFilled value
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool(AppConstants.isFilled, false);
            } else if ((userSurvey.userSurveyStatus == "edit")) {
              debugPrint(userSurvey.userSurveyStatus.toString());
              userSurvey.updateSurvey(surveyPt.data);
              debugPrint('updateSurvey');
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const ChooseSurveysScreen()),
                      (Route<dynamic> route) => false);
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool(AppConstants.isFilled, false);
            }
          }
        }
      }
    }
  }
}

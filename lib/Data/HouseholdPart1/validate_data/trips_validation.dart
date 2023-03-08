// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:jaddah_household_survey/Providers/user_surveys.dart';
import 'package:jaddah_household_survey/UI/Screens/ChooseSurvey/chooseSurveyScreen.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/trip_conditions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Helper/locale_database/operations/hhs_user_surveys_operations.dart';

class CheckTripsValidation {
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

        if (base.chosenPerson.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! صاحب الرحلة؟");
        } else if (!TripConditions().checkIsCarDriver(e, context)) {
          print('val');
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
              context, " يجب إخيار ! 1. من أین بدأت الیوم؟");
        }

        ///purposeTravel
        else if (base.purposeTravel == null || base.purposeTravel == '') {
          return Validator.showSnack(
              context, " يجب إخيار ! ما ھو الغرض من التواجد ھناك؟");
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
              context, " يجب إخيار ! 4. الى أي عنوان ذھبت؟");
        }

        ///tripReason
        else if (base.tripReason == null || base.tripReason == "") {
          return Validator.showSnack(
              context, " يجب إخيار !  ما ھو الغرض من الذھاب إلى ھذا  المكان؟");
        }

        ///travelWay!.accessMode
        else if (base.travelWay!.accessMode == null ||
            base.travelWay!.accessMode == "") {
          return Validator.showSnack(context, " يجب إخيار ! الوضع الرئیسي ");
        }

        ///travelWay!.mainMode
        else if (base.travelWay!.mainMode == null ||
            base.travelWay!.mainMode == '') {
          return Validator.showSnack(context, " يجب إخيار ! وضع وصول؟");
        }

        ///isTravelAlone
        else if (base.isTravelAlone == null) {
          return Validator.showSnack(
              context, " يجب إخيار ! هل ذهبت بمفردك أم مع آخرین؟ ");
        }

        ///travelTypeModel.travelType
        else if (base.travelTypeModel.travelType == null ||
            base.travelTypeModel.travelType == '') {
          return Validator.showSnack(context, " يجب إخيار ! بماذا ذهبت ؟ ");
        }

        ///travelTypeModel.carParkingPlace
        else if ((base.travelTypeModel.travelType == "سيارة" ||
                base.travelTypeModel.travelType == "دراجة نارية") &&
            (base.travelTypeModel.carParkingPlace == null ||
                base.travelTypeModel.carParkingPlace!.isEmpty)) {
          return Validator.showSnack(context, " يجب إخيار ! أین أوقفت؟ ");
        }

        ///travelTypeModel.carParkingPlace
        else if ((base.travelTypeModel.travelType == "تاكسي") &&
            (base.travelTypeModel.taxiTravelType == null ||
                base.travelTypeModel.taxiTravelType!.isEmpty)) {
          return Validator.showSnack(context, " يجب إخيار ! أین أوقفت؟ ");
        }

        ///arrivalDepartTime.numberRepeatTrip
        else if (TripModeList
                    .tripModeList[e].arrivalDepartTime.numberRepeatTrip ==
                null ||
            base.arrivalDepartTime.numberRepeatTrip == '') {
          return Validator.showSnack(
              context, " يجب إخيار ! كم مرة تقوم بهذە الرحلة؟ ");
        }
      }

      ///Validation Done
      else {
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
        } else if ((userSurvey.userSurveyStatus == "edit")) {
          debugPrint(userSurvey.userSurveyStatus.toString());
          userSurvey.updateSurvey(surveyPt.data);
          debugPrint('updateSurvey');
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const ChooseSurveysScreen()),
              (Route<dynamic> route) => false);
        }
      }
    }
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:jaddah_household_survey/Providers/user_surveys.dart';
import 'package:jaddah_household_survey/UI/Screens/ChooseSurvey/chooseSurveyScreen.dart';
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
    for (int e = 0; e <= TripModeList.tripModeList.length; e++) {
      if (e < TripModeList.tripModeList.length) {
        if (TripModeList.tripModeList[e].chosenPerson.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! صاحب الرحلة؟");
        }

        ///startBeginningModel!.tripAddressLat && tripAddressLong
        else if (status == 'Online' &&
            (TripModeList.tripModeList[e].startBeginningModel!.tripAddressLat ==
                    null ||
                TripModeList.tripModeList[e].startBeginningModel!
                    .tripAddressLat!.isEmpty ||
                TripModeList
                        .tripModeList[e].startBeginningModel!.tripAddressLong ==
                    null ||
                TripModeList.tripModeList[e].startBeginningModel!
                    .tripAddressLong!.isEmpty)) {
          return Validator.showSnack(
              context, " يجب إخيار ! 1. من أین بدأت الیوم؟");
        }

        ///purposeTravel
        else if (TripModeList.tripModeList[e].purposeTravel == null ||
            TripModeList.tripModeList[e].purposeTravel == '') {
          return Validator.showSnack(
              context, " يجب إخيار ! ما ھو الغرض من التواجد ھناك؟");
        }

        ///endingAddress!.tripAddressLat && tripAddressLong
        else if (status == 'Online' &&
            (TripModeList.tripModeList[e].endingAddress!.tripAddressLat ==
                    null ||
                TripModeList.tripModeList[e].endingAddress!.tripAddressLong ==
                    null ||
                TripModeList
                    .tripModeList[e].endingAddress!.tripAddressLat!.isEmpty ||
                TripModeList
                    .tripModeList[e].endingAddress!.tripAddressLong!.isEmpty)) {
          return Validator.showSnack(
              context, " يجب إخيار ! 4. الى أي عنوان ذھبت؟");
        }

        ///tripReason
        else if (TripModeList.tripModeList[e].tripReason == null ||
            TripModeList.tripModeList[e].tripReason == "") {
          return Validator.showSnack(
              context, " يجب إخيار !  ما ھو الغرض من الذھاب إلى ھذا  المكان؟");
        }

        ///travelWay!.accessMode
        else if (TripModeList.tripModeList[e].travelWay!.accessMode == null ||
            TripModeList.tripModeList[e].travelWay!.accessMode == "") {
          return Validator.showSnack(context, " يجب إخيار ! الوضع الرئیسي ");
        }

        ///travelWay!.mainMode
        else if (TripModeList.tripModeList[e].travelWay!.mainMode == null ||
            TripModeList.tripModeList[e].travelWay!.mainMode == '') {
          return Validator.showSnack(context, " يجب إخيار ! وضع وصول؟");
        }

        ///isTravelAlone
        else if (TripModeList.tripModeList[e].isTravelAlone == null) {
          return Validator.showSnack(
              context, " يجب إخيار ! هل ذهبت بمفردك أم مع آخرین؟ ");
        }

        ///travelTypeModel.travelType
        else if (TripModeList.tripModeList[e].travelTypeModel.travelType ==
                null ||
            TripModeList.tripModeList[e].travelTypeModel.travelType == '') {
          return Validator.showSnack(context, " يجب إخيار ! بماذا ذهبت ؟ ");
        }

        ///travelTypeModel.carParkingPlace
        else if ((TripModeList.tripModeList[e].travelTypeModel.travelType ==
                    "سيارة" ||
                TripModeList.tripModeList[e].travelTypeModel.travelType ==
                    "دراجة نارية") &&
            (TripModeList.tripModeList[e].travelTypeModel.carParkingPlace ==
                    null ||
                TripModeList.tripModeList[e].travelTypeModel.carParkingPlace!
                    .isEmpty)) {
          return Validator.showSnack(context, " يجب إخيار ! أین أوقفت؟ ");
        }

        ///arrivalDepartTime.numberRepeatTrip
        else if (TripModeList
                    .tripModeList[e].arrivalDepartTime.numberRepeatTrip ==
                null ||
            TripModeList.tripModeList[e].arrivalDepartTime.numberRepeatTrip ==
                '') {
          return Validator.showSnack(
              context, " يجب إخيار ! كم مرة تقوم بهذە الرحلة؟ ");
        }
      }

      ///Validation Done
      else {
        //=======Add-survey-to-surveys-list================
        await surveys.addSurvey(surveyPt.data);
        //=====Check-If-this-survey-is-exit-or not if not add it to userSurveys list and update this list
        userSurvey.userSurveys[userSurvey.index].status = 'filled';
        for (var element in userSurvey.userSurveys) {
          await HHSUserSurveysOperations().addItemToDatabase(element);
        }
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const ChooseSurveysScreen()),
            (Route<dynamic> route) => false);
      }
    }
  }
}

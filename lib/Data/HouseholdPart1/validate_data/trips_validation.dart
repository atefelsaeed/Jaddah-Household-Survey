import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:jaddah_household_survey/Providers/user_surveys.dart';
import 'package:jaddah_household_survey/UI/Screens/ChooseSurvey/chooseSurveyScreen.dart';
import 'package:provider/provider.dart';

import '../../../Helper/locale_database/operations/hhs_user_surveys_operations.dart';
import '../../../Helper/locale_database/operations/survey_pt_operations.dart';

class CheckTripsValidation {
  static validatePerson(BuildContext context) async {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    UserSurveysProvider userSurvey =
        Provider.of<UserSurveysProvider>(context, listen: false);

    SurveysProvider surveys =
        Provider.of<SurveysProvider>(context, listen: false);
    //======Trip-Validations======================
    for (var element in TripModeList.tripModeList) {
      if (element.purposeTravel == null || element.purposeTravel == '') {
        return Validator.showSnack(
            context, " يجب إخيار ! ما ھو الغرض من التواجد ھناك؟");
      } else if (element.tripReason == null || element.tripReason == "") {
        return Validator.showSnack(
            context, " يجب إخيار !  ما ھو الغرض من الذھاب إلى ھذا  المكان؟");
      } else if (element.travelWay!.accessMode == null ||
          element.travelWay!.accessMode == "") {
        return Validator.showSnack(context, " يجب إخيار ! الوضع الرئیسي ");
      } else if (element.travelWay!.mainMode == null ||
          element.travelWay!.mainMode == '') {
        return Validator.showSnack(context, " يجب إخيار ! وضع وصول؟");
      } else if (element.travelTypeModel.travelType == null ||
          element.travelTypeModel.travelType == '') {
        return Validator.showSnack(context, " يجب إخيار ! بماذا ذهبت ؟ ");
      } else if (element.arrivalDepartTime.numberRepeatTrip == null ||
          element.arrivalDepartTime.numberRepeatTrip == '') {
        return Validator.showSnack(
            context, " يجب إخيار ! كم مرة تقوم بهذە الرحلة؟ ");
      } else if (element.arrivalDepartTime.numberRepeatTrip == null ||
          element.arrivalDepartTime.numberRepeatTrip == "") {
        return Validator.showSnack(
            context, " يجب إخيار ! هل ذهبت بمفردك أم مع آخرین؟ ");
      } else {
        //=======Add-survey-to-surveys-list================
        await surveys.addSurvey(surveyPt.data);
        //=====Check-If-this-survey-is-exit-or not if not add it to userSurveys list and update this list
        userSurvey.userSurveys[userSurvey.index].status = 'filled';
        for (var element in  userSurvey.userSurveys) {
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

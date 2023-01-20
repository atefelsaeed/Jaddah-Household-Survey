import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/empty_data.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:jaddah_household_survey/UI/Screens/ChooseSurvey/chooseSurveyScreen.dart';
import 'package:jaddah_household_survey/providers/survey_hhs.dart';
import 'package:provider/provider.dart';

class CheckTripsValidation {
  static validatePerson(context) async {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);

    SurveysProvider surveys =
        Provider.of<SurveysProvider>(context, listen: false);
    //
    for (var element in TripModeList.tripModeList) {
      if (element.purposeTravel == null) {
        return Validator.showSnack(
            context, "ما ھو الغرض من التواجد ھناك؟ يجب إخيار ");
      } else if (element.tripReason == null) {
        return Validator.showSnack(
            context, "ما ھو الغرض من الذھاب إلى ھذا  المكان؟ يجب إخيار ");
      } else if (element.travelWay!.accessMode == null) {
        return Validator.showSnack(context, "الوضع الرئیسي يجب إخيار ");
      } else if (element.travelWay!.mainMode == null) {
        return Validator.showSnack(context, "وضع وصول؟ يجب إخيار ");
      } else if (element.travelTypeModel!.travelType == null) {
        return Validator.showSnack(context, "بماذا سافرت ؟ يجب إخيار ");
      } else if (element.arrivalDepartTime!.numberRepeatTrip == null) {
        return Validator.showSnack(
            context, "كم مرة تقوم بهذە الرحلة؟ يجب إخيار ");
      } else if (element.arrivalDepartTime!.numberRepeatTrip == null) {
        return Validator.showSnack(
            context, "هل سافرت بمفردك أم مع آخرین؟ يجب إخيار ");
      }
      // else if (element.travelWithOtherModel!.hhsMembersTraveled == null) {
      //   return Validator.showSnack(context, "اي من أفراد الأسرة سافر معك؟ يجب إخيار ");
      // }

      else {
        log("After save");
        await surveys.addSurvey(surveyPt.data).then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChooseSurveysScreen(),
              ),
            );
            log('Empty Data ......');
            HHSEmptyData.emptyData();
          },
        );
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/app_constants.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:provider/provider.dart';

import '../../../Helper/validator.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Providers/user_surveys.dart';
import '../../../UI/Screens/vechicles/vechicles_screen.dart';
import '../VechelisData/veh_model.dart';

class CheckHHSValidation {
  static validate(context) {
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    SurveysProvider surveys =
        Provider.of<SurveysProvider>(context, listen: false);

    if (HhsStatic.householdQuestions.hhsDwellingType == null ||
        HhsStatic.householdQuestions.hhsDwellingType == "") {
      return Validator.showSnack(context, " يجب إخيار! 1.وصف المسكن؟ ");
    } else if (HhsStatic.householdQuestions.hhsIsDwelling == null ||
        HhsStatic.householdQuestions.hhsIsDwelling == "") {
      return Validator.showSnack(context, "يجب إخيار! 2.ملكية المسكن؟ ");
    } else if (HhsStatic.householdQuestions.hhsNumberSeparateFamilies == '' ||
        HhsStatic.householdQuestions.hhsNumberSeparateFamilies == null) {
      return Validator.showSnack(context,
          "يجب إخيار! 3.كم عدد العائلات المنفصلة التي تعيش في هذا العنوان؟  ");
    } else if (HhsStatic.householdQuestions.hhsNumberYearsInAddress == null ||
        HhsStatic.householdQuestions.hhsNumberYearsInAddress == '') {
      return Validator.showSnack(context,
          "يجب إخيار! 6.كم سنة عشت أنت / عائلتك في هذا العنوان المحدد؟");
    } else if (HhsStatic.householdQuestions.hhsIsDemolishedAreas == null) {
      return Validator.showSnack(context,
          "  يجب إخيار! هل انتقلت إلى هنا من أي منطقة من المناطق المهدومة في جدة ، إذا كانت الإجابة بنعم أي واحدة");
    } else if (HhsStatic.householdQuestions.hhsTotalIncome == null ||
        HhsStatic.householdQuestions.hhsTotalIncome == "") {
      return Validator.showSnack(context,
          " يجب إخيار ! 8.متوسط دخل جميع أفراد الاسرة الشهري مع المزايا؟");
    } else if (VehModel.nearestPublicTransporter == '') {
      return Validator.showSnack(context,
          ".يجب إخيار ! 9.كم تبعد اقرب محطة حافلات نقل عام عن منزلك سيرا على الاقدام ؟");
    } else {
      if (userSurveysProvider.userSurveyStatus == 'not filled') {
        surveys.addNotFilledSurvey(surveyPt.data);
        debugPrint('addNotFilledSurvey');
      }
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const VehiclesScreen()));
    }
  }
}

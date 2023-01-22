import 'package:flutter/material.dart';

import '../../../Helper/validator.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../UI/Screens/vechicles/vechicles_screen.dart';
import '../VechelisData/veh_model.dart';

class CheckHHSValidation {
  static validate(context) {
    if (HhsStatic.householdQuestions.hhsDwellingType == null) {
      return Validator.showSnack(
          context, "1. ما أفضل وصف لهذا النوع من المسكن؟ يجب إخيار ");
    } else if (HhsStatic.householdQuestions.hhsNumberSeparateFamilies == '' ||
        HhsStatic.householdQuestions.hhsNumberSeparateFamilies == null) {
      return Validator.showSnack(context,
          "1.كم عدد العائلات المنفصلة التي تعيش في هذا العنوان؟ يجب إخيار ");
    } else if (HhsStatic.householdQuestions.hhsDwellingType == null) {
      return Validator.showSnack(
          context, " 1. ما أفضل وصف لهذا النوع من المسكن؟ يجب إخيار ");
    } else if (HhsStatic.householdQuestions.hhsIsDwelling == null) {
      return Validator.showSnack(
          context, " 2.ما هي حالة إيجار / ملكية المسكن؟ يجب إخيار ");
    } else if (HhsStatic.householdQuestions.hhsTotalIncome == null||HhsStatic.householdQuestions.hhsTotalIncome == "") {
      return Validator.showSnack(context,
          "  يجب إخيار ! .يرجى الإشارة إلى أي من النطاقات التالية يقع إجمالي دخل أسرتك الشهري بما في ذلك المزايا؟");
    } else if (VehModel.nearestPublicTransporter == '') {
      return Validator.showSnack(context,
          " يجب إخيار ! .كم تبعد اقرب محطة حافلات نقل عام عن منزلك سيرا على الاقدام ؟");
    }

    else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const VehiclesScreen()));
    }
  }
}

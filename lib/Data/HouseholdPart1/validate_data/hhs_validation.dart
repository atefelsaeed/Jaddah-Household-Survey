import 'package:flutter/material.dart';

import '../../../Helper/validator.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../UI/Screens/vechicles/vechicles_screen.dart';

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
    } else if (HhsStatic.householdQuestions.hhsTotalIncome == null) {
      return Validator.showSnack(context,
          " 8.يرجى الإشارة إلى أي من النطاقات التالية يقع إجمالي دخل أسرتك الشهري بما في ذلك المزايا؟ يجب إخيار ");
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const VehiclesScreen()));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/trip_screen.dart';

import '../PersonData/person_model_list.dart';

class CheckPersonValidation {
  static validatePerson(context) {
    for (var element in PersonModelList.personModelList) {
      if (element.personalHeadData!.age.text == '') {
        return Validator.showSnack(context, "الفئة العمرية؟ يجب إخيار ");
      } else if (element.personalHeadData!.nationalityType == '') {
        return Validator.showSnack(context, "الجنسية؟ يجب إخيار ");
      } else if (element.personalHeadData!.gender == '') {
        return Validator.showSnack(context, "الجنس يجب إخيار ");
      }



      else if (element.personalHeadData!.relationshipHeadHHS == '') {
        return Validator.showSnack(context, "القرابة برب الاسرة؟ يجب إخيار ");
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TripScreen()));
      }
    }
  }
}

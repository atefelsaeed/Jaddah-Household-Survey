import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/UI/Screens/person/person_screen.dart';

import '../VechelisData/veh_model.dart';

class CheckVehiclesValidation {
  static validate(context) {
    if (VehModel.fuelTypeCode == null) {
      return Validator.showSnack(context, "أكواد نوع الوقود؟ يجب إخيار ");
    } else if (VehModel.ownerShipCode == null) {
      return Validator.showSnack(context, "رموز الملكية؟ يجب إخيار ");
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const PersonScreen()));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/UI/Screens/person/person_screen.dart';

import '../VechelisData/veh_model.dart';

class CheckVehiclesValidation {
  static validate(context) {
    if (VehModel.fuelTypeCode == '') {
      return Validator.showSnack(context, "أكواد نوع الوقود؟ يجب إخيار ");
    } else if (VehModel.ownerShipCode == '') {
      return Validator.showSnack(context, "رموز الملكية؟ يجب إخيار ");
    } else if (VehModel.parkThisCar == '') {
      return Validator.showSnack(context,
          "عندما تكون في المنزل ، أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات يجب إخيار ");
    } else if (VehModel.nearestPublicTransporter == '') {
      return Validator.showSnack(context,
          ".كم تبعد اقرب محطة حافلات نقل عام عن منزلك سيرا على الاقدام ؟ يجب إخيار ");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PersonScreen(),
        ),
      );
    }
  }
}

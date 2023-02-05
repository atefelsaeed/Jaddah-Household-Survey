import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/UI/Screens/person/person_screen.dart';

import '../VechelisData/veh_model.dart';

class CheckVehiclesValidation {
  static validate(context) {
    // if (VehModel.fuelTypeCode == '') {
    //   return Validator.showSnack(context, " يجب إخيار ! أكواد نوع الوقود؟");
    // } else

      if (VehModel.ownerShipCode == '') {
      return Validator.showSnack(context, " يجب إخيار ! رموز الملكية؟");
    } else if (VehModel.parkThisCar == '') {
      return Validator.showSnack(context,
          " يجب إخيار ! عندما تكون في المنزل ، أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات .");
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

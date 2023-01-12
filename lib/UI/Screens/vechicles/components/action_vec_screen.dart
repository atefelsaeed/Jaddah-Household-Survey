import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/save_data.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/auth.dart';
import '../../../../Providers/survey_hhs.dart';
import '../../../Widgets/custom_buttton.dart';
import '../../Surveies/surveys_screen.dart';
import '../../person/person_screen.dart';

class ActionVecScreen extends StatelessWidget {
  const ActionVecScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return DefaultButton(
      function: () {
        SaveVehiclesData.saveData(context);

        print('Saving Data :: ');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PersonScreen(),
          ),
        );
      },
      isWidget: true,
      text: "Finish",
      widget: const Icon(Icons.arrow_forward),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/save_data.dart';
import 'package:jaddah_household_survey/Providers/auth.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/trip_screen.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/surveys.dart';
import '../../../Widgets/custom_buttton.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';

class NextStep extends StatelessWidget {
  const NextStep({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      function: () {
        SavePersonData.saveData(context);
        print('Saving Data :: ');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TripScreen(),
          ),
        );
      },
      isWidget: true,
      text: "التالي",
      widget: const Icon(Icons.arrow_forward),
    );
  }
}

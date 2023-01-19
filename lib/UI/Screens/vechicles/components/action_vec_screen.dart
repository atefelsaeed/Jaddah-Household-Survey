import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/save_data.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';

import '../../../Widgets/custom_buttton.dart';
import '../../person/person_screen.dart';

class ActionVecScreen extends StatelessWidget {
  const ActionVecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultButton(
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
          text: "التالي",
          widget: const Icon(Icons.arrow_forward),
        ),
        DefaultButton(
          function: () {
            Navigator.pop(context);
          },
          isWidget: true,
          background: ColorManager.grayColor,
          text: "السابق",
          widget: const Icon(Icons.arrow_back_rounded),
        ),
      ],
    );
  }
}

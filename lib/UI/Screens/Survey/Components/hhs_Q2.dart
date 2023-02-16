// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../widgets/text_form_row.dart';

class HHSQ2 extends StatefulWidget {
  const HHSQ2({Key? key}) : super(key: key);

  @override
  State<HHSQ2> createState() => _HHSQ2State();
}

class _HHSQ2State extends State<HHSQ2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropDownFormInput(
              onChange: (String? p) {
                setState(() {
                  HhsStatic.householdQuestions.hhsIsDwelling = p;
                });
              },
              label: HhsStatic.householdQuestions.hhsIsDwelling !=null
                  ? Text(HhsStatic.householdQuestions.hhsIsDwelling??'')
                  : const Text('إختار'),
              hint: "2.ملكية المسكن؟",
              options: QuestionsData
                  .qh2[QuestionsData.qh2.keys.first]!
                  .toList(),
            ),
          ],
        ),
        HhsStatic.householdQuestions.hhsIsDwelling == "أخر"
            ? Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextForm(
              controller: HhsStatic
                  .householdQuestions.hhsIsDwellingOther!,
              text: "2.ملكية المسكن؟",
              label: "2.ملكية المسكن؟",
            )
          ],
        )
            : Container(),

        AppSize.spaceHeight3(context),
      ],
    );
  }
}

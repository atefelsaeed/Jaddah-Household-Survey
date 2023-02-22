import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/editing_controler3.dart';
import 'package:provider/provider.dart';

import '../../../Models/HHS_SurvyModels/survey_hhs.dart';
import '../../../Providers/survey_hhs.dart';

class EditingController {


  final TextEditingController yes = TextEditingController();

  final TextEditingController peopleAdults18 = TextEditingController();
  final TextEditingController peopleUnder18 = TextEditingController();
  List<TextEditingController> q6peopleAdults18 = <TextEditingController>[
    TextEditingController()
  ];

  List<TextEditingController> q6peopleUnder18 = <TextEditingController>[
    TextEditingController()
  ];

  List<TextEditingController> q6totalNumberOfVec = <TextEditingController>[
    TextEditingController()
  ];

  EditingController3 editingController3Q81 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  EditingController3 editingController3Q82 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  EditingController3 editingController3Q83 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());



}
 c(EditingController editingController,BuildContext context){
   print('surveyPT.householdQuestions.hhsElectricCycles.adultsBikesNumber');
   SurveyPTProvider surveyPt =
   Provider.of<SurveyPTProvider>(context, listen: false);

   surveyPt.getAllLocalData();
  editingController.peopleUnder18.text=surveyPt!.headerZoneNumber.toString();
}
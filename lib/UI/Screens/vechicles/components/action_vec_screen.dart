import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/save_data.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/survey_hhs.dart';
import '../../../Widgets/custom_buttton.dart';

class ActionVecScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    SurveysProvider surveys = Provider.of<SurveysProvider>(context,
        listen: false); // TODO: implement build
    return DefaultButton(
      function: () {
        //   surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="kkk";
        SaveVehiclesData.saveData(context);
        surveys.addSurvey(surveyPt.data);
      },
      isWidget: true,
      text: "Finish",
      widget: const Icon(Icons.arrow_forward),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

import '../../../../Data/HouseholdPart1/empty_data.dart';
import '../../../../Data/app_constants.dart';
import '../../../../Models/user_serveys_model.dart';
import '../../../../Resources/colors.dart';
import '../../../Widgets/custom_buttton.dart';
import '../../Survey/syrvey_screen.dart';

class EditedButton extends StatelessWidget {
  const EditedButton({Key? key, required this.function}) : super(key: key);
  final Function function;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      function: () {
        function();
      },
      //edited
      isWidget: true,
      background: Colors.green,
      text: 'تم التعديل',
      btnWidth: width(context) * .35,
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
    required this.function,
    required this.itemSurveyModel,
  }) : super(key: key);
  final Function function;
  final UserSurveysModelData itemSurveyModel;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      function: () {
        function();
        AppConstants.isResetHHS = true;
        AppConstants.isResetPerson = true;
        AppConstants.isResetTrip = true;
        AppConstants.isResetVec = true;
        HHSEmptyData.emptyData();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurveyScreen(
              itemSurveyModel: itemSurveyModel,
            ),
          ),
        );
      },
      //edited
      isWidget: true,
      background: ColorManager.yellowLiner,
      text: 'تعديل الاستبيان',
      btnWidth: width(context) * .35,
    );
  }
}

class FilledButton extends StatelessWidget {
  const FilledButton({Key? key, required this.function}) : super(key: key);
  final Function function;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      function: () {
        function();
      },
      //edited
      isWidget: true,
      background: ColorManager.grayColor,
      text: 'تم الاستبيان',
      btnWidth: width(context) * .35,
    );
  }
}

class NotFilledButton extends StatelessWidget {
  const NotFilledButton({
    Key? key,
    required this.function,
    required this.itemSurveyModel,
  }) : super(key: key);
  final Function function;
  final UserSurveysModelData itemSurveyModel;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      function: () {
        function();
        AppConstants.isResetHHS = false;
        AppConstants.isResetPerson = false;
        AppConstants.isResetTrip = false;
        AppConstants.isResetVec = false;
        HHSEmptyData.emptyData();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurveyScreen(
              itemSurveyModel: itemSurveyModel,
            ),
          ),
        );
      },
      //edited
      isWidget: true,
      background: ColorManager.primaryColor,
      text: 'بدأ استبيان',
      btnWidth: width(context) * .35,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/UserSurveys/itemSurveyModel.dart';

import 'itemUserSurvey.dart';

class UserSurveysScreen extends StatelessWidget {
  const UserSurveysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.subdirectory_arrow_left_rounded,
                  color: ColorManager.primaryColor,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'العودة للرئيسية',
                    style: TextStyle(
                        color: ColorManager.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: width(context) * .045),
                  ),
                ),
              ],
            ),
            AppSize.spaceHeight2(context),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ItemUserSurvey(
                    itemSurveyModel: ItemSurveyModel(
                      numberSurvey: 15,
                      locationLink: '',
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: ColorManager.grayColor,
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      )),
    );
  }
}

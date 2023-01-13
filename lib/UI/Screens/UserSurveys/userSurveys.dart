import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

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
                    'Home',
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
                  return const ItemUserSurvey();
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

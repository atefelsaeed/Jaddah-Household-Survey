import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Models/HHS_SurvyModels/hhs_models.dart';
import 'package:jaddah_household_survey/UI/Widgets/headline.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../../Providers/survey_hhs.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../widgets/list_view_check_box_orange.dart';
import '../widgets/text_form_row.dart';

class HouseHoldAddress extends StatefulWidget {
  const HouseHoldAddress({
    super.key,
  });

  @override
  State<HouseHoldAddress> createState() => _HouseHoldAddressState();
}

class _HouseHoldAddressState extends State<HouseHoldAddress> {
  bool hasPasTrip = false;

  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppSize.spaceHeight2(context),
        const HeadlinePerson(text: 'HHS-'),
        AppSize.spaceHeight1(context),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight2(context),
        ListViewCheckBoxOrange(
          map: QuestionsData.qh7_2,
          onChange: (ChangeBoxResponse r) {
            setState(() {
              if (r.val == "نعم" && r.check == true) {
                hasPasTrip = true;
                HhsStatic.householdAddress.hhsHavePastTrip.text = '';
              } else {
                hasPasTrip = false;
                HhsStatic.householdAddress.hhsHavePastTrip.text = 'لا';
              }
            });
          },
          isListView: true,
          title: "هل قمت برحلة فى الأيام السابقة",
          question:
              QuestionsData.qh7_2[QuestionsData.qh7_2.keys.first]!.toList(),
          subTitle: "",
        ),
        hasPasTrip == true
            ? TextForm(
                label: 'إذكر الرحلة',
                text: 'إذكر الرحلة',
                controller: HhsStatic.householdAddress.hhsHavePastTrip,
              )
            : Container(),
        const Divider(
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    width: width(context) * .45,
                    child: TextGlobal(
                      text: "رقم الهاتف",
                      fontSize: height(context) * .02,
                      color: ColorManager.black,
                    )),
                AppSize.spaceHeight1(context),
                MyTextForm(
                  label: "رقم الهاتف",
                  controller: HhsStatic.householdAddress.hhsPhone,
                  isNumber: true,
                  keyboardType: TextInputType.phone,
                ),
              ],
            )
          ],
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}

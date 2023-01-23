import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

import '../../../../Resources/colors.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class Q5 extends StatelessWidget {
  const Q5({
    super.key,
    required this.peopleAdults18,
    required this.peopleUnder18,
  });

  final TextEditingController peopleAdults18;

  final TextEditingController peopleUnder18;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: TextGlobal(
              text:
                  "5.كم عدد أفراد عائلتك الذين يعيشون بشكل دائم في هذا المنزل؟",
              fontSize: height(context) * .02,
              color: ColorManager.black,
            )),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                TextGlobal(
                  text: "الاطفال",
                  fontSize: height(context) * .015,
                  color: ColorManager.black,
                ),
                AppSize.spaceWidth1(context),
                MyTextForm(
                  label: "",
                  controller: peopleUnder18,
                  widthForm: width(context) * .1,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            AppSize.spaceWidth3(context),
            Row(
              children: [
                TextGlobal(
                  text: "البالغين",
                  fontSize: height(context) * .017,
                  color: ColorManager.grayColor,
                ),
                AppSize.spaceWidth1(context),
                MyTextForm(
                  label: "",
                  controller: peopleAdults18,
                  widthForm: width(context) * .1,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class AdultsOrNot extends StatelessWidget {
  const AdultsOrNot({super.key, required this.adultsModel});

  final AdultsModel adultsModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: adultsModel.text,
              fontSize: height(context) * .02,
              color: ColorManager.black,
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                MyTextForm(
                  label: "",
                  controller: adultsModel.adultsMin18,
                  widthForm: width(context) * .07,
                ),
                AppSize.spaceWidth1(context),
                TextGlobal(
                  text: "children (under 18yrs)",
                  fontSize: height(context) * .015,
                  color: ColorManager.black,
                ),
              ],
            ),
            AppSize.spaceWidth3(context),
            Row(
              children: [
                MyTextForm(
                  label: "",
                  controller: adultsModel.adultsPlus18,
                  widthForm: width(context) * .07,
                ),
                AppSize.spaceWidth1(context),
                TextGlobal(
                  text: "adults (18yrs +)",
                  fontSize: height(context) * .017,
                  color: ColorManager.grayColor,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class AdultsModel {
  TextEditingController adultsPlus18;
  TextEditingController adultsMin18;
  final String text;

  AdultsModel(
      {required this.adultsPlus18,
        required this.adultsMin18,
        required this.text});
}
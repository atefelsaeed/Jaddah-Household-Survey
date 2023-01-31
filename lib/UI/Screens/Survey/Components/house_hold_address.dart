import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/survey_hhs.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/item_point.dart';
import '../../../Widgets/text.dart';

class HouseHoldAddress extends StatefulWidget {
  final TextEditingController phoneController;

  const HouseHoldAddress({
    super.key,
    required this.phoneController,
  });

  @override
  State<HouseHoldAddress> createState() => _HouseHoldAddressState();
}

class _HouseHoldAddressState extends State<HouseHoldAddress> {
  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ItemPoint(),
            Row(
              children: [
                TextGlobal(
                  text: "مسح يوميات الذاهاب المنزلي",
                  fontSize: height(context) * .023,
                  color: ColorManager.black,
                ),
              ],
            ),
            AppSize.spaceWidth2(context),
          ],
        ),
        AppSize.spaceHeight1(context),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight2(context),
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
                  controller: widget.phoneController,
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

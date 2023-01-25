import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../widgets/text_form_row.dart';

class HouseHoldAddress extends StatelessWidget {
  final String area;
  final TextEditingController streetName;

  final TextEditingController streetNumber;

  final TextEditingController nearestLandMark;
  final TextEditingController blockNearestTwoCrossStreets;

  const HouseHoldAddress({
    super.key,
    required this.area,
    required this.blockNearestTwoCrossStreets,
    required this.nearestLandMark,
    required this.streetNumber,
    required this.streetName,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController hayController = TextEditingController();
    hayController.text = area;
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppSize.spaceWidth2(context),
            Column(
              children: [
                CircleAvatar(
                    backgroundColor: ColorManager.orangeTxtColor,
                    radius: height(context) * .013),
                AppSize.spaceHeight05(context),
                Container(
                  color: ColorManager.orangeTxtColor,
                  width: width(context) * .03,
                  height: height(context) * .003,
                )
              ],
            ),
            AppSize.spaceWidth2(context),
            TextGlobal(
              text: "مسح يوميات الذاهاب المنزلي",
              fontSize: height(context) * .023,
              color: ColorManager.black,
            ),
            AppSize.spaceWidth2(context),
          ],
        ),
        AppSize.spaceHeight1(context),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: hayController,
                text: "الحى",
                readOnly: true,
                label: "الحى",
              ),
              TextForm(
                controller: streetNumber,
                label: "رقم الشارع",
                text: "رقم الشارع",
                keyboardType: TextInputType.number,
                isNumber: true,
              ),
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: streetName,
                text: "اسم الشارع",
                label: "اسم الشارع",
                isNumber: false,
              ),
              TextForm(
                controller: nearestLandMark,
                label: " أقرب معلم",
                text: " أقرب معلم",
                isNumber: false,
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: blockNearestTwoCrossStreets,
                text: "أقرب تقاطع",
                label: "أقرب تقاطع",
                isNumber: false,
              ),
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}

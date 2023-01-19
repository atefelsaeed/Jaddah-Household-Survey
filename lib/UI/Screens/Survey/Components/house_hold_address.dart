import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../widgets/text_form_row.dart';

class HouseHoldAddress extends StatelessWidget {
  final TextEditingController area;

  final TextEditingController zoneNumber;

  final TextEditingController buildingName;

  final TextEditingController streetName;

  final TextEditingController streetNumber;

  final TextEditingController city;
  final TextEditingController nearestLandMark;
  final TextEditingController blockNearestTwoCrossStreets;

  const HouseHoldAddress({
    super.key,
    required this.area,
    required this.blockNearestTwoCrossStreets,
    required this.city,
    required this.nearestLandMark,
    required this.streetNumber,
    required this.zoneNumber,
    required this.streetName,
    required this.buildingName,
  });

  @override
  Widget build(BuildContext context) {
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
              text: "مسح يوميات السفر المنزلي",
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
                controller: buildingName,
                text: "اسم المبنى",
                label: "اسم المبنى",
              ),
              TextForm(
                controller: streetName,
                text: "اسم الشارع",
                label: "اسم الشارع",
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
                controller: streetNumber,
                label: "رقم الشارع",
                text: "رقم الشارع",
                keyboardType: TextInputType.number,
              ),
              TextForm(
                controller: nearestLandMark,
                label: " أقرب معلم",
                text: " أقرب معلم",
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
                text: "مجمع / أقرب شارعين متقاطعين",
                label: "مجمع / أقرب شارعين متقاطعين",
              ),
              TextForm(
                controller: area,
                text: "المنطقة (الحى)",
                label: "المنطقة (الحى)",
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextForm(
                controller: city,
                text: "المدينة",
                label: "المدينة",
              ),
              //  TextForm(controller: area,text: "Area (Suburb)",label: "أدخل  Area (Suburb) ",)
            ],
          ),
        ),
        AppSize.spaceHeight3(context),
      ],
    );
  }
}

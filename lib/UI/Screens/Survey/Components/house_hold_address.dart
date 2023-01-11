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

  const HouseHoldAddress(
      {super.key,
      required this.area,
      required this.blockNearestTwoCrossStreets,
      required this.city,
      required this.nearestLandMark,
      required this.streetNumber,
      required this.zoneNumber,
      required this.streetName,
      required this.buildingName});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppSize.spaceWidth1(context),
            TextGlobal(
              text: "Household address",
              fontSize: height(context) * .023,
              color: ColorManager.black,
            ),
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
            )
          ],
        ),
        AppSize.spaceHeight1(context),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: buildingName,
                text: "Building Name",
                label: "Enter Building Name",
              ),
              TextForm(
                controller: streetName,
                text: "street Name",
                label: "Enter Street Name",
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: streetNumber,
                label: "Street Number",
                text: "Enter Street Number",
              ),
              TextForm(
                controller: nearestLandMark,
                label: "Nearest Land Mark ",
                text: "Enter Nearest Land Mark ",
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: blockNearestTwoCrossStreets,
                text: "Block/Nearest two cross streets",
                label: "Enter Block/Nearest two cross streets",
              ),
              TextForm(
                controller: area,
                text: "Area (Suburb)",
                label: "Enter Area (Suburb) ",
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: city,
                text: "City/ Town",
                label: "Enter City/ Town",
              ),
              //  TextForm(controller: area,text: "Area (Suburb)",label: "Enter Area (Suburb) ",)
            ],
          ),
        ),
        AppSize.spaceHeight3(context),
      ],
    );
  }
}

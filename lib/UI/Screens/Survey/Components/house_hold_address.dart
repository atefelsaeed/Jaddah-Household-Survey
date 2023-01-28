import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/UI/Widgets/item_text_span.dart';
import 'package:jaddah_household_survey/UI/Widgets/map.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/alert_map.dart';
import '../../../Widgets/text.dart';
import '../widgets/text_form_row.dart';

class HouseHoldAddress extends StatelessWidget {
  final String area;
  final TextEditingController streetName;

  final TextEditingController streetNumber;
  final TextEditingController phoneController;
  final TextEditingController nearestLandMark;
  final String blockName;

  const HouseHoldAddress({
    super.key,
    required this.area,
    required this.blockName,
    required this.nearestLandMark,
    required this.phoneController,
    required this.streetNumber,
    required this.streetName,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController hayController = TextEditingController();
    TextEditingController blockController = TextEditingController();

    hayController.text = area;
    blockController.text = blockName;
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
        Row(
          children: [
            const Image(image: AssetImage(ImageAssets.locationIcon)),
            AppSize.spaceWidth2(context),
            const Text('الإحداثيات'),
            const Spacer(),
            IconButton(
                onPressed: () {
                  alertMap(() {});
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => MapSample()));
                },
                icon: Icon(
                  Icons.pin_drop,
                  color: ColorManager.primaryColor,
                  size: width(context) * .1,
                )),
          ],
        ),
        Row(
          children: [
            const ItemTextSpan(title: "Lat", subTitle: "55555555"),
            AppSize.spaceWidth3(context),
            const ItemTextSpan(title: "Long", subTitle: "55555555"),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextForm(
              controller: phoneController,
              text: "رقم الهاتف",
              label: "رقم الهاتف",
              isNumber: true,
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}

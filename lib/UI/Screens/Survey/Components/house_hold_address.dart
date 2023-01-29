import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/UI/Widgets/item_text_span.dart';
import 'package:jaddah_household_survey/UI/Widgets/map.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../../main.dart';
import '../../../Widgets/alert_map.dart';
import '../../../Widgets/text.dart';
import '../widgets/text_form_row.dart';

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
    setState(() {});
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const AlertMap(title: '',)));
                },
                icon: Icon(
                  Icons.pin_drop,
                  color: ColorManager.primaryColor,
                  size: width(context) * .1,
                )),
          ],
        ),
        // Row(
        //   children: [
        //     ItemTextSpan(
        //         title: "Lat",
        //         subTitle: Constants.location2?.latitude.toString() ?? ""),
        //     AppSize.spaceWidth3(context),
        //     ItemTextSpan(
        //         title: "Long",
        //         subTitle: Constants.location2?.longitude.toString() ?? ""),
        //   ],
        // ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextForm(
              controller: widget.phoneController,
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

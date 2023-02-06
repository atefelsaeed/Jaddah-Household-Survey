import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Models/HHS_SurvyModels/hhs_models.dart';
import 'package:jaddah_household_survey/UI/Widgets/headline.dart';
import 'package:jaddah_household_survey/UI/Widgets/item_text_span.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Models/user_serveys_model.dart';
import '../../../../Resources/assets_manager.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class HouseHoldAddress extends StatefulWidget {
  const HouseHoldAddress({
    super.key,
    required this.itemSurveyModel,
  });

  final UserSurveysModelData itemSurveyModel;

  @override
  State<HouseHoldAddress> createState() => _HouseHoldAddressState();
}

class _HouseHoldAddressState extends State<HouseHoldAddress> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppSize.spaceHeight2(context),
        const HeadlinePerson(text: 'HHS-'),
        AppSize.spaceHeight1(context),
         Divider(thickness: 1,color: ColorManager.primaryColor,),
        AppSize.spaceHeight1(context),
        Row(
          children: [
            const Image(image: AssetImage(ImageAssets.locationIcon)),
            AppSize.spaceWidth1(context),
            Text(
              "عنوان الاسرة: ",
              style: TextStyle(
                color: ColorManager.grayColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemTextSpan(
                title: 'رقم الاسرة',
                subTitle: widget.itemSurveyModel.id.toString()),
            ItemTextSpan(
                title: 'رقم الحى',
                subTitle: widget.itemSurveyModel.haeno.toString()),
          ],
        ),
        Row(
          children: [
            ItemTextSpan(
                title: 'رقم القطاع',
                subTitle: widget.itemSurveyModel.qta.toString()),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight1(context),
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

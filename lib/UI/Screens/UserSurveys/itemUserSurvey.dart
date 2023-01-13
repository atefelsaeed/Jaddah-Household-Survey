import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Widgets/custom_buttton.dart';

class ItemUserSurvey extends StatelessWidget {
  const ItemUserSurvey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const Image(image: AssetImage(ImageAssets.lampIcon)),
              AppSize.spaceWidth1(context),
              Text(
                "Family number: 125",
                style: TextStyle(
                  color: ColorManager.grayColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              DefaultButton(
                function: () {},
                isWidget: true,
                text: 'Start Survey',
                btnWidth: width(context) * .35,
              ),
            ],
          ),
          AppSize.spaceHeight2(context),
          Row(
            children: [
              const Image(image: AssetImage(ImageAssets.locationIcon)),
              AppSize.spaceWidth1(context),
              Text(
                "Family Address: Write the address in detail",
                style: TextStyle(
                  color: ColorManager.grayColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Open Google Maps',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.black,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

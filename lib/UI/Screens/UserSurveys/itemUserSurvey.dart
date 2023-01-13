import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Widgets/custom_buttton.dart';
import 'package:url_launcher/url_launcher.dart';

import 'itemSurveyModel.dart';

class ItemUserSurvey extends StatelessWidget {
  const ItemUserSurvey({Key? key, required this.itemSurveyModel})
      : super(key: key);
  final ItemSurveyModel itemSurveyModel;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

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
                "رقم الاسرة : ${itemSurveyModel.numberSurvey}",
                style: TextStyle(
                  color: ColorManager.grayColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              DefaultButton(
                function: () {},
                isWidget: true,
                text: 'بدأ استبيان',
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
                "عنوان الاسرة  :  يكتب العنوان بالتفاصيل ",
                style: TextStyle(
                  color: ColorManager.grayColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                onPressed: () async {
                  var uri = Uri.parse(itemSurveyModel.locationLink);
                  await _launchInBrowser(uri);
                },
                child: Text(
                  'افتح خرائط جوجل',
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

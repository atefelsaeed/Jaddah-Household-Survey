import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/syrvey_screen.dart';
import 'package:jaddah_household_survey/UI/Widgets/custom_buttton.dart';
import 'package:jaddah_household_survey/UI/Widgets/item_text_span.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Data/HouseholdPart1/empty_data.dart';
import '../../../Models/user_serveys_model.dart';

class ItemUserSurvey extends StatelessWidget {
  const ItemUserSurvey({Key? key, required this.itemSurveyModel})
      : super(key: key);
  final UserSurveysModelData itemSurveyModel;

  launchURL(String lat, long) async {
    final String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$long,$lat";

    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);
    print(encodedURl);
    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      print('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Image(image: AssetImage(ImageAssets.lampIcon)),
            AppSize.spaceWidth1(context),
            Text(
              "رقم الاسرة : ",
              style: TextStyle(
                color: ColorManager.grayColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "${itemSurveyModel.id}",
              style: TextStyle(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            itemSurveyModel.status == "not filled"
                ? DefaultButton(
                    function: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurveyScreen(
                            id: itemSurveyModel.id.toString(),
                            itemSurveyModel: itemSurveyModel,
                          ),
                        ),
                      );
                      itemSurveyModel.id;
                      HHSEmptyData.emptyData();
                    },
                    isWidget: true,
                    text: 'بدأ استبيان',
                    btnWidth: width(context) * .35,
                  )
                : DefaultButton(
                    function: () {},
                    isWidget: true,
                    background: ColorManager.grayColor,
                    text: 'تم الاستبيان',
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
              "عنوان الاسرة: ",
              style: TextStyle(
                color: ColorManager.grayColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () async {
                await launchURL(
                    itemSurveyModel.x.toString(), itemSurveyModel.y.toString());
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width(context) * .6,
              child: ItemTextSpan(
                  title: "إسم الحى",
                  subTitle: itemSurveyModel.hAEName.toString()),
            ),
            SizedBox(
              width: width(context) * .3,
              child: ItemTextSpan(
                  title: "رقم الحى",
                  subTitle: itemSurveyModel.haeno.toString()),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width(context) * .6,
              child: ItemTextSpan(
                  title: "إسم البلوك",
                  subTitle: itemSurveyModel.blokname.toString()),
            ),
            SizedBox(
              width: width(context) * .3,
              child: ItemTextSpan(
                  title: "رقم البلوك",
                  subTitle: itemSurveyModel.blok.toString()),
            ),
          ],
        ),
        ItemTextSpan(
            title: "رقم القطاع", subTitle: itemSurveyModel.qta.toString()),
      ],
    );
  }
}

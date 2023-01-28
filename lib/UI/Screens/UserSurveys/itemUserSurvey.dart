import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/syrvey_screen.dart';
import 'package:jaddah_household_survey/UI/Widgets/custom_buttton.dart';
import 'package:jaddah_household_survey/UI/Widgets/item_text_span.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../Data/HouseholdPart1/empty_data.dart';
import '../../../Models/user_serveys_model.dart';

class ItemUserSurvey extends StatelessWidget {
  const ItemUserSurvey({Key? key, required this.itemSurveyModel})
      : super(key: key);
  final UserSurveysModelData itemSurveyModel;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

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
            ), Text(
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
                            hayName: itemSurveyModel.hAEName ?? '', //not filled
                            blockName: itemSurveyModel.blokname ?? "",
                          ),
                        ),
                      );
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setInt('userSurveyId', itemSurveyModel.id!);
                      itemSurveyModel.id;
                      QuestionsData.qh4[QuestionsData.qh4.keys.first]!
                              .toList()[QuestionsData.qh4["index"]]["isChick"] =
                          false;
                      QuestionsData.qh7[QuestionsData.qh7.keys.first]!
                              .toList()[QuestionsData.qh7["index"]]["isChick"] =
                          false;
                      QuestionsData.qh7_2[QuestionsData.qh7_2.keys.first]!
                              .toList()[QuestionsData.qh7_2["index"]]
                          ["isChick"] = false;
                      VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first]!
                              .toList()[VehiclesData.q3VecData["index"]]
                          ["isChick"] = false;
                      PersonData.nationality[PersonData.nationality.keys.first]!
                              .toList()[PersonData.nationality["index"]]
                          ["isChick"] = false;
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
            ItemTextSpan(
                title: "إسم الحى",
                subTitle: itemSurveyModel.hAEName.toString()),
            ItemTextSpan(
                title: "رقم الحى", subTitle: itemSurveyModel.haeno.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemTextSpan(
                title: "إسم البلوك",
                subTitle: itemSurveyModel.blokname.toString()),
            ItemTextSpan(
                title: "رقم البلوك", subTitle: itemSurveyModel.blok.toString()),
          ],
        ),
        ItemTextSpan(
            title: "رقم القطاع", subTitle: itemSurveyModel.qta.toString()),
      ],
    );
  }
}

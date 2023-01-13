import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

class ItemHomeSurvey extends StatelessWidget {
  const ItemHomeSurvey({Key? key, required this.count}) : super(key: key);
final int count;
  @override
  Widget build(BuildContext context) {
    return   Card(
      margin: EdgeInsets.symmetric(
          horizontal: width(context) * .1,
          vertical: height(context) * .03),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'مسح يوميات السفر المنزلي',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            AppSize.spaceHeight5(context),
            Row(
              children: [
                const Image(
                    image: AssetImage(
                      ImageAssets.iconLambGray,
                    )),
                AppSize.spaceWidth2(context),
                Text('عدد الاستبيانات',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: ColorManager.grayColor,
                    )),
                const Spacer(),
                Text(
                 count.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: ColorManager.primaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class HeadlinePerson extends StatelessWidget {
final  String text;
  const HeadlinePerson({super.key, required this. text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppSize.spaceWidth1(context),
        TextGlobal(
          text: text,
          fontSize: height(context) * .023,
          color: ColorManager.orangeTxtColor,
        ),
      ],
    );
  }
}


class HeadLine extends StatelessWidget {
  const HeadLine({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextGlobal(
                text: title,
                fontSize: height(context) * .02,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight05(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextGlobal(
                text: subTitle,
                fontSize: height(context) * .013,
                color: ColorManager.grayColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class HeadlineTrip extends StatelessWidget {
  final String text;

  const HeadlineTrip({required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppSize.spaceWidth1(context),
        TextGlobal(
          text: text,
          fontSize: height(context) * .015,
          color: ColorManager.black,
        ),
        AppSize.spaceWidth2(context),
        Column(
          children: [
            CircleAvatar(
                backgroundColor: ColorManager.black,
                radius: height(context) * .013),
            AppSize.spaceHeight05(context),
            Container(
              color: ColorManager.black,
              width: width(context) * .03,
              height: height(context) * .003,
            )
          ],
        )
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class TimeLeave extends StatelessWidget {
  final TextEditingController expectedDeparture;

  const TimeLeave({super.key, required this.expectedDeparture});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: "Expected Departure Time	 (24 hour clock)",
              fontSize: height(context) * .020,
              color: ColorManager.black,
            )
          ],
        ),
        AppSize.spaceHeight1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextGlobal(
                text: "	the very first trip should be the one after 03.00am",
                fontSize: height(context) * .015,
                color: ColorManager.grayColor,
              ),
            ),
            AppSize.spaceWidth2(context),
            MyTextForm(
              label: "Expected Departure Time	 (24 hour clock)",
              controller: expectedDeparture,
            ),

            //  TextForm(controller: expectedDeparture,text: "	Expected Departure Time	 (24 hour clock)",label: "Enter 	Expected Departure Time	 (24 hour clock)",),
          ],
        )
      ],
    );
  }
}
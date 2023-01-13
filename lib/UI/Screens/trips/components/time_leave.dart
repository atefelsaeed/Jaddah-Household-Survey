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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextGlobal(
              text: "في أي وقت غادرت؟",
              fontSize: height(context) * .020,
              color: ColorManager.black,
            )
          ],
        ),
        AppSize.spaceHeight1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            MyTextForm(
              label: "وقت المغادرة المتوقع",
              controller: expectedDeparture,
            ),
            AppSize.spaceWidth2(context),

            //  TextForm(controller: expectedDeparture,text: "	Expected Departure Time	 (24 hour clock)",label: "Enter 	Expected Departure Time	 (24 hour clock)",),
          ],
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../../Resources/style_manager.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class TimeLeave extends StatefulWidget {
  final TextEditingController expectedDeparture;

  const TimeLeave({super.key, required this.expectedDeparture});

  @override
  State<TimeLeave> createState() => _TimeLeaveState();
}

class _TimeLeaveState extends State<TimeLeave> {
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
              controller: widget.expectedDeparture,
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return StyleManager.selectTime(context, child);
                  },
                  context: context,
                );

                if (pickedTime != null) {
                  setState(() {
                    widget.expectedDeparture.text = pickedTime
                        .format(context); //set the value of text field.
                  });
                } else {
                  print("Time is not selected");
                }
              },
            ),
            AppSize.spaceWidth2(context),

            //  TextForm(controller: expectedDeparture,text: "	Expected Departure Time	 (24 hour clock)",label: "أدخل  	Expected Departure Time	 (24 hour clock)",),
          ],
        )
      ],
    );
  }
}

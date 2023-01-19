import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/field_widget.dart';
import 'package:jaddah_household_survey/UI/Widgets/text.dart';

import '../widgets/editing_controler3.dart';

class Q82 extends StatelessWidget {
  EditingController3 editingController3;

  Q82({super.key, required this.editingController3});

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
                text:
                    "كم عدد الدراجات الكهربائية التي تمتلكها أو تستخدمها هذه الأسرة؟",
                fontSize: height(context) * .017,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Field(
            function: () {},
            showDeleteIcon: false,
            peopleAdults18: editingController3.peopleAdults18,
            peopleUnder18: editingController3.peopleUnder18,
            totalNumberOfVecText: "إجمالي عدد الدرجات",
            totalNumberOfVec: editingController3.totalNumber,
            peopleAdults18Text: "البالغين",
            peopleUnder18Text: "الاطفال")
      ],
    );
  }
}

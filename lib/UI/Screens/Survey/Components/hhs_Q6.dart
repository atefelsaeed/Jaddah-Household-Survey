import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Widgets/text.dart';

import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/custom_buttton.dart';
import '../widgets/field_widget.dart';

class Q6 extends StatefulWidget {
  Q6({
    super.key,
    required this.q6peopleAdults18,
    required this.q6peopleUnder18,
    required this.q6totalNumberOfVec,
  });

  List<TextEditingController> q6peopleAdults18 = <TextEditingController>[
    TextEditingController()
  ];
  List<TextEditingController> q6peopleUnder18 = <TextEditingController>[
    TextEditingController()
  ];
  List<TextEditingController> q6totalNumberOfVec = <TextEditingController>[
    TextEditingController()
  ];

  @override
  State<Q6> createState() => _Q6State();
}

class _Q6State extends State<Q6> {
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
              text: "4.كم عدد الأشخاص في كل عائلة منفصلة تعيش في هذا العنوان؟",
              fontSize: height(context) * .02,
              color: ColorManager.black,
            )),
          ],
        ),
        AppSize.spaceHeight1(context),
        AppSize.spaceHeight2(context),
        for (int i = 0; i < widget.q6peopleAdults18.length; i++)
          Column(
            children: [
              Field(
                  peopleAdults18: widget.q6peopleAdults18[i],
                  function: () {
                    setState(() {
                      widget.q6peopleAdults18.removeAt(i);
                      widget.q6peopleUnder18.removeAt(i);
                      widget.q6totalNumberOfVec.removeAt(i);
                    });
                  },
                  showDeleteIcon: i >= 1 ? true : false,
                  peopleUnder18Text: "الاطفال",
                  peopleAdults18Text: "البالغين",
                  totalNumberOfVecText: "إجمالي عدد المركبات في كل عائلة",
                  peopleUnder18: widget.q6peopleUnder18[i],
                  totalNumberOfVec: widget.q6totalNumberOfVec[i]),
              AppSize.spaceHeight2(context),
            ],
          ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DefaultButton(
              function: () {
                setState(() {
                  int x=int.parse(  HhsStatic.householdQuestions.hhsNumberSeparateFamilies.toString() );
                  print(HhsStatic.householdQuestions.hhsNumberSeparateFamilies.toString() );
                 if(widget.q6peopleUnder18.length<x) {
                   widget.q6peopleAdults18.add(TextEditingController());
                   widget.q6peopleUnder18.add(TextEditingController());
                   widget.q6totalNumberOfVec.add(TextEditingController());
                 }
                });
              },
              isWidget: true,
              text: "أضافة المزيد",
            ),
          ],
        )
      ],
    );
  }
}

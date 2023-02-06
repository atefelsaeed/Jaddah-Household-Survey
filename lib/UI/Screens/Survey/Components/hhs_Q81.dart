import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/field_widget.dart';
import 'package:jaddah_household_survey/UI/Widgets/text.dart';

import '../widgets/editing_controler3.dart';

class Q81 extends StatefulWidget {
  EditingController3 editingController3;

  Q81({super.key, required this.editingController3});

  @override
  State<Q81> createState() => _Q81State();
}

class _Q81State extends State<Q81> {
  @override

  bool isHome=false;
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
                    "7. كم عدد الدراجات الهوائية التي تمتلكها أو تستخدمها هذه الأسرة؟",
                fontSize: height(context) * .017,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Field(
            function: () {},
            isHome: isHome,
            showDeleteIcon: false,
            peopleAdults18: widget.editingController3.peopleAdults18,
            peopleUnder18: widget.editingController3.peopleUnder18,
            totalNumberOfVecText: "إجمالي عدد الدراجات الهوائية",
            totalNumberOfVec: widget.editingController3.totalNumber,
            peopleAdults18Text: "عدد الدرجات للبالغين",
            peopleUnder18Text: "عدد الدرجات للاطفال"),

     Row(children: [
       Checkbox(
           side: BorderSide(
             color: ColorManager.orangeTxtColor,
             width: 1.5,
           ),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(5.0),
           ),
           checkColor: ColorManager.whiteColor,
           focusColor: ColorManager.orangeTxtColor,
           activeColor: ColorManager.orangeTxtColor,
           value: isHome,
           onChanged: (bool? value) {
             setState(() {
               isHome = value!;
               if (isHome == true) {

               } else {

               }
             });
           }),
       TextGlobal(
         text: "لا يوجذ",
         fontSize: height(context) * .012,
         color: ColorManager.black,
       ),
     ],)
      ],
    );
  }
}

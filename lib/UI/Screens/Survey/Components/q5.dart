import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/HHSData/questions_data.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

import '../../../../Resources/colors.dart';
import '../../../Widgets/custom_buttton.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class Q5 extends StatelessWidget {
  const Q5(
      {super.key, required this.peopleAdults18, required this.peopleUnder18});

  final TextEditingController peopleAdults18;

  final TextEditingController peopleUnder18;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        Expanded(child:     TextGlobal(
              text: "5.كم عدد أفراد عائلتك الذين يعيشون بشكل دائم في هذا المنزل؟",
              fontSize: height(context) * .02,
              color: ColorManager.black,
            )),
          ],
        ),
       /* Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: QuestionsData.qh5["subTitle"],
              fontSize: height(context) * .015,
              color: ColorManager.grayColor,
            ),
          ],
        ),*/
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                MyTextForm(
                  label: "",
                  controller: peopleUnder18,
                  widthForm: width(context) * .07,
                ),
                AppSize.spaceWidth1(context),
                TextGlobal(
                  text: "الاطفال",
                  fontSize: height(context) * .015,
                  color: ColorManager.black,
                ),
              ],
            ),
            AppSize.spaceWidth3(context),
            Row(
              children: [
                MyTextForm(
                  label: "",
                  controller: peopleAdults18,
                  widthForm: width(context) * .07,
                ),
                AppSize.spaceWidth1(context),
                TextGlobal(
                  text: "البالغين",
                  fontSize: height(context) * .017,
                  color: ColorManager.grayColor,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Q6 extends StatefulWidget {
  Q6(
      {super.key,
      required this.q6peopleAdults18,
      required this.q6peopleUnder18,
      required this.q6totalNumberOfVec});

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
    Expanded(child:         TextGlobal(
              text:"4.كم عدد الأشخاص في كل عائلة منفصلة تعيش في هذا العنوان؟",
              fontSize: height(context) * .02,
              color: ColorManager.black,
            )),
          ],
        ),
        AppSize.spaceHeight1(context),
      /*  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: QuestionsData.qh5["subTitle"],
              fontSize: height(context) * .015,
              color: ColorManager.grayColor,
            ),
          ],
        ),*/
        AppSize.spaceHeight2(context),
        for (int i = 0; i < widget.q6peopleAdults18.length; i++)
          Column(
            children: [
              Field(
                  peopleAdults18: widget.q6peopleAdults18[i],
                  peopleUnder18Text: "الاطفال",
                  peopleAdults18Text: "البالغين",
                  totalNumberOfVecText:
                      "إجمالي عدد المركبات في كل عائلة",
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
                  widget.q6peopleAdults18.add(TextEditingController());
                  widget.q6peopleUnder18.add(TextEditingController());
                  widget.q6totalNumberOfVec.add(TextEditingController());
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

class Q81 extends StatelessWidget {
  EditingController3 editingController3;

  Q81({super.key, required this.editingController3});

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
                text: "7. كم عدد الدراجات الهوائية التي تمتلكها أو تستخدمها هذه الأسرة؟",
                fontSize: height(context) * .017,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Field(
            peopleAdults18: editingController3.peopleAdults18,
            peopleUnder18: editingController3.peopleUnder18,
            totalNumberOfVecText: "إجمالي عدد المركبات في كل عائلة",
            totalNumberOfVec: editingController3.totalNumber,
            peopleAdults18Text: "البالغين",
            peopleUnder18Text: "الاطفال")
      ],
    );
  }
}

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
                text:"كم عدد الدراجات الكهربائية التي تمتلكها أو تستخدمها هذه الأسرة؟",
                fontSize: height(context) * .017,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Field(
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

class Q83 extends StatelessWidget {
  EditingController3 editingController3;

  Q83({super.key, required this.editingController3});

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
                text: "كم عدد الدراجات الإلكترونية (e-scooters) التي تمتلكها أو تستخدمها هذه الأسرة؟",
                fontSize: height(context) * .017,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Field(
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

class EditingController3 {
  final TextEditingController peopleAdults18;
  final TextEditingController peopleUnder18;
  final TextEditingController totalNumber;

  EditingController3(
      {required this.peopleUnder18,
      required this.totalNumber,
      required this.peopleAdults18});
}

class Field extends StatelessWidget {
  const Field(
      {super.key,
      required this.peopleAdults18,
      required this.peopleUnder18,
      required this.totalNumberOfVecText,
      required this.totalNumberOfVec,
      required this.peopleAdults18Text,
      required this.peopleUnder18Text});

  final TextEditingController peopleAdults18;

  final TextEditingController peopleUnder18;
  final TextEditingController totalNumberOfVec;
  final String peopleAdults18Text;
  final String peopleUnder18Text;
  final String totalNumberOfVecText;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              MyTextForm(
                label: "",
                controller: peopleUnder18,
                widthForm: width(context) * .07,
              ),
              AppSize.spaceWidth1(context),
              Expanded(
                flex: 1,
                child: TextGlobal(
                  text: peopleUnder18Text,
                  fontSize: height(context) * .012,
                  color: ColorManager.black,
                ),
              ),
            ],
          ),
        ),
        AppSize.spaceWidth3(context),
        Expanded(
          flex: 3,
            child: Row(
          children: [
            MyTextForm(
              label: "",
              controller: peopleAdults18,
              widthForm: width(context) * .07,
            ),
            AppSize.spaceWidth1(context),
            Expanded(
              flex: 1,
              child: TextGlobal(
                text: peopleAdults18Text,
                fontSize: height(context) * .014,
                color: ColorManager.grayColor,
              ),
            ),
          ],
        )),
        AppSize.spaceWidth3(context),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              MyTextForm(
                label: "",
                controller: totalNumberOfVec,
                widthForm: width(context) * .07,
              ),
              AppSize.spaceWidth1(context),
              Expanded(
                flex: 1,
                child: TextGlobal(
                  text: totalNumberOfVecText,
                  fontSize: height(context) * .012,
                  color: ColorManager.grayColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

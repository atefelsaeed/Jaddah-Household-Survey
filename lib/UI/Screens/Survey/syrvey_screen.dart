import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import '../../../Data/HouseholdPart1/questions_data.dart';
import '../../../Helper/validator.dart';
import '../../../Models/enum_survey.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/text.dart';
import 'Components/text_form_row.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController area = TextEditingController();
  final TextEditingController zoneNumber = TextEditingController();
  final TextEditingController buildingName = TextEditingController();
  final TextEditingController streetName = TextEditingController();
  final TextEditingController streetNumber = TextEditingController();
  final TextEditingController nearestLandMark = TextEditingController();
  final TextEditingController blockNearestTwoCrossStreets =
      TextEditingController();

  List z = QuestionsData.qh1.values.toList();
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _key,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  // SurveyHeader(),
                  AppSize.spaceHeight2(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppSize.spaceWidth1(context),
                      TextGlobal(
                        text: "Household address",
                        fontSize: height(context) * .023,
                        color: ColorManager.black,
                      ),
                      AppSize.spaceWidth2(context),
                      Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: ColorManager.orangeTxtColor,
                              radius: height(context) * .013),
                          AppSize.spaceHeight05(context),
                          Container(
                            color: ColorManager.orangeTxtColor,
                            width: width(context) * .03,
                            height: height(context) * .003,
                          )
                        ],
                      )
                    ],
                  ),
                  AppSize.spaceHeight1(context),
                  const Divider(
                    thickness: 1,
                  ),
                  AppSize.spaceHeight2(context),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextForm(
                          controller: buildingName,
                          text: "Building Name",
                          label: "Enter Building Name",
                        ),
                        TextForm(
                          controller: streetName,
                          text: "street Name",
                          label: "Enter Street Name",
                        )
                      ],
                    ),
                  ),
                  AppSize.spaceHeight2(context),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextForm(
                          controller: streetNumber,
                          label: "Street Number",
                          text: "Enter Street Number",
                        ),
                        TextForm(
                          controller: nearestLandMark,
                          label: "Nearest Land Mark ",
                          text: "Enter Nearest Land Mark ",
                        )
                      ],
                    ),
                  ),
                  AppSize.spaceHeight2(context),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextForm(
                          controller: blockNearestTwoCrossStreets,
                          text: "Block/Nearest two cross streets",
                          label: "Enter Block/Nearest two cross streets",
                        ),
                        TextForm(
                          controller: area,
                          text: "Area (Suburb)",
                          label: "Enter Area (Suburb) ",
                        )
                      ],
                    ),
                  ),
                  AppSize.spaceHeight2(context),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextForm(
                          controller: blockNearestTwoCrossStreets,
                          text: "City/ Town",
                          label: "Enter City/ Town",
                        ),
                        //  TextForm(controller: area,text: "Area (Suburb)",label: "Enter Area (Suburb) ",)
                      ],
                    ),
                  ),
                  AppSize.spaceHeight3(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width(context) * .4,
                        child: TextGlobal(
                          color: ColorManager.grayColor,
                          text:
                              "This Section Could be completed with any responsible adult member of the household",
                          fontSize: height(context) * .013,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppSize.spaceWidth1(context),
                          TextGlobal(
                            text: "Household",
                            fontSize: height(context) * .023,
                            color: ColorManager.black,
                          ),
                          AppSize.spaceWidth2(context),
                          Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: ColorManager.orangeTxtColor,
                                  radius: height(context) * .013),
                              AppSize.spaceHeight05(context),
                              Container(
                                color: ColorManager.orangeTxtColor,
                                width: width(context) * .03,
                                height: height(context) * .003,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  AppSize.spaceHeight1(context),
                  const Divider(
                    thickness: 1,
                  ),
                  AppSize.spaceHeight2(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropDownFormInput(
                        label: Text(z[0].toString()),
                        hint: QuestionsData.qh1.keys.first.toString(),
                        options: <DwellingType, Widget>{
                          for (int i = 0; i < z.length; i++)
                            DwellingType.flatFamily: Text(z[i].toString()),
                        },
                        onChange: (DwellingType? p) {},
                        validator: (DwellingType? value) =>
                            Validator.validateChoice(
                          value: value,
                          refused: null,
                          message: "يجب اعطاء اجابة",
                        ),
                      ),
                    ],
                  ),
                  AppSize.spaceHeight3(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropDownFormInput(
                        label: Text(QuestionsData.qh2.values.first.toString()),
                        hint: QuestionsData.qh2.keys.first.toString(),
                        options: <DwellingType, Widget>{
                          for (int i = 0;
                              i < QuestionsData.qh2.values.first.length;
                              i++)
                            DwellingType.flatFamily: Text(
                                QuestionsData.qh2.values.first[i].toString()),
                        },
                        onChange: (DwellingType? p) {},
                        validator: (DwellingType? value) =>
                            Validator.validateChoice(
                          value: value,
                          refused: null,
                          message: "يجب اعطاء اجابة",
                        ),
                      ),
                    ],
                  ),
                  AppSize.spaceHeight3(context),
                  ALTl(
                    title:
                        "? How many bedrooms are there in the accommodation you live in",
                    subTitle:
                        " A separate family is defined as who share the kitchen expenses and meals",
                    question: ["1", "2", "1", "2", "1", "2", "1", "2"],
                  ),
                  AppSize.spaceHeight3(context),
                  ALTl(
                    title: "? How many separate families live at this address ",
                    subTitle:
                        " A separate family is defined as who share the kitchen expenses and meals",
                    question: ["1", "2"],
                  ),
                  AppSize.spaceHeight3(context),
                  ALTlr(
                    title: "? How many separate families live at this address ",
                    subTitle:
                        " A separate family is defined as who share the kitchen expenses and meals",
                    question: const [
                      "Total number of bfikes",
                      "adults (18yrs +)"
                    ],
                  ),
                  AppSize.spaceHeight3(context),
                  ALTlr(
                    title: "? How many separate families live at this address ",
                    subTitle:
                        " A separate family is defined as who share the kitchen expenses and meals",
                    question: const [
                      "Total number of bfikes",
                      "adults (18yrs +)"
                    ],
                  ),
                  AppSize.spaceHeight3(context),
                  ALTlr(
                    title: "? How many separate families live at this address ",
                    subTitle:
                        " A separate family is defined as who share the kitchen expenses and meals",
                    question: const [
                      "Total number of bfikes",
                      "adults (18yrs +)"
                    ],
                  ),
                  AppSize.spaceHeight3(context),
                  ALTlr(
                    title: "? How many separate families live at this address ",
                    subTitle:
                        " A separate family is defined as who share the kitchen expenses and meals",
                    question: const [
                      "Total number of bfikes",
                      "adults (18yrs +)"
                    ],
                  ),
                  AppSize.spaceHeight3(context),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropDownFormInput(
                        label: Text(QuestionsData.qh2.values.first.toString()),
                        hint: QuestionsData.qh2.keys.first.toString(),
                        options: <DwellingType, Widget>{
                          for (int i = 0;
                              i < QuestionsData.qh2.values.first.length;
                              i++)
                            DwellingType.flatFamily: Text(
                                QuestionsData.qh2.values.first[i].toString()),
                        },
                        onChange: (DwellingType? p) {},
                        validator: (DwellingType? value) =>
                            Validator.validateChoice(
                          value: value,
                          refused: null,
                          message: "يجب اعطاء اجابة",
                        ),
                      ),
                    ],
                  ),
                  AppSize.spaceHeight3(context),
                  DefaultButton(
                    function: () {},
                    isWidget: true,
                    text: "Next Step",
                    widget: const Icon(Icons.arrow_forward),
                  ),
                  // HouseholdAddressSection()
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

class ALTl extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<String> question;
  bool checked = false;

  ALTl(
      {super.key,
      required this.question,
      required this.subTitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: title,
              fontSize: height(context) * .02,
              color: ColorManager.black,
            ),
          ],
        ),
        AppSize.spaceHeight05(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: subTitle,
              fontSize: height(context) * .013,
              color: ColorManager.grayColor,
            ),
          ],
        ),
        AppSize.spaceHeight1(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
              height: height(context) * .04,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: question.length,
                itemBuilder: (BuildContext context, int index) =>
                    Row(children: [
                  TextGlobal(
                    text: index.toString(),
                    fontSize: height(context) * .02,
                    color: ColorManager.grayColor,
                  ),
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
                      value: checked,
                      onChanged: (bool? value) {}),
                ]),
              )),
        ),
      ],
    );
  }
}

class ALTlr extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<String> question;
  bool checked = false;

  ALTlr(
      {super.key,
      required this.question,
      required this.subTitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: title,
              fontSize: height(context) * .02,
              color: ColorManager.black,
            ),
          ],
        ),
        AppSize.spaceHeight05(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: subTitle,
              fontSize: height(context) * .013,
              color: ColorManager.grayColor,
            ),
          ],
        ),
        AppSize.spaceHeight1(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
              height: height(context) * .04,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: question.length,
                itemBuilder: (BuildContext context, int index) =>
                    Row(children: [
                  TextGlobal(
                    text: question[index].toString(),
                    fontSize: height(context) * .017,
                    color: ColorManager.grayColor,
                  ),
                  Transform.scale(
                    scale: 2,
                    child: Checkbox(
                        side: BorderSide(
                          color: ColorManager.grayColor,
                          width: .5,
                        ),
                        checkColor: ColorManager.whiteColor,
                        focusColor: ColorManager.orangeTxtColor,
                        activeColor: ColorManager.orangeTxtColor,
                        value: checked,
                        onChanged: (bool? value) {}),
                  ),
                ]),
              )),
        ),
      ],
    );
  }
}

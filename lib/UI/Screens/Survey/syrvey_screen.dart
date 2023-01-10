import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/house_hold_member.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/q5.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/list_view_check_box_orange.dart';
import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Providers/survey_hhs.dart';
import '../../../Providers/surveys.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import 'components/house_hold_address.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

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

  final TextEditingController peopleAdults18 = TextEditingController();

  final TextEditingController peopleUnder18 = TextEditingController();
  final TextEditingController city = TextEditingController();

  final TextEditingController blockNearestTwoCrossStreets =
      TextEditingController();

  List<TextEditingController> q6peopleAdults18 = <TextEditingController>[
    TextEditingController()
  ];

  List<TextEditingController> q6peopleUnder18 = <TextEditingController>[
    TextEditingController()
  ];

  List<TextEditingController> q6totalNumberOfVec = <TextEditingController>[
    TextEditingController()
  ];

  EditingController3 editingController3Q81 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  EditingController3 editingController3Q82 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  EditingController3 editingController3Q83 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    SurveysProvider surveys =
        Provider.of<SurveysProvider>(context, listen: false);

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
                  HouseHoldAddress(
                    area: area,
                    blockNearestTwoCrossStreets: blockNearestTwoCrossStreets,
                    nearestLandMark: nearestLandMark,
                    streetNumber: streetNumber,
                    zoneNumber: zoneNumber,
                    streetName: streetNumber,
                    city: city,
                    buildingName: buildingName,
                  ),

                  AppSize.spaceHeight3(context),
                  const HouseHoldMember(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropDownFormInput(
                        label: Text(QuestionsData
                            .qh1[QuestionsData.qh1.keys.first]!
                            .toList()
                            .first
                            .toString()),
                        hint: QuestionsData.qh1.keys.first.toString(),
                        options: QuestionsData
                            .qh1[QuestionsData.qh1.keys.first]!
                            .toList(),
                        onChange: (String? p) {
                          print(p);
                          HhsStatic.householdQuestions.hhsDwellingType = p;
                        },
                      ),
                    ],
                  ),
                  AppSize.spaceHeight3(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropDownFormInput(
                        onChange: (String? p) {
                          HhsStatic.householdQuestions.hhsIsDwelling = p;
                        },
                        label: Text(QuestionsData
                            .qh2[QuestionsData.qh2.keys.first]!
                            .toList()
                            .first
                            .toString()),
                        hint: QuestionsData.qh2.keys.first.toString(),
                        options: QuestionsData
                            .qh2[QuestionsData.qh2.keys.first]!
                            .toList(),
                      ),
                    ],
                  ),
                  AppSize.spaceHeight3(context),
                  ListViewCheckBoxOrange(
                      onChange: (r) {
                        print(r);
                        HhsStatic.householdQuestions.hhsNumberBedRooms =
                            int.parse(r);
                      },
                      title: QuestionsData.qh3.keys.first,
                      question: QuestionsData.qh3[QuestionsData.qh3.keys.first]!
                          .toList(),
                      subTitle: QuestionsData.qh3["subTitle"]),
                  AppSize.spaceHeight3(context),

                  ListViewCheckBoxOrange(
                    onChange: (r) {
                      HhsStatic.householdQuestions.hhsNumberSeparateFamilies =
                          int.parse(r);
                    },
                    title: QuestionsData.qh4.keys.first,
                    question: QuestionsData.qh4[QuestionsData.qh4.keys.first]!
                        .toList(),
                    subTitle: QuestionsData.qh4["subTitle"],
                  ),

                  AppSize.spaceHeight3(context),
                  Q5(
                      peopleAdults18: peopleAdults18,
                      peopleUnder18: peopleUnder18),
                  AppSize.spaceHeight2(context),
                  Q6(
                      q6peopleAdults18: q6peopleAdults18,
                      q6peopleUnder18: q6peopleUnder18,
                      q6totalNumberOfVec: q6totalNumberOfVec),
                  AppSize.spaceHeight3(context),
                  ListViewCheckBoxOrange(
                    onChange: (r) {
                      HhsStatic.householdQuestions.hhsNumberYearsInAddress = r;
                    },
                    title: QuestionsData.qh7.keys.first,
                    question: QuestionsData.qh7[QuestionsData.qh7.keys.first]!
                        .toList(),
                    subTitle: "",
                  ),

                  ListViewCheckBoxOrange(
                    onChange: (r) {
                      if (r == "Yes") {
                        HhsStatic.householdQuestions.hhsIsDemolishedAreas =
                            true;
                      } else {
                        HhsStatic.householdQuestions.hhsIsDemolishedAreas =
                            false;
                      }
                    },
                    title: QuestionsData.qh7_2.keys.first,
                    question: QuestionsData
                        .qh7_2[QuestionsData.qh7_2.keys.first]!
                        .toList(),
                    subTitle: "",
                  ),

                  /*   ListQ7(
                      title: "title",
                      question: QuestionsData
                          .qh7_2[QuestionsData.qh7_2.keys.first]!
                          .toList(),
                      subTitle: "",
                      textEditingController: TextEditingController()),*/

                  AppSize.spaceHeight3(context),
                  Q81(editingController3: editingController3Q81),
                  AppSize.spaceHeight3(context),
                  Q82(editingController3: editingController3Q82),
                  AppSize.spaceHeight3(context),
                  Q83(editingController3: editingController3Q83),
                  AppSize.spaceHeight2(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropDownFormInput(
                        label: Text(QuestionsData.qh9.values.first.toString()),
                        hint: QuestionsData.qh9.keys.first.toString(),
                        options: QuestionsData
                            .qh9[QuestionsData.qh9.keys.first]!
                            .toList(),
                        onChange: (String p) {
                          HhsStatic.householdQuestions.hhsTotalIncome=p;
                        },
                      ),
                    ],
                  ),
                  AppSize.spaceHeight3(context),
                  DefaultButton(
                    function: () {
                      HhsStatic.householdAddress.blockNearestCrossStreets =
                          blockNearestTwoCrossStreets.text;
                      HhsStatic.householdAddress.areaSuburb = area.text;
                      HhsStatic.householdAddress.streetName = streetName.text;
                      HhsStatic.householdAddress.buildingName =
                          buildingName.text;
                      HhsStatic.householdAddress.streetNumber =
                          streetNumber.text;
                      HhsStatic.householdAddress.nearestLandMark =
                          nearestLandMark.text;
                      HhsStatic.householdAddress.city = city.text;
                      HhsStatic.householdQuestions.hhsNumberAdults =
                          int.parse(peopleAdults18.text);

                      HhsStatic.householdQuestions.hhsNumberBedRooms =
                          int.parse(peopleUnder18.text);

                      for (int i = 0; i < q6peopleUnder18.length; i++) {
                        HhsStatic.houseHold.add(SeparateFamilies(
                            int.parse(q6peopleAdults18[i].text),
                            int.parse(q6peopleUnder18[i].text),
                            int.parse(q6totalNumberOfVec[i].text)));
                      }
                      HhsStatic.householdQuestions.hhsPedalCycles!
                              .childrenBikesNumber =
                          int.parse(editingController3Q81.peopleUnder18.text);
                      HhsStatic.householdQuestions.hhsPedalCycles!
                              .totalBikesNumber =
                          int.parse(editingController3Q81.totalNumber.text);
                      HhsStatic.householdQuestions.hhsPedalCycles!
                              .adultsBikesNumber =
                          int.parse(editingController3Q81.peopleAdults18.text);
                      HhsStatic.householdQuestions.hhsElectricCycles!
                              .childrenBikesNumber =
                          int.parse(editingController3Q82.peopleUnder18.text);
                      HhsStatic.householdQuestions.hhsElectricCycles!
                              .totalBikesNumber =
                          int.parse(editingController3Q82.totalNumber.text);
                      HhsStatic.householdQuestions.hhsElectricCycles!
                              .adultsBikesNumber =
                          int.parse(editingController3Q82.peopleAdults18.text);
                      HhsStatic.householdQuestions.hhsElectricScooter!
                              .childrenBikesNumber =
                          int.parse(editingController3Q83.peopleUnder18.text);
                      HhsStatic.householdQuestions.hhsElectricScooter!
                              .totalBikesNumber =
                          int.parse(editingController3Q83.totalNumber.text);
                      HhsStatic.householdQuestions.hhsElectricScooter!
                              .adultsBikesNumber =
                          int.parse(editingController3Q83.peopleAdults18.text);

                      //HhsStatic.householdQuestions.hhsDwellingType.

                      //   surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="kkk";
                    },
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

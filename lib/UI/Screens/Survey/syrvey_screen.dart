import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/house_hold_member.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/q5.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/list_view_check_box_orange.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/text_form_row.dart';
import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Providers/survey_hhs.dart';
import '../../../Providers/surveys.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../vechicles/vechicles_screen.dart';
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
  final TextEditingController yes = TextEditingController();
  final TextEditingController buildingName = TextEditingController();
  final TextEditingController dewType = TextEditingController();
  final TextEditingController isDewType = TextEditingController();
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
                    streetName: streetName,
                    city: city,
                    buildingName: buildingName,
                  ),

                  AppSize.spaceHeight3(context),
                  const HouseHoldMember(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropDownFormInput(
                        label: Text(QuestionsData
                            .qh1[QuestionsData.qh1.keys.first]!
                            .toList()
                            .first
                            .toString()),
                        hint: " 1. ما أفضل وصف لهذا النوع من المسكن؟",
                        options: QuestionsData
                            .qh1[QuestionsData.qh1.keys.first]!
                            .toList(),
                        onChange: (String? p) {
                          print(p);
                          setState(() {
                            HhsStatic.householdQuestions.hhsDwellingType = p;
                          });

                        },
                      ),
                    ],
                  ),
                  AppSize.spaceHeight1(context),
                  HhsStatic.householdQuestions.hhsDwellingType=="Other"? Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                    TextForm(
                      controller: HhsStatic.householdQuestions.hhsDwellingTypeOther!,
                      text: "1. ما أفضل وصف لهذا النوع من المسكن؟",
                      label: "1. ما أفضل وصف لهذا النوع من المسكن؟",
                    )
                  ],):Container(),
                  AppSize.spaceHeight3(context),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropDownFormInput(
                        onChange: (String? p) {
                          setState(() {
                            HhsStatic.householdQuestions.hhsIsDwelling = p;
                          });

                        },
                        label: Text(QuestionsData
                            .qh2[QuestionsData.qh2.keys.first]!
                            .toList()
                            .first
                            .toString()),
                        hint: "2.ما هي حالة إيجار / ملكية المسكن؟",
                        options: QuestionsData
                            .qh2[QuestionsData.qh2.keys.first]!
                            .toList(),
                      ),
                    ],
                  ),
                  HhsStatic.householdQuestions.hhsIsDwelling=="Other"?
                  Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                    TextForm(

                      controller: isDewType,
                      text: "2.ما هي حالة إيجار / ملكية المسكن؟",
                      label: "2.ما هي حالة إيجار / ملكية المسكن؟",
                    )
                  ],):Container(),

                  AppSize.spaceHeight3(context),


                  // ListViewCheckBoxOrange(
                  //     onChange: (r) {
                  //       print(r);
                  //       HhsStatic.householdQuestions.hhsNumberBedRooms = r;
                  //     },
                  //     title: QuestionsData.qh3.keys.first,
                  //     question: QuestionsData.qh3[QuestionsData.qh3.keys.first]!
                  //         .toList(),
                  //     subTitle: QuestionsData.qh3["subTitle"]),
                  // AppSize.spaceHeight3(context),

                  ListViewCheckBoxOrange(
                    onChange: (r) {
                      HhsStatic.householdQuestions.hhsNumberSeparateFamilies =
                          r;
                    },
                    title: "3.كم عدد العائلات المنفصلة التي تعيش في هذا العنوان؟",
                    question: QuestionsData.qh4[QuestionsData.qh4.keys.first]!
                        .toList(),
                    subTitle: QuestionsData.qh4["subTitle"],
                  ),

                  AppSize.spaceHeight3(context),
                  Q6(
                      q6peopleAdults18: q6peopleAdults18,
                      q6peopleUnder18: q6peopleUnder18,
                      q6totalNumberOfVec: q6totalNumberOfVec),
                  AppSize.spaceHeight2(context),

                  Q5(
                      peopleAdults18: peopleAdults18,
                      peopleUnder18: peopleUnder18),


                  AppSize.spaceHeight3(context),
                  ListViewCheckBoxOrange(
                    onChange: (r) {
                      HhsStatic.householdQuestions.hhsNumberYearsInAddress = r;
                    },
                    title: "6.كم سنة عشت أنت / عائلتك في هذا العنوان المحدد؟",
                    question: QuestionsData.qh7[QuestionsData.qh7.keys.first]!
                        .toList(),
                    subTitle: "",
                  ),

                  ListViewCheckBoxOrange(
                    onChange: (r) {
                      setState(() {
                        if (r == "نعم") {
                          HhsStatic.householdQuestions.hhsIsDemolishedAreas =
                          true;
                        } else {
                          HhsStatic.householdQuestions.hhsIsDemolishedAreas =
                          false;
                        }
                      });
                      print(r);

                    },
                    title: "هل انتقلت إلى هنا من أي منطقة من المناطق المهدومة في جدة ، إذا كانت الإجابة بنعم أي واحدة",
                    question: QuestionsData
                        .qh7_2[QuestionsData.qh7_2.keys.first]!
                        .toList(),
                    subTitle: "",
                  ),

                  HhsStatic.householdQuestions.hhsIsDemolishedAreas==true? Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                    TextForm(

                      controller:yes,
                      text: "  فمن أي منطقة (يُظهر المحاور قائمة بالمنطقة المهدومة)",
                      label: " فمن أي منطقة (يُظهر المحاور قائمة بالمنطقة المهدومة)",
                    )
                  ],):Container(),
                  AppSize.spaceHeight2(context),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropDownFormInput(
                        label: Text(QuestionsData.qh9.values.first.toString()),
                        hint: "8.يرجى الإشارة إلى أي من النطاقات التالية يقع إجمالي دخل أسرتك الشهري بما في ذلك المزايا؟",
                        options: QuestionsData
                            .qh9[QuestionsData.qh9.keys.first]!
                            .toList(),
                        onChange: (String p) {
                          print(p);

                          HhsStatic.householdQuestions.hhsTotalIncome = p;
                          print(HhsStatic.householdQuestions.hhsTotalIncome );
                        },
                      ),
                    ],
                  ),
                  AppSize.spaceHeight3(context),
                  DefaultButton(
                    function: () {
                      if (_key.currentState!.validate()) {
                        _key.currentState!.save();

                        for (int i = 0; i < q6peopleUnder18.length; i++) {
                          HhsStatic.houseHold.add(
                            SeparateFamilies(
                              q6peopleAdults18[i].text,
                              q6peopleUnder18[i].text,
                              q6totalNumberOfVec[i].text,
                            ),
                          );
                        }
if(HhsStatic.householdQuestions.hhsDwellingType=="Other"){
  HhsStatic.householdQuestions.hhsDwellingType=HhsStatic.householdQuestions.hhsDwellingTypeOther!.text;
}
                        if(HhsStatic.householdQuestions.hhsIsDwelling=="Other"){
                          HhsStatic.householdQuestions.hhsIsDwelling=HhsStatic.householdQuestions.hhsIsDwellingOther!.text;
                        }

                        surveyPt.hhsBlockNearestCrossStreets =
                            blockNearestTwoCrossStreets.text;
                        surveyPt.hhsAreaSuburb = area.text;
                        surveyPt.hhsStreetName = streetName.text;
                        surveyPt.hhsBuildingName = buildingName.text;
                        surveyPt.hhsStreetNumber = streetNumber.text;
                        surveyPt.hhsNearestLandMark = nearestLandMark.text;
                        surveyPt.hhsCity = city.text;
                        surveyPt.hhsNumberAdults = peopleAdults18.text;
                        surveyPt.hhsNumberBedRooms = peopleUnder18.text;

                        surveyPt.hhsSeparateFamilies = HhsStatic.houseHold;
                        surveyPt.hhsTotalIncome=HhsStatic.householdQuestions.hhsTotalIncome;
                        surveyPt.hhsPCChildrenBikesNumber =
                            editingController3Q81.peopleUnder18.text;
                        surveyPt.hhsPCTotalBikesNumber =
                            editingController3Q81.totalNumber.text;
                        surveyPt.hhsPCAdultsBikesNumber =
                            editingController3Q81.peopleAdults18.text;
                        surveyPt.hhsECChildrenBikesNumber =
                            editingController3Q82.peopleUnder18.text;
                        surveyPt.hhsECTotalBikesNumber =
                            editingController3Q82.totalNumber.text;
                        surveyPt.hhsECAdultsBikesNumber =
                            editingController3Q82.peopleAdults18.text;
                        surveyPt.hhsESChildrenBikesNumber =
                            editingController3Q83.peopleUnder18.text;
                        surveyPt.hhsESTotalBikesNumber =
                            editingController3Q83.totalNumber.text;
                        surveyPt.hhsESAdultsBikesNumber =
                            editingController3Q83.peopleAdults18.text;
                        //

                     surveyPt.hhsDemolishedAreas=yes.text;
                        surveyPt.headerDistrictName = '';
                        surveyPt.headerZoneNumber = '';
                        print("survey Data");
                        // surveys.addSurvey(surveyPt.data);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VehiclesScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("يوجد خطأ بالبيانات"),
                            duration: Duration(seconds: 3),
                            elevation: 1,
                          ),
                        );
                      }
                    },
                    isWidget: true,
                    text: "التالي",
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

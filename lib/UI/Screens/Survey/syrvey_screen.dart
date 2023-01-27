import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/VechelisData/veh_model.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/house_hold_address.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/house_hold_member.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/editing_controler3.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/list_view_check_box_orange.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/text_form_row.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../Data/HouseholdPart1/validate_data/hhs_validation.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Providers/survey_hhs.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/exit_screen.dart';
import '../vechicles/components/nearest_transporter.dart';
import 'Components/hhs_Q5.dart';
import 'Components/hhs_Q6.dart';
import 'Components/hhs_Q81.dart';
import 'Components/hhs_Q82.dart';
import 'Components/hhs_Q83.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({
    super.key,
    required this.hayName,
    required this.blockName,
  });

  final String hayName, blockName;

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController yes = TextEditingController();

  final TextEditingController streetName = TextEditingController();
  final TextEditingController streetNumber = TextEditingController();
  final TextEditingController nearestLandMark = TextEditingController();

  final TextEditingController peopleAdults18 = TextEditingController();
  final TextEditingController peopleUnder18 = TextEditingController();
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
  void initState() {
    // TODO: implement initState
    super.initState();
    editingController3Q83.totalNumber.text = '';
    editingController3Q83.peopleUnder18.text = '';
    editingController3Q83.peopleAdults18.text = '';
  }

  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () {
        return OnExitScreen.onWillPop(context);
      },
      child: Scaffold(
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
                      area: widget.hayName,
                      blockName: widget.blockName,
                      nearestLandMark: nearestLandMark,
                      streetNumber: streetNumber,
                      streetName: streetName,
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
                          hint: "1. وصف المسكن؟",
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
                    HhsStatic.householdQuestions.hhsDwellingType == "أخر"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextForm(
                                controller: HhsStatic
                                    .householdQuestions.hhsDwellingTypeOther!,
                                text: "1. وصف المسكن؟",
                                label: "1. وصف المسكن؟",
                              )
                            ],
                          )
                        : Container(),
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
                          hint: "2.ملكية المسكن؟",
                          options: QuestionsData
                              .qh2[QuestionsData.qh2.keys.first]!
                              .toList(),
                        ),
                      ],
                    ),
                    HhsStatic.householdQuestions.hhsIsDwelling == "أخر"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextForm(
                                controller: HhsStatic
                                    .householdQuestions.hhsIsDwellingOther!,
                                text: "2.ملكية المسكن؟",
                                label: "2.ملكية المسكن؟",
                              )
                            ],
                          )
                        : Container(),

                    AppSize.spaceHeight3(context),

                    ListViewCheckBoxOrange(
                      map: QuestionsData.qh4,
                      onChange: (r) {
                        HhsStatic.householdQuestions.hhsNumberSeparateFamilies =
                            r;
                        print(QuestionsData.qh4[QuestionsData.qh4.keys.first]!
                                .toList()[QuestionsData.qh4["index"]]
                            ["isChick"]); //=false;
                      },
                      title:
                          "3.كم عدد العائلات المنفصلة التي تعيش في هذا العنوان؟",
                      question: QuestionsData.qh4[QuestionsData.qh4.keys.first]!
                          .toList(),
                      subTitle:
                          'يتم تعريف الأسرة المنفصلة على أنها من لا يشارك مصاريف المطبخ والوجبات مع العائلة الأخرى في نفس السكن)',
                    ),

                    AppSize.spaceHeight3(context),
                    Q6(
                      q6peopleAdults18: q6peopleAdults18,
                      q6peopleUnder18: q6peopleUnder18,
                      q6totalNumberOfVec: q6totalNumberOfVec,
                    ),
                    AppSize.spaceHeight2(context),

                    Q5(
                      peopleAdults18: peopleAdults18,
                      peopleUnder18: peopleUnder18,
                    ),

                    AppSize.spaceHeight3(context),
                    ListViewCheckBoxOrange(
                      map: QuestionsData.qh7,
                      onChange: (r) {
                        HhsStatic.householdQuestions.hhsNumberYearsInAddress =
                            r;
                      },
                      title: "6.كم سنة عشت أنت / عائلتك في هذا العنوان المحدد؟",
                      question: QuestionsData.qh7[QuestionsData.qh7.keys.first]!
                          .toList(),
                      subTitle: "",
                    ),

                    ListViewCheckBoxOrange(
                      map: QuestionsData.qh7_2,
                      onChange: (r) {
                        setState(() {
                          if (r == "نعم") {
                            HhsStatic.householdQuestions.hhsIsDemolishedAreas =
                                true;
                            yes.text = '';
                          } else {
                            HhsStatic.householdQuestions.hhsIsDemolishedAreas =
                                false;
                            yes.text = 'لا';
                          }
                        });
                      },
                      isListView: true,
                      title:
                          "هل انتقلت إلى هنا من أي منطقة من المناطق المهدومة في جدة ، إذا كانت الإجابة بنعم أي واحدة",
                      question: QuestionsData
                          .qh7_2[QuestionsData.qh7_2.keys.first]!
                          .toList(),
                      subTitle: "",
                    ),

                    HhsStatic.householdQuestions.hhsIsDemolishedAreas == true
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DropDownFormInput(
                                onChange: (String? p) {
                                  setState(() {
                                    HhsStatic.householdQuestions
                                        .hhsDemolishedAreas = p;
                                    p == "أخر"
                                        ? yes.text = ""
                                        : yes.text = HhsStatic
                                            .householdQuestions
                                            .hhsDemolishedAreas!;
                                  });
                                },
                                label: Text(QuestionsData
                                    .qh6_2[QuestionsData.qh6_2.keys.first]!
                                    .toList()
                                    .first
                                    .toString()),
                                hint: "المنطقة المهدومة",
                                options: QuestionsData
                                    .qh6_2[QuestionsData.qh6_2.keys.first]!
                                    .toList(),
                              ),
                              HhsStatic.householdQuestions.hhsDemolishedAreas ==
                                      "أخر"
                                  ? TextForm(
                                      controller: yes,
                                      text: "  فمن أي منطقة ",
                                      label: " فمن أي منطقة",
                                    )
                                  : Container()
                            ],
                          )
                        : Container(),
                    AppSize.spaceHeight2(context),
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
                          label:
                              Text(QuestionsData.qh9.values.first.toString()),
                          hint:
                              "8.متوسط دخل جميع أفراد الاسرة الشهري مع المزايا؟",
                          options: QuestionsData
                              .qh9[QuestionsData.qh9.keys.first]!
                              .toList(),
                          onChange: (String p) {
                            HhsStatic.householdQuestions.hhsTotalIncome = p;
                          },
                        ),
                      ],
                    ),
                    AppSize.spaceHeight3(context),
                    const NearestTransporter(),
                    AppSize.spaceHeight3(context),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "10. خلال الأسبوع الماضي ، كم عدد الطلبات المنزلية والبقالة  والإمدادات الأخرى التي استلمتها أسرتك؟",
                          style: TextStyle(fontSize: height(context) * 0.02),
                        ),
                        AppSize.spaceHeight2(context),
                        MyTextForm(
                          controller: VehModel.editingController3.totalNumber,
                          label: "أدخل ",
                          keyboardType: TextInputType.number,
                          isNumber: true,
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
                          if (HhsStatic.householdQuestions.hhsDwellingType ==
                              "أخر") {
                            HhsStatic.householdQuestions.hhsDwellingType =
                                HhsStatic.householdQuestions
                                    .hhsDwellingTypeOther!.text;
                          }
                          if (HhsStatic.householdQuestions.hhsIsDwelling ==
                              "أخر") {
                            HhsStatic.householdQuestions.hhsIsDwelling =
                                HhsStatic.householdQuestions.hhsIsDwellingOther!
                                    .text;
                          }

                          surveyPt.hhsDwellingType = HhsStatic
                              .householdQuestions.hhsDwellingType; //solve
                          surveyPt.hhsIsDwellingType = HhsStatic
                              .householdQuestions.hhsIsDwelling; //solve
                          surveyPt.hhsNumberSeparateFamilies = HhsStatic
                              .householdQuestions
                              .hhsNumberSeparateFamilies; //solve
                          surveyPt.hhsNumberYearsInAddress = HhsStatic
                              .householdQuestions
                              .hhsNumberYearsInAddress; //solve

                          surveyPt.hhsBlockNearestCrossStreets =
                              widget.blockName; //solve
                          surveyPt.hhsAreaSuburb = widget.hayName; //solve
                          surveyPt.hhsStreetName = streetName.text;
                          surveyPt.hhsStreetNumber = streetNumber.text;
                          surveyPt.hhsNearestLandMark = nearestLandMark.text;

                          surveyPt.hhsNumberAdults = peopleAdults18.text;
                          surveyPt.hhsNumberChildren =
                              peopleUnder18.text; //solve

                          surveyPt.hhsSeparateFamilies = HhsStatic.houseHold;
                          surveyPt.hhsTotalIncome =
                              HhsStatic.householdQuestions.hhsTotalIncome;
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
                          QuestionsData.qh4[QuestionsData.qh4.keys.first]!
                              .toList()[0]["isChick"] = false;
                          surveyPt.hhsDemolishedAreas = yes.text;
                          surveyPt.headerDistrictName = '';
                          surveyPt.headerZoneNumber = '';
                          CheckHHSValidation.validate(context);
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
      ),
    );
  }
}

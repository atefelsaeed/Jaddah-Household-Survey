import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/VechelisData/veh_model.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/hhs_Q1.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/hhs_Q10.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/hhs_Q2.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/house_hold_address.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/house_hold_member.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/editing_controler3.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/list_view_check_box_orange.dart';
import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../Data/HouseholdPart1/validate_data/hhs_validation.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Providers/survey_hhs.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/exit_screen.dart';
import '../vechicles/components/nearest_transporter.dart';
import 'Components/hhs_Q4.dart';
import 'Components/hhs_Q5.dart';
import 'Components/hhs_Q81.dart';
import 'Components/hhs_Q82.dart';
import 'Components/hhs_Q83.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController yes = TextEditingController();

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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

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
        body: SafeArea(
          child: SingleChildScrollView(
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
                      // ===== HouseHoldAddress ===
                      const HouseHoldAddress(),
                      AppSize.spaceHeight3(context),
                      const HouseHoldMember(),
                      // ====Question 1====
                      const HHSQ1(),
                      // ====Question 2====
                      const HHSQ2(),
                      // ====Question 3====
                      ListViewCheckBoxOrange(
                        map: QuestionsData.qh4,
                        onChange: (ChangeBoxResponse r) {
                          if (r.check == true) {
                            HhsStatic.householdQuestions
                                .hhsNumberSeparateFamilies = r.val;
                          } else {
                            setState(() {
                              q6peopleAdults18 = [TextEditingController()];
                              q6peopleUnder18 = [TextEditingController()];
                              q6totalNumberOfVec = [TextEditingController()];
                            });
                            HhsStatic.householdQuestions
                                .hhsNumberSeparateFamilies = "1";
                          }
                        },
                        title:
                            "3.كم عدد العائلات المنفصلة التي تعيش في هذا العنوان؟",
                        question: QuestionsData
                            .qh4[QuestionsData.qh4.keys.first]!
                            .toList(),
                        subTitle:
                            'يتم تعريف الأسرة المنفصلة على أنها من لا يشارك مصاريف المطبخ والوجبات مع العائلة الأخرى في نفس السكن)',
                      ),
                      AppSize.spaceHeight3(context),
                      // ====Question 4====
                      HHSQ4(
                        q6peopleAdults18: q6peopleAdults18,
                        q6peopleUnder18: q6peopleUnder18,
                        q6totalNumberOfVec: q6totalNumberOfVec,
                      ),
                      AppSize.spaceHeight2(context),
                      // ====Question 5====
                      HHSQ5(
                        peopleAdults18: peopleAdults18,
                        peopleUnder18: peopleUnder18,
                      ),
                      AppSize.spaceHeight3(context),
                      // ====Question 6====
                      ListViewCheckBoxOrange(
                        map: QuestionsData.qh7,
                        onChange: (ChangeBoxResponse r) {
                          HhsStatic.householdQuestions.hhsNumberYearsInAddress =
                              r.val;
                        },
                        title:
                            "6.كم سنة عشت أنت / عائلتك في هذا العنوان المحدد؟",
                        question: QuestionsData
                            .qh7[QuestionsData.qh7.keys.first]!
                            .toList(),
                        subTitle: "",
                      ),
                      // ====Question 7====
                      ListViewCheckBoxOrange(
                        map: QuestionsData.qh7_2,
                        onChange: (ChangeBoxResponse r) {
                          setState(() {
                            if (r.val == "نعم" && r.check == true) {
                              HhsStatic.householdQuestions
                                  .hhsIsDemolishedAreas = true;
                              yes.text = '';
                            } else {
                              HhsStatic.householdQuestions
                                  .hhsIsDemolishedAreas = false;
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
                                  label: HhsStatic.householdQuestions
                                              .hhsDemolishedAreas !=
                                          null
                                      ? Text(HhsStatic.householdQuestions
                                              .hhsDemolishedAreas ??
                                          '')
                                      : const Text('إختار'),
                                  hint: "المنطقة المهدومة",
                                  options: QuestionsData
                                      .qh6_2[QuestionsData.qh6_2.keys.first]!
                                      .toList(),
                                ),
                              ],
                            )
                          : Container(),
                      AppSize.spaceHeight5(context),
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
                                HhsStatic.householdQuestions.hhsTotalIncome !=
                                        ''
                                    ? Text(HhsStatic.householdQuestions
                                            .hhsTotalIncome ??
                                        '')
                                    : const Text('إختار'),
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
                      const HHSQ10(),
                      DefaultButton(
                        function: () async {
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
                                  HhsStatic.householdQuestions
                                      .hhsIsDwellingOther!.text;
                            }

                            surveyPt.id = widget.id;

                            // ===>> Q1=====
                            surveyPt.hhsDwellingType = HhsStatic
                                .householdQuestions.hhsDwellingType; //solve
                            surveyPt.hhsNumberApartments.text = HhsStatic
                                    .householdQuestions
                                    .hhsNumberApartments
                                    .text ??
                                '';
                            surveyPt.hhsNumberFloors.text = HhsStatic
                                    .householdQuestions.hhsNumberFloors.text ??
                                '';
                            surveyPt.hhsNumberBedRooms.text = HhsStatic
                                    .householdQuestions
                                    .hhsNumberBedRooms
                                    .text ??
                                '';
                            // ================ HHSQ10 ==============
                           // surveyPt.hhsSeparateFamilies = HhsStatic.houseHold[0].totalNumberVehicles;
                            surveyPt.vehiclesData.numberParcels =
                                VehModel.vehiclesModel.numberParcels;
                            surveyPt.vehiclesData.numberParcelsDeliveries =
                                VehModel.vehiclesModel.numberParcelsDeliveries;
                            surveyPt.vehiclesData.numberFood =
                                VehModel.vehiclesModel.numberFood;
                            surveyPt.vehiclesData.numberGrocery =
                                VehModel.vehiclesModel.numberGrocery;
                            surveyPt.vehiclesData.numberOtherParcels =
                                VehModel.vehiclesModel.numberOtherParcels;

                            surveyPt.hhsIsDwellingType = HhsStatic
                                .householdQuestions.hhsIsDwelling; //solve

                            surveyPt.hhsNumberSeparateFamilies = HhsStatic
                                .householdQuestions
                                .hhsNumberSeparateFamilies; //solve
                            surveyPt.hhsNumberYearsInAddress = HhsStatic
                                .householdQuestions
                                .hhsNumberYearsInAddress; //solve
                            surveyPt.hhsPhone =
                                HhsStatic.householdAddress.hhsPhone;
                            surveyPt.hhsHavePastTrip = HhsStatic
                                .householdAddress.hhsHavePastTrip; //solve

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
                            HhsStatic.peopleUnder18=peopleUnder18.text;
                            HhsStatic.peopleAdults18=peopleAdults18.text;
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
                            surveyPt.hhsDemolishedAreas = yes.text;
                            surveyPt.headerDistrictName = '';
                            surveyPt.headerZoneNumber = '';
                            RegExp regex = RegExp(
                                r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$');
                            if (!regex.hasMatch(HhsStatic
                                .householdAddress.hhsPhone.text
                                .trim())) {
                              return Validator.showSnack(
                                  context, 'رقم الهاتف غير صحيح..!');
                            }
                            await _determinePosition().then((value) {
                              surveyPt.hhsAddressLat =
                                  value.latitude.toString();
                              surveyPt.hhsAddressLong =
                                  value.longitude.toString();
                            }).onError(
                              (error, stackTrace) {
                                print(error);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("يجب تشغيل خدمة تحديد الموقع"),
                                    duration: Duration(seconds: 3),
                                    elevation: 1,
                                  ),
                                );
                              },
                            );
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
                    ],
                  ),
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/hhs_Q1.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/hhs_Q10.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/hhs_Q2.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/house_hold_address.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/action_button.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/house_hold_member.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/qh9.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/editing_controller.dart';
import 'package:provider/provider.dart';

import '../../../Models/user_serveys_model.dart';
import '../../Widgets/exit_screen.dart';
import '../vechicles/components/nearest_transporter.dart';
import 'Components/hhs_Q5.dart';
import 'actions/action_survey_screen.dart';
import 'components/demolished_area.dart';
import 'components/hhs_Q4.dart';
import 'components/hhs_Q81.dart';
import 'components/hhs_Q82.dart';
import 'components/hhs_Q83.dart';
import 'components/hhs_q6.dart';
import 'components/hhs_qh4.dart';
import 'components/hhs_qh62.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen(
      {super.key, required this.id, required this.itemSurveyModel});

  final UserSurveysModelData itemSurveyModel;
  final String id;

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  EditingController editingController = EditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editingController.editingController3Q83.totalNumber.text = '';
    editingController.editingController3Q83.peopleUnder18.text = '';
    editingController.editingController3Q83.peopleAdults18.text = '';
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Consumer<ActionSurveyProvider>(
                        builder: (context, provider, child) {
                      return Column(
                        children: [
                          // ===== HouseHoldAddress ===
                          HouseHoldAddress(
                            itemSurveyModel: widget.itemSurveyModel,
                          ),
                          AppSize.spaceHeight3(context),
                          const HouseHoldMember(),
                          // ====Question 1====
                          const HHSQ1(),
                          // ====Question 2====
                          const HHSQ2(),
                          // ====Question 3====

                          AppSize.spaceHeight3(context),
                          HHsQh4(
                            editingController: editingController,
                          ),
                          // ====Question 4====
                          HHSQ4(
                            q6peopleAdults18:
                                editingController.q6peopleAdults18,
                            q6peopleUnder18: editingController.q6peopleUnder18,
                            q6totalNumberOfVec:
                                editingController.q6totalNumberOfVec,
                          ),
                          AppSize.spaceHeight2(context),

                          // ====Question 5====
                          HHSQ5(
                            peopleAdults18: editingController.peopleAdults18,
                            peopleUnder18: editingController.peopleUnder18,
                          ),
                          AppSize.spaceHeight3(context),
                          // ====Question 6====
                          const HHsQ6(),
                          // ====Question 7====
                          HHSQH62(editingController),
                          DemolishedArea(editingController),
                          AppSize.spaceHeight5(context),
                          Q81(
                              editingController3:
                                  editingController.editingController3Q81),
                          AppSize.spaceHeight3(context),
                          Q82(
                              editingController3:
                                  editingController.editingController3Q82),
                          AppSize.spaceHeight3(context),
                          Q83(
                              editingController3:
                                  editingController.editingController3Q83),
                          AppSize.spaceHeight2(context),
                          QH9(),
                          AppSize.spaceHeight3(context),
                          //========HHSQ9=================
                          const NearestTransporter(),
                          //========HHSQ10=================
                          const HHSQ10(),
                          ActionButton(
                              editingController: editingController,
                              keyVal: _key,
                              id: widget.id),
                          /* DefaultButton(
                            function: () async {
                              if (_key.currentState!.validate()) {
                                _key.currentState!.save();

                                HhsStatic.houseHold.clear();
                                for (int i = 0;
                                    i <
                                        editingController
                                            .q6peopleUnder18.length;
                                    i++) {
                                  HhsStatic.houseHold.add(
                                    SeparateFamilies(
                                      editingController
                                          .q6peopleAdults18[i].text,
                                      editingController.q6peopleUnder18[i].text,
                                      editingController
                                          .q6totalNumberOfVec[i].text,
                                    ),
                                  );
                                }

                                if (HhsStatic
                                        .householdQuestions.hhsDwellingType ==
                                    "أخر") {
                                  HhsStatic.householdQuestions.hhsDwellingType =
                                      HhsStatic.householdQuestions
                                          .hhsDwellingTypeOther!.text;
                                }
                                if (HhsStatic
                                        .householdQuestions.hhsIsDwelling ==
                                    "أخر") {
                                  HhsStatic.householdQuestions.hhsIsDwelling =
                                      HhsStatic.householdQuestions
                                          .hhsIsDwellingOther!.text;
                                }

                                surveyPt.id = widget.id;

                                //==========HHS-Header============
                                surveyPt.hhsPhone =
                                    HhsStatic.householdAddress.hhsPhone;
                                // ===>> Q1=====
                                surveyPt.hhsDwellingType = HhsStatic
                                    .householdQuestions.hhsDwellingType; //solve
                                surveyPt.hhsNumberApartments.text = HhsStatic
                                    .householdQuestions
                                    .hhsNumberApartments
                                    .text;
                                surveyPt.hhsNumberFloors.text = HhsStatic
                                    .householdQuestions.hhsNumberFloors.text;
                                surveyPt.hhsNumberBedRooms.text = HhsStatic
                                    .householdQuestions.hhsNumberBedRooms.text;
                                // ================ HHSQ10 ==============
                                // surveyPt.hhsSeparateFamilies = HhsStatic.houseHold[0].totalNumberVehicles;
                                surveyPt.vehiclesData.numberParcels =
                                    VehModel.vehiclesModel.numberParcels;
                                surveyPt.vehiclesData.numberParcelsDeliveries =
                                    VehModel
                                        .vehiclesModel.numberParcelsDeliveries;
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

                                surveyPt.hhsNumberAdults =
                                    editingController.peopleAdults18.text;
                                surveyPt.hhsNumberChildren = editingController
                                    .peopleUnder18.text; //solve
                                surveyPt.hhsSeparateFamilies =
                                    HhsStatic.houseHold;
                                surveyPt.hhsTotalIncome =
                                    HhsStatic.householdQuestions.hhsTotalIncome;
                                surveyPt.hhsPCChildrenBikesNumber =
                                    editingController.editingController3Q81
                                        .peopleUnder18.text;
                                surveyPt.hhsPCTotalBikesNumber =
                                    editingController
                                        .editingController3Q81.totalNumber.text;
                                surveyPt.hhsPCAdultsBikesNumber =
                                    editingController.editingController3Q81
                                        .peopleAdults18.text;
                                HhsStatic.peopleUnder18 =
                                    editingController.peopleUnder18.text;
                                HhsStatic.peopleAdults18 =
                                    editingController.peopleAdults18.text;
                                surveyPt.hhsECChildrenBikesNumber =
                                    editingController.editingController3Q82
                                        .peopleUnder18.text;
                                surveyPt.hhsECTotalBikesNumber =
                                    editingController
                                        .editingController3Q82.totalNumber.text;
                                surveyPt.hhsECAdultsBikesNumber =
                                    editingController.editingController3Q82
                                        .peopleAdults18.text;
                                surveyPt.hhsESChildrenBikesNumber =
                                    editingController.editingController3Q83
                                        .peopleUnder18.text;
                                surveyPt.hhsESTotalBikesNumber =
                                    editingController
                                        .editingController3Q83.totalNumber.text;
                                surveyPt.hhsESAdultsBikesNumber =
                                    editingController.editingController3Q83
                                        .peopleAdults18.text;
                                surveyPt.hhsDemolishedAreas =
                                    editingController.yes.text;
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
                                    debugPrint(error.toString());
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
                          ),*/
                        ],
                      );
                    })),
              ),
            ),
          )),
        ),
      ),
    );
  }
}

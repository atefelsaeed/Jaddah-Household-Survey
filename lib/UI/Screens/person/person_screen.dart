import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/validate_data/person_validation.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/occupation_model.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/person_model.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/personal_question.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/default_entry.dart';
import 'package:jaddah_household_survey/UI/Widgets/headline.dart';

import '../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../Data/HouseholdPart1/save_data.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/show_dialog_error.dart';
import '../../Widgets/text.dart';
import '../../Widgets/text_form_field.dart';
import '../Survey/widgets/editing_controler3.dart';
import '../Survey/widgets/list_view_check_box_orange.dart';
import '../Survey/widgets/text_form_row.dart';
import '../trips/trip_screen.dart';
import 'components/employee.dart';
import 'components/nationality.dart';
import 'components/transporter_moblity.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  bool type = false;
  bool typeAlone = true;
  bool hasPasTrip = false;
  var mainOccupationKey = PersonData.mainOccupation.keys.first;
  TextEditingController occupationSectorController = TextEditingController();
  var occupationSectorKey = PersonData.occupationSector.keys.first;
  final GlobalKey<FormState> _key = GlobalKey();
  late EditingController3 editingController3 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());
  var base = PersonModelList.personModelList;

  void showError() => showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        int x = int.parse(HhsStatic.peopleAdults18.toString()) +
            int.parse(HhsStatic.peopleUnder18.toString());
        return ShowErrorDialog(
          title: 'لا يمكنك إضافة المزيد',
          content: 'عدد أفراد عائلتك الذين يعيشون فى هذا المنزل هو ($x)'
              '',
        );
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _key,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    const HeadlinePerson(
                      text: "المعلومات الاجتماعية والاقتصادية للأسر المعيشية",
                    ),
                    AppSize.spaceHeight2(context),
                    for (int i = 0;
                        i < PersonModelList.personModelList.length;
                        i++)
                      Padding(
                        padding: EdgeInsets.all(AppSize.padding1(context)),
                        child: Container(
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorManager.gray2Color),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(AppSize.padding1(context)),
                            child: Column(
                              children: [
                                DefaultEntry(
                                  i: i,
                                  function: () {
                                    setState(() {
                                      PersonModelList.personModelList
                                          .removeAt(i);
                                    });
                                  },
                                ),
                                AppSize.spaceHeight2(context),
                                //=============Person-Age==================
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextGlobal(
                                      text: "العمر",
                                      fontSize: height(context) * .025,
                                      color: ColorManager.black,
                                    ),
                                  ],
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Row(
                                    children: [
                                      Row(children: [
                                        TextGlobal(
                                          text: "العمر",
                                          //[index].title,
                                          fontSize: height(context) * .02,
                                          color: ColorManager.grayColor,
                                        ),
                                        Checkbox(
                                            side: BorderSide(
                                              color:
                                                  ColorManager.orangeTxtColor,
                                              width: 1.5,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            checkColor: ColorManager.whiteColor,
                                            focusColor:
                                                ColorManager.orangeTxtColor,
                                            activeColor:
                                                ColorManager.orangeTxtColor,
                                            value: base[i]
                                                .personalHeadData!
                                                .checkAge,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                base[i]
                                                    .personalHeadData!
                                                    .checkAge = value!;
                                                base[i]
                                                    .personalHeadData!
                                                    .age
                                                    .text = '';
                                                base[i]
                                                    .personalHeadData!
                                                    .refuseToTellAge = false;
                                              });
                                            }),
                                        base[i].personalHeadData!.checkAge ==
                                                true
                                            ? MyTextForm(
                                                isNumber: true,
                                                onChanged: (d) {
                                                  setState(() {
                                                    if (d!.isNotEmpty) {
                                                      if (int.parse(
                                                              d.toString()) >
                                                          18) {
                                                        base[i]
                                                            .occupationModel!
                                                            .isEmployee = "1";
                                                      } else {
                                                        base[i]
                                                            .occupationModel!
                                                            .isEmployee = "0";
                                                      }
                                                    } else {
                                                      base[i]
                                                          .occupationModel!
                                                          .isEmployee = "";
                                                    }
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                widthForm: width(context) * .15,
                                                label: "age",
                                                controller: base[i]
                                                    .personalHeadData!
                                                    .age,
                                              )
                                            : Container(),
                                        AppSize.spaceWidth2(context),
                                        TextGlobal(
                                          text: "لا ",
                                          //[index].title,
                                          fontSize: height(context) * .02,
                                          color: ColorManager.grayColor,
                                        ),
                                        Checkbox(
                                            side: BorderSide(
                                              color:
                                                  ColorManager.orangeTxtColor,
                                              width: 1.5,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            checkColor: ColorManager.whiteColor,
                                            focusColor:
                                                ColorManager.orangeTxtColor,
                                            activeColor:
                                                ColorManager.orangeTxtColor,
                                            value: base[i]
                                                .personalHeadData!
                                                .refuseToTellAge,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                base[i]
                                                    .personalHeadData!
                                                    .refuseToTellAge = value!;
                                                base[i]
                                                    .personalHeadData!
                                                    .checkAge = false;
                                              });
                                            }),
                                        base[i]
                                                    .personalHeadData!
                                                    .refuseToTellAge ==
                                                true
                                            ? DropDownFormInput2(
                                                label: base[i]
                                                            .personalHeadData!
                                                            .age
                                                            .text !=
                                                        ''
                                                    ? Text(base[i]
                                                        .personalHeadData!
                                                        .age
                                                        .text)
                                                    : const Text('إختار'),
                                                hint: "الفئة العمرية",
                                                options: PersonData.groupAge[
                                                        PersonData.groupAge.keys
                                                            .first]!
                                                    .toList(),
                                                onChange: (String? p) {
                                                  base[i]
                                                      .personalHeadData!
                                                      .checkAge = false;

                                                  base[i]
                                                      .personalHeadData!
                                                      .age
                                                      .text = p.toString();

                                                  List value = PersonData
                                                      .groupAge[PersonData
                                                          .groupAge.keys.first]
                                                      .toList();
                                                  setState(() {
                                                    for (int inr = 0;
                                                        inr < value.length;
                                                        inr++) {
                                                      if (p ==
                                                          value[inr]["value"]) {
                                                        setState(() {
                                                          base[i]
                                                                  .occupationModel!
                                                                  .isEmployee =
                                                              value[inr]
                                                                  ["type"];
                                                        });
                                                      }
                                                    }
                                                  });
                                                },
                                              )
                                            : Container(),
                                      ]),
                                    ],
                                  ),
                                ),
                                AppSize.spaceHeight1(context),
                                //=============HHS-HavePastTrip==================
                                ListViewCheckBoxOrange(
                                  map: QuestionsData.hhsHavePastTrip,
                                  onChange: (ChangeBoxResponse r) {
                                    setState(() {
                                      if (r.val == "لا" && r.check == true) {
                                        base[i].personalHeadData!.hasPasTrip =
                                            true;
                                        base[i]
                                            .personalHeadData!
                                            .hhsHavePastTrip
                                            .text = '';
                                      } else {
                                        base[i].personalHeadData!.hasPasTrip =
                                            false;

                                        base[i]
                                            .personalHeadData!
                                            .hhsHavePastTrip
                                            .text = 'نعم';
                                      }
                                    });
                                  },
                                  isListView: true,
                                  title: "هل قمت برحلة فى الأيام السابقة",
                                  question: QuestionsData.hhsHavePastTrip[
                                          QuestionsData
                                              .hhsHavePastTrip.keys.first]!
                                      .toList(),
                                  subTitle: "",
                                ),
                                base[i].personalHeadData!.hasPasTrip == true
                                    ? TextForm(
                                        label: 'إذكر السبب',
                                        text: 'إذكر السبب',
                                        controller: base[i]
                                            .personalHeadData!
                                            .hhsHavePastTrip,
                                      )
                                    : Container(),
                                AppSize.spaceHeight1(context),
                                //=========Nationality======================
                                Nationality(i: i),
                                AppSize.spaceHeight3(context),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    base[i].occupationModel!.isEmployee == ""
                                        ? Container()
                                        : DropDownFormInput2(
                                            label: PersonModelList
                                                        .personModelList[i]
                                                        .personalQuestion!
                                                        .mainOccupationType !=
                                                    ''
                                                ? Text(PersonModelList
                                                        .personModelList[i]
                                                        .personalQuestion!
                                                        .mainOccupationType ??
                                                    '')
                                                : const Text('إختار'),
                                            hint: "الوظيفة الأساسية",
                                            options: PersonData.mainOccupation[
                                                    mainOccupationKey]!
                                                .toList(),
                                            onChange: (String? p) {
                                              List value = PersonData
                                                  .mainOccupation[
                                                      mainOccupationKey]
                                                  .toList();

                                              for (int inr = 0;
                                                  inr < value.length;
                                                  inr++) {
                                                if (p == value[inr]["value"]) {
                                                  PersonModelList
                                                          .personModelList[i]
                                                          .personalQuestion!
                                                          .mainOccupationType =
                                                      value[inr]["value"];
                                                }
                                              }
                                              setState(() {
                                                PersonModelList
                                                        .personModelList[i]
                                                        .personalQuestion!
                                                        .mainOccupationType ==
                                                    p.toString();
                                              });

                                              debugPrint(p.toString());
                                            },
                                          ),
                                    base[i].occupationModel!.isEmployee == ""
                                        ? Container()
                                        : base[i].occupationModel!.isEmployee ==
                                                "1"
                                            ? PersonModelList
                                                            .personModelList[i]
                                                            .personalQuestion!
                                                            .mainOccupationType ==
                                                        "عاطلين عن العمل" ||
                                                    PersonModelList
                                                            .personModelList[i]
                                                            .personalQuestion!
                                                            .mainOccupationType ==
                                                        "طالب - جامعي: دوام كامل (لا يعمل) " ||
                                                    PersonModelList
                                                            .personModelList[i]
                                                            .personalQuestion!
                                                            .mainOccupationType ==
                                                        "شخص البيت" ||
                                                    PersonModelList
                                                            .personModelList[i]
                                                            .personalQuestion!
                                                            .mainOccupationType ==
                                                        "طفل فى الحضانة" ||
                                                    PersonModelList
                                                            .personModelList[i]
                                                            .personalQuestion!
                                                            .mainOccupationType ==
                                                        "طفل ليس فى الحضانة" ||
                                                    PersonModelList
                                                            .personModelList[i]
                                                            .personalQuestion!
                                                            .mainOccupationType ==
                                                        "رفض" ||
                                                    PersonModelList
                                                            .personModelList[i]
                                                            .personalQuestion!
                                                            .mainOccupationType ==
                                                        "معاق / مريض"
                                                ? Container()
                                                : Column(
                                                    children: [
                                                      DropDownFormInput(
                                                        label: PersonModelList
                                                                    .personModelList[
                                                                        i]
                                                                    .occupationModel!
                                                                    .occupationSector !=
                                                                ''
                                                            ? Text(PersonModelList
                                                                    .personModelList[
                                                                        i]
                                                                    .occupationModel!
                                                                    .occupationSector ??
                                                                '')
                                                            : const Text(
                                                                'إختار'),
                                                        hint:
                                                            "لو عمل ما هو قطا ع العمل",
                                                        options: PersonData
                                                            .occupationSector[
                                                                occupationSectorKey]!
                                                            .toList(),
                                                        onChange: (String? p) {
                                                          setState(() {
                                                            PersonModelList
                                                                    .personModelList[
                                                                        i]
                                                                    .occupationModel!
                                                                    .occupationSector =
                                                                p.toString();
                                                          });
                                                        },
                                                      ),
                                                      PersonModelList
                                                                  .personModelList[
                                                                      i]
                                                                  .occupationModel!
                                                                  .occupationSector ==
                                                              " حدد أخرى"
                                                          ? MyTextForm(
                                                              controller:
                                                                  occupationSectorController,
                                                              label:
                                                                  " قطاع العمل",
                                                              onChanged: (val) {
                                                                PersonModelList
                                                                    .personModelList[
                                                                        i]
                                                                    .occupationModel!
                                                                    .occupationSector = val;
                                                              },
                                                            )
                                                          : Container(),
                                                    ],
                                                  )
                                            : Container()
                                  ],
                                ),
                                base[i].occupationModel!.isEmployee == "1"
                                    ? PersonModelList
                                                    .personModelList[i]
                                                    .personalQuestion!
                                                    .mainOccupationType ==
                                                "طفل ليس فى الحضانة" ||
                                            PersonModelList
                                                    .personModelList[i]
                                                    .personalQuestion!
                                                    .mainOccupationType ==
                                                "طفل فى الحضانة" ||
                                            PersonModelList
                                                    .personModelList[i]
                                                    .personalQuestion!
                                                    .mainOccupationType ==
                                                "رفض"
                                        ? Container()
                                        : Employee(i: i)
                                    : Container(),
                                base[i].occupationModel!.isEmployee == ""
                                    ? Container()
                                    : TransporterMobilty(index: i)
                              ],
                            ),
                          ),
                        ),
                      ),
                    AppSize.spaceHeight2(context),
                    //============Add-New-Person-Button=============
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DefaultButton(
                          function: () {
                            setState(() {
                              int x = int.parse(
                                      HhsStatic.peopleAdults18.toString()) +
                                  int.parse(HhsStatic.peopleUnder18.toString());

                              debugPrint(PersonModelList.personModelList.length
                                  .toString());
                              PersonModelList.personModelList.length;
                              if (x > PersonModelList.personModelList.length) {
                                setState(() {
                                  PersonModelList.personModelList.add(
                                    PersonModel(
                                      //==personalHeadData==
                                      personName: TextEditingController(),
                                      personalHeadData: PersonalHeadData(
                                        age: TextEditingController(),
                                        nationality: TextEditingController(),
                                        hhsHavePastTrip:
                                            TextEditingController(),
                                        nationalityType: '',
                                        gender: '',
                                        checkAge: false,
                                        hasPasTrip: false,
                                        showText: false,
                                        refuseToTellAge: false,
                                        relationshipHeadHHS: '',
                                      ),
                                      //==personalQuestion==
                                      personalQuestion: PersonalQuestion(
                                        mainOccupationType: '',
                                        asPassenger: '',
                                        availablePersonalCar: '',
                                        drivingLicenceType: '',
                                        haveBusPass: '',
                                        haveDisabilityTransportMobility: '',
                                        haveCarSharing: false,
                                        educationAddress: EducationAddress(
                                          fullAddress: TextEditingController(),
                                          geocodes: TextEditingController(),
                                        ),
                                      ),
                                      //==occupationModel==
                                      occupationModel: OccupationModel(
                                        earliestTimeFinishingWork:
                                            TextEditingController(),
                                        earliestTimeStartingWork:
                                            TextEditingController(),
                                        endingWoke: TextEditingController(),
                                        startingWoke: TextEditingController(),
                                        address: TextEditingController(),
                                        geoCodes: TextEditingController(),
                                        mainOccupationAddress:
                                            TextEditingController(),
                                        bestWorkspaceLocation: '',
                                        bikeWorkDays: 0,
                                        commuteWorkDays: 0,
                                        flexibleWorkingHours: '',
                                        isEmployee: '',
                                        isWorkFromHome: false,
                                        numberWorkFromHome: 0,
                                        occupationLevelSector: '',
                                        occupationSector: '',
                                      ),
                                    ),
                                  );
                                  PersonData.nationality[PersonData
                                                  .nationality.keys.first]!
                                              .toList()[
                                          PersonData.nationality["index"]]
                                      ["isChick"] = false;
                                  QuestionsData.hhsHavePastTrip[QuestionsData
                                                  .hhsHavePastTrip.keys.first]!
                                              .toList()[
                                          QuestionsData
                                              .hhsHavePastTrip["index"]]
                                      ["isChick"] = false;
                                  hasPasTrip = false;
                                });
                              } else {
                                showError();
                              }
                            });
                          },
                          isWidget: true,
                          btnWidth: width(context) * .35,
                          text: "أضافة شخص جديد",
                          widget: const Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                    AppSize.spaceHeight6(context),
                    //======Navigation Buttons================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultButton(
                          function: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              SavePersonData.saveData(context);
                              if (CheckPersonValidation.validatePerson(
                                  context)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TripScreen()));
                              }
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
                        AppSize.spaceWidth3(context),
                        DefaultButton(
                          function: () {
                            Navigator.pop(context);
                          },
                          isWidget: true,
                          background: ColorManager.grayColor,
                          text: "السابق",
                          widget: const Icon(Icons.arrow_back_rounded),
                        ),
                      ],
                    ),
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

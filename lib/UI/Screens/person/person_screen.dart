import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/occupation_model.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/person_model.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/personal_question.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/default_entry.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/headline.dart';

import '../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../Data/HouseholdPart1/save_data.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/text.dart';
import '../../Widgets/text_form_field.dart';
import '../Survey/components/q5.dart';
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
  var mainOccupationKey = PersonData.mainOccupation.keys.first;

  var occupationSectorKey = PersonData.occupationSector.keys.first;
  final GlobalKey<FormState> _key = GlobalKey();
  late EditingController3 editingController3 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  @override
  Widget build(BuildContext context) {
    var base = PersonModelList.personModelList;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DefaultButton(
                          function: () {
                            setState(() {
                              PersonModelList.personModelList.add(
                                PersonModel(
                                  //==personalHeadData==
                                  personalHeadData: PersonalHeadData(
                                    age: TextEditingController(),
                                    nationality: TextEditingController(),
                                    nationalityType: '',
                                    gender: '',
                                    checkAge: false,
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
//                              AllData.personModel[0].isEmployee=1;
                            });

                            //   surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="kkk";
                          },
                          isWidget: true,
                          btnWidth: width(context) * .25,
                          text: "أضافة شخص جديد",
                          widget: const Icon(Icons.arrow_forward),
                        )
                      ],
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
                              border:
                                  Border.all(color: ColorManager.gray2Color)),
                          child: Padding(
                            padding: EdgeInsets.all(AppSize.padding1(context)),
                            child: Column(
                              children: [
                                DefaultEntry(i: i),
                                AppSize.spaceHeight2(context),
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
                                                label: const Text('إختار'),
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
                                                        print(base[i]
                                                                .occupationModel!
                                                                .isEmployee =
                                                            value[inr]["type"]);
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
                                Nationality(
                                  i: i,
                                ),
                                AppSize.spaceHeight3(context),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    base[i].occupationModel!.isEmployee == ""
                                        ? Container()
                                        : DropDownFormInput2(
                                            label: Text(PersonData
                                                .mainOccupation[
                                                    mainOccupationKey]!
                                                .toList()
                                                .first["value"]
                                                .toString()),
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

                                              print(p.toString());
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
                                                : DropDownFormInput(
                                                    label: Text(PersonData
                                                        .occupationSector[
                                                            occupationSectorKey]!
                                                        .toList()
                                                        .first
                                                        .toString()),
                                                    hint:
                                                        "لو عمل ما هو قطا ع العمل",
                                                    options: PersonData
                                                        .occupationSector[
                                                            occupationSectorKey]!
                                                        .toList(),
                                                    onChange: (String? p) {
                                                      PersonModelList
                                                              .personModelList[i]
                                                              .occupationModel!
                                                              .occupationSector =
                                                          p.toString();
                                                    },
                                                  )
                                            : Container(),
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
                    DefaultButton(
                      function: () {
                        if (_key.currentState!.validate()) {
                          _key.currentState!.save();

                          SavePersonData.saveData(context);
                          print(PersonModelList
                              .personModelList[0].personalHeadData!.age.text);

                          print('Saving Data :: ');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TripScreen(),
                            ),
                          );
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
    );
  }
}

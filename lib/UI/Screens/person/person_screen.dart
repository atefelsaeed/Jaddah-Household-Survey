import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/occupation_model.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/person_model.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/personal_question.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/default_entry.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/education_level.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/headline.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/next_step.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/transporter_moblity.dart';
import 'package:jaddah_household_survey/UI/Screens/person/person_model.dart';
import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/all_data.dart';
import '../../../Data/HouseholdPart1/person_data.dart';
import '../../../Providers/survey_hhs.dart';
import '../../../Providers/surveys.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/text.dart';
import '../../Widgets/text_form_field.dart';
import '../Survey/components/q5.dart';
import 'components/employee.dart';
import 'components/nationality.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  bool type = false;
  bool typeAlone = true;
  final GlobalKey<FormState> _key = GlobalKey();
  late EditingController3 editingController3 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    SurveysProvider surveys =
        Provider.of<SurveysProvider>(context, listen: false);
    var base = PersonModelList.personModelList;
    return SafeArea(
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
                    const HeadlinePerson(
                      text:
                          "Person Socioeconomic- Household Travel Diary Survey",
                    ),
                    AppSize.spaceHeight2(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DefaultButton(
                          function: () {
                            setState(() {
                              PersonModelList.personModelList.add(
                                  //     PersonModel(
                                  //   nationality: "",
                                  //   addressMainOccuption: TextEditingController(),
                                  //   earlyAndLateFinish: TextEditingController(),
                                  //   earlyAndLateStart: TextEditingController(),
                                  //   startYourWork: TextEditingController(),
                                  //   endYourWork: TextEditingController(),
                                  //   geocode: TextEditingController(),
                                  //   educateAddress: TextEditingController(),
                                  //   isEmployee: "0",
                                  //   address: TextEditingController(),
                                  //   realtionShipOfTheHeadHouse: "",
                                  //   nationallityEditingController:
                                  //       TextEditingController(),
                                  //   gender: "male",
                                  //   checkAge: false,
                                  //   refuseToTellAge: false,
                                  //   needAge: TextEditingController(),
                                  // )
                                  PersonModel(
                                personalHeadData: PersonalHeadData(),
                                personalQuestion: PersonalQuestion(),
                                occupationModel: OccupationModel(),
                              ));
//                              AllData.personModel[0].isEmployee=1;
                            });

                            //   surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="kkk";
                          },
                          isWidget: true,
                          btnWidth: width(context) * .24,
                          text: "Add New Person",
                          widget: const Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextGlobal(
                                      text: "Age",
                                      fontSize: height(context) * .025,
                                      color: ColorManager.black,
                                    ),
                                  ],
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    children: [
                                      Row(children: [
                                        TextGlobal(
                                          text: "With other",
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
                                              });
                                            }),
                                        base[i].personalHeadData!.checkAge ==
                                                true
                                            ? MyTextForm(
                                                label: "age",
                                                controller: base[i]
                                                    .personalHeadData!
                                                    .age,
                                              )
                                            : Container(),
                                        TextGlobal(
                                          text: "refuses to tell age",
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
                                                label: Text(PersonData.groupAge[
                                                        PersonData.groupAge.keys
                                                            .first]!
                                                    .toList()
                                                    .first["value"]
                                                    .toString()),
                                                hint: PersonData
                                                    .groupAge.keys.first
                                                    .toString(),
                                                options: PersonData.groupAge[
                                                        PersonData.groupAge.keys
                                                            .first]!
                                                    .toList(),
                                                onChange: (String? p) {
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
                                base[i].occupationModel!.isEmployee == "1"
                                    ? Employee(i: i)
                                    : base[i].occupationModel!.isEmployee == "2"
                                        ? EducationLevel(i: i)
                                        : Container(),
                                base[i].occupationModel!.isEmployee != "0"
                                    ? TransporterMobilty(index: i)
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    AppSize.spaceHeight2(context),
                    const NextStep(),
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

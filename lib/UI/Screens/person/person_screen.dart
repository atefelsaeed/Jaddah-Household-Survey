import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/person_data.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:provider/provider.dart';

import '../../../Providers/survey_hhs.dart';
import '../../../Providers/surveys.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/text.dart';
import '../../Widgets/text_form_field.dart';
import '../Survey/components/q5.dart';
import '../Survey/widgets/list_view_check_box_orange.dart';
import '../Survey/widgets/text_form_row.dart';

class PersonModel {
  late TextEditingController textEditingController;
  late String realtionShipOfTheHeadHouse;
  late String gender;
  late bool checkAge;
  late bool refuseToTellAge;
  late String text;
  late TextEditingController needAge;
  late String keyMainOccupation;
  late String valueMainOccupation;
  late String typeEmployee;
  late String valueEmployee;
  late String occupationSector;
  late String occupationLevel;
  late String workplace;
  late String commute;
  late String bike;
  late int isEmployee;
  late TextEditingController address;
  late TextEditingController geocode;
  late TextEditingController startYourWork;
  late TextEditingController endYourWork;
  late TextEditingController earlyAndLateStart;
  late TextEditingController educateAddress;
  late TextEditingController earlyAndLateFinish;
  late TextEditingController addressMainOccuption;

  PersonModel(
      {required this.addressMainOccuption,
      required this.startYourWork,
      required this.earlyAndLateFinish,
      required this.earlyAndLateStart,
      required this.endYourWork,
        required this.educateAddress,
      required this.textEditingController,
      required this.address,
      required this.geocode,
        required this.isEmployee,
      required this.gender,
      required this.checkAge,
      required this.realtionShipOfTheHeadHouse,
      required this.refuseToTellAge,
      required this.needAge});
}

class AllData {
  static List<PersonModel> personModel = [
    PersonModel(
      addressMainOccuption: TextEditingController(),
      earlyAndLateFinish: TextEditingController(),
      earlyAndLateStart: TextEditingController(),
      startYourWork: TextEditingController(),
      endYourWork: TextEditingController(),
      geocode: TextEditingController(),
      educateAddress: TextEditingController(),
      isEmployee: 0,
      address: TextEditingController(),
      realtionShipOfTheHeadHouse: "",
      textEditingController: TextEditingController(),
      gender: "male",
      checkAge: false,
      refuseToTellAge: false,
      needAge: TextEditingController(),
    )
  ];
}

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppSize.spaceWidth1(context),
                        TextGlobal(
                          text:
                              "Person Socioeconomic- Household Travel Diary Survey",
                          fontSize: height(context) * .023,
                          color: ColorManager.orangeTxtColor,
                        ),
                      ],
                    ),
                    AppSize.spaceHeight2(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DefaultButton(
                          function: () {
                            setState(() {
                              AllData.personModel[0].isEmployee=1;
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
                    for (int i = 0; i < AllData.personModel.length; i++)
                      Column(
                        children: [
                          TextGlobal(
                            text: "Person 1",
                            fontSize: height(context) * .023,
                            color: ColorManager.orangeTxtColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DropDownFormInput(
                                label: Text(PersonData
                                    .gender[PersonData.gender.keys.first]!
                                    .toList()
                                    .first
                                    .toString()),
                                hint: PersonData.gender.keys.first.toString(),
                                options: PersonData
                                    .gender[PersonData.gender.keys.first]!
                                    .toList(),
                                onChange: (String? p) {},
                              ),
                              DropDownFormInput(
                                label: Text(PersonData
                                    .relationshipToTheHeadOfHousehold[PersonData
                                        .relationshipToTheHeadOfHousehold
                                        .keys
                                        .first]!
                                    .toList()
                                    .first
                                    .toString()),
                                hint: PersonData
                                    .relationshipToTheHeadOfHousehold.keys.first
                                    .toString(),
                                options: PersonData
                                    .relationshipToTheHeadOfHousehold[PersonData
                                        .relationshipToTheHeadOfHousehold
                                        .keys
                                        .first]!
                                    .toList(),
                                onChange: (var p) {
                                  print(p);
                                },
                              ),
                            ],
                          ),
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
                                        color: ColorManager.orangeTxtColor,
                                        width: 1.5,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      checkColor: ColorManager.whiteColor,
                                      focusColor: ColorManager.orangeTxtColor,
                                      activeColor: ColorManager.orangeTxtColor,
                                      value: AllData.personModel[i].checkAge,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          AllData.personModel[i].checkAge =
                                              value!;
                                        });
                                      }),
                                  AllData.personModel[i].checkAge == true
                                      ? MyTextForm(
                                          label: "age",
                                          controller:
                                              AllData.personModel[i].needAge,
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
                                        color: ColorManager.orangeTxtColor,
                                        width: 1.5,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      checkColor: ColorManager.whiteColor,
                                      focusColor: ColorManager.orangeTxtColor,
                                      activeColor: ColorManager.orangeTxtColor,
                                      value: AllData
                                          .personModel[i].refuseToTellAge,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          AllData.personModel[i]
                                              .refuseToTellAge = value!;
                                          AllData.personModel[i].checkAge =
                                              false;
                                        });
                                      }),
                                  AllData.personModel[i].refuseToTellAge == true
                                      ? DropDownFormInput(
                                          label: Text(PersonData
                                              .relationshipToTheHeadOfHousehold[
                                                  PersonData
                                                      .relationshipToTheHeadOfHousehold
                                                      .keys
                                                      .first]!
                                              .toList()
                                              .first
                                              .toString()),
                                          hint: PersonData
                                              .relationshipToTheHeadOfHousehold
                                              .keys
                                              .first
                                              .toString(),
                                          options: PersonData
                                              .relationshipToTheHeadOfHousehold[
                                                  PersonData
                                                      .relationshipToTheHeadOfHousehold
                                                      .keys
                                                      .first]!
                                              .toList(),
                                          onChange: (String? p) {},
                                        )
                                      : Container(),
                                ]),
                              ],
                            ),
                          ),
                          ListViewCheckBoxOrange(
                            title: "Nationality",
                            question: PersonData
                                .nationality[PersonData.nationality.keys.first]!
                                .toList(),
                            subTitle:
                                "Nationality -In case one has dual nationality; please record passport/nationality on which a person has the UAE residence visa ",
                          ),
  AllData.personModel[i].isEmployee==1?   Employee(i: i): AllData.personModel[i].isEmployee==2?  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      DropDownFormInput(
        label: Text(PersonData.busBuss[
        PersonData.busBuss.keys.first]!
            .toList()
            .first
            .toString()),
        hint:
        PersonData.busBuss.keys.first.toString(),
        options: PersonData.busBuss[
        PersonData.busBuss.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
      TextForm(
        controller:
        AllData.personModel[i].educateAddress,
        text: "Education address -full details and get geocode",
        label: "Education address -full details and get geocode",
      )
    ],
  ):Container(),
                          DefaultButton(
                            function: () {
                              surveyPt.interViewDate=DateTime.now();
                              surveyPt.headerInterviewNumber=4;
                              surveyPt.headerDistrictName="ll";
                              surveyPt.vehiclesData.vehiclesBodyType!.vehicleTypeName="car";
                              surveys.addSurvey(surveyPt.data);
                              surveys.fetch();
                              print(surveyPt.headerDistrictName);
                              //   surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="kkk";
                            },
                            isWidget: true,
                            text: "Next Step",
                            widget: const Icon(Icons.arrow_forward),
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

class Employee extends StatelessWidget{
  final int i;
  const Employee({required this.i});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Column(children: [
  AppSize.spaceHeight3(context),
  Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      DropDownFormInput2(
        label: Text(PersonData.mainOccupation[
        PersonData.mainOccupation.keys.first]!
            .toList()
            .first["value"]
            .toString()),
        hint: PersonData.mainOccupation.keys.first
            .toString(),
        options: PersonData.mainOccupation[
        PersonData.mainOccupation.keys.first]!
            .toList(),
        onChange: (String? p) {
          List value = PersonData.mainOccupation[
          PersonData.mainOccupation.keys.first]
              .toList();
          print(value);
          for (int inr = 0; inr < value.length; inr++) {
            if (p == value[inr]["value"]) {
              AllData.personModel[i].valueEmployee =
              value[inr]["value"];
              AllData.personModel[i].typeEmployee =
              value[inr]["type"];
            }
          }
          print(AllData.personModel[i].typeEmployee);
        },
      ),
      DropDownFormInput(
        label: Text(PersonData.occupationSector[
        PersonData.occupationSector.keys.first]!
            .toList()
            .first
            .toString()),
        hint: PersonData.occupationSector.keys.first
            .toString(),
        options: PersonData.occupationSector[
        PersonData.occupationSector.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
    ],
  ),
  AppSize.spaceHeight3(context),
  Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      DropDownFormInput(
        label: Text(PersonData.occupationLevelSector[
        PersonData
            .occupationLevelSector.keys.first]!
            .toList()
            .first
            .toString()),
        hint: PersonData
            .occupationLevelSector.keys.first
            .toString(),
        options: PersonData.occupationLevelSector[
        PersonData
            .occupationLevelSector.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
      DropDownFormInput(
        label: Text(PersonData
            .workplace[PersonData.workplace.keys.first]!
            .toList()
            .first
            .toString()),
        hint:
        PersonData.workplace.keys.first.toString(),
        options: PersonData
            .workplace[PersonData.workplace.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
    ],
  ),
  AppSize.spaceHeight3(context),
  Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      DropDownFormInput(
        label: Text(PersonData
            .commute[PersonData.commute.keys.first]!
            .toList()
            .first
            .toString()),
        hint: PersonData.commute.keys.first.toString(),
        options: PersonData
            .commute[PersonData.commute.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
      DropDownFormInput(
        label: Text(PersonData
            .bike[PersonData.bike.keys.first]!
            .toList()
            .first
            .toString()),
        hint: PersonData.bike.keys.first.toString(),
        options: PersonData
            .bike[PersonData.bike.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
    ],
  ),
  AppSize.spaceHeight2(context),
  const HeadLine(
      title:
      "Address of the Main Occupation  (work or study place) ",
      subTitle:
      "Write both if a person is a part- time student and also part- time employed; then ask both education and work address"),
  AppSize.spaceHeight3(context),
  Directionality(
    textDirection: TextDirection.ltr,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextForm(
          controller: AllData.personModel[i].geocode,
          text: "Geocodes",
          label: "Geocodes",
        ),
        TextForm(
          controller: AllData.personModel[i].address,
          text: "address",
          label: "address",
        )
      ],
    ),
  ),
  AppSize.spaceHeight3(context),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      DropDownFormInput(
        label: Text(PersonData
            .workplace[PersonData.workplace.keys.first]!
            .toList()
            .first
            .toString()),
        hint:
        PersonData.workplace.keys.first.toString(),
        options: PersonData
            .workplace[PersonData.workplace.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
      DropDownFormInput(
        label: Text(PersonData.employeeOffer[
        PersonData.employeeOffer.keys.first]!
            .toList()
            .first
            .toString()),
        hint: PersonData.employeeOffer.keys.first
            .toString(),
        options: PersonData.employeeOffer[
        PersonData.employeeOffer.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
    ],
  ),
  AppSize.spaceHeight3(context),
  Directionality(
    textDirection: TextDirection.ltr,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextForm(
          controller:
          AllData.personModel[i].startYourWork,
          text: "StartYourWork",
          label: "StartYourWork",
        ),
        TextForm(
          controller:
          AllData.personModel[i].endYourWork,
          text: "endYourWork",
          label: "endYourWork",
        )
      ],
    ),
  ),
  AppSize.spaceHeight3(context),
  Directionality(
    textDirection: TextDirection.ltr,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextForm(
          controller:
          AllData.personModel[i].earlyAndLateStart,
          text: "Early and Late Start",
          label: "Early and Late Start",
        ),
        TextForm(
          controller:
          AllData.personModel[i].earlyAndLateFinish,
          text: "Early and Late Finish",
          label: "Early and Late Finish",
        )
      ],
    ),
  ),
  AppSize.spaceHeight3(context),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      DropDownFormInput(
        label: Text(PersonData.carSharing[
        PersonData.carSharing.keys.first]!
            .toList()
            .first
            .toString()),
        hint:
        PersonData.carSharing.keys.first.toString(),
        options: PersonData.carSharing[
        PersonData.carSharing.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
      TextForm(
        controller:
        AllData.personModel[i].addressMainOccuption,
        text: "Address of the Main Occupation",
        label: "Address of the Main Occupation",
      )
    ],
  ),

  AppSize.spaceHeight3(context),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      DropDownFormInput(
        label: Text(PersonData.drivingLiences[
        PersonData.drivingLiences.keys.first]!
            .toList()
            .first
            .toString()),
        hint: PersonData.drivingLiences.keys.first
            .toString(),
        options: PersonData.drivingLiences[
        PersonData.drivingLiences.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
      DropDownFormInput(
        label: Text(PersonData
            .busBuss[PersonData.busBuss.keys.first]!
            .toList()
            .first
            .toString()),
        hint: PersonData.busBuss.keys.first.toString(),
        options: PersonData
            .busBuss[PersonData.busBuss.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
    ],
  ),
  AppSize.spaceHeight3(context),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      DropDownFormInput(
        label: Text(PersonData.transporterMoblity[
        PersonData
            .transporterMoblity.keys.first]!
            .toList()
            .first
            .toString()),
        hint: PersonData.transporterMoblity.keys.first
            .toString(),
        options: PersonData.transporterMoblity[
        PersonData
            .transporterMoblity.keys.first]!
            .toList(),
        onChange: (String? p) {},
      ),
    ],
  ),
  AppSize.spaceHeight3(context),
],);
  }


}

class HeadLine extends StatelessWidget {
  const HeadLine({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

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
                text: title,
                fontSize: height(context) * .02,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight05(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextGlobal(
                text: subTitle,
                fontSize: height(context) * .013,
                color: ColorManager.grayColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

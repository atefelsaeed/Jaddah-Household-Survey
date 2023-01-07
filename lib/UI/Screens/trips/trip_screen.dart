import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/trip_data.dart';
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
import '../Survey/widgets/text_form_row.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  bool type = false;
  bool typeAlone = true;
  final GlobalKey<FormState> _key = GlobalKey();
  late EditingController3 editingController3 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());
  final TripModel tripModel = TripModel(
      streetName: TextEditingController(),
      buildingName: TextEditingController(),
      streetNumber: TextEditingController(),
      zoneNumber: TextEditingController(),
      nearestLandMark: TextEditingController(),
      blockNearestTwoCrossStreets: TextEditingController(),
      area: TextEditingController());
  late TextEditingController expectedDeparture = TextEditingController();
  final TripModel atWhatAddressDidYou = TripModel(
      streetName: TextEditingController(),
      buildingName: TextEditingController(),
      streetNumber: TextEditingController(),
      zoneNumber: TextEditingController(),
      nearestLandMark: TextEditingController(),
      blockNearestTwoCrossStreets: TextEditingController(),
      area: TextEditingController());

  final AdultsModel travelAloneWithOther = AdultsModel(
      adultsPlus18: TextEditingController(),
      adultsMin18: TextEditingController(),
      text: "?If with other how many");
  final AdultsModel travelAloneHouseHold = AdultsModel(
      adultsPlus18: TextEditingController(),
      adultsMin18: TextEditingController(),
      text: "Non Household persons");

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
                              " Vehicles in the Household - Household Travel Diary Survey",
                          fontSize: height(context) * .023,
                          color: ColorManager.orangeTxtColor,
                        ),
                      ],
                    ),
                    TripHoldAddress(
                      tripModel: tripModel,
                    ),
                    AppSize.spaceHeight3(context),
                    const Headline(
                        text: "?What was the purpose of being there"),
                    const Divider(),
                    const PurposeOfTheBeing(),
                    const Headline(text: "?What time did you leave"),
                    const Divider(),
                    AppSize.spaceHeight2(context),
                    TimeLeave(
                      expectedDeparture: expectedDeparture,
                    ),
                    const Headline(text: "?At what address did you go to"),
                    const Divider(),
                    TripHoldAddress(
                      tripModel: atWhatAddressDidYou,
                    ),
                    AppSize.spaceHeight2(context),
                    const Headline(text: "?At what address did you go to"),
                    const Divider(),
                    AppSize.spaceHeight2(context),
                    const WhyDidYouGo(),
                    AppSize.spaceHeight2(context),
                    const Headline(text: "?How did you travel"),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropDownFormInput(
                          label: Text(TripData
                              .AcMode[TripData.AcMode.keys.first]!
                              .toList()
                              .first
                              .toString()),
                          hint: TripData.AcMode.keys.first.toString(),
                          options: TripData.AcMode[TripData.AcMode.keys.first]!
                              .toList(),
                          onChange: (String? p) {},
                        ),
                        DropDownFormInput(
                          label: Text(TripData
                              .mainMade[TripData.mainMade.keys.first]!
                              .toList()
                              .first
                              .toString()),
                          hint: TripData.mainMade.keys.first.toString(),
                          options: TripData
                              .mainMade[TripData.mainMade.keys.first]!
                              .toList(),
                          onChange: (String? p) {},
                        ),
                      ],
                    ),
                    AppSize.spaceHeight2(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              checkColor: ColorManager.whiteColor,
                              focusColor: ColorManager.orangeTxtColor,
                              activeColor: ColorManager.orangeTxtColor,
                              value: typeAlone,
                              onChanged: (bool? value) {
                                setState(() {
                                  typeAlone = value!;
                                });
                              }),
                        ]),
                        const Headline(
                            text: "Did you travel alone or with others?"),
                      ],
                    ),
                    const Divider(),
                    typeAlone == true
                        ? AdultsOrNot(adultsModel: travelAloneWithOther)
                        : Container(),
                    AppSize.spaceHeight2(context),
                    AdultsOrNot(adultsModel: travelAloneHouseHold),
                    AppSize.spaceHeight2(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DropDownFormInput(
                          label: Text(TripData.memberHouseHoldTravel[
                                  TripData.memberHouseHoldTravel.keys.first]!
                              .toList()
                              .first
                              .toString()),
                          hint: TripData.memberHouseHoldTravel.keys.first
                              .toString(),
                          options: TripData.memberHouseHoldTravel[
                                  TripData.memberHouseHoldTravel.keys.first]!
                              .toList(),
                          onChange: (String? p) {},
                        ),
                      ],
                    ),
                    AppSize.spaceHeight2(context),
                    const Headline(
                        text: "?If travelled by car, where did you park"),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropDownFormInput(
                          label: Text(TripData.whatTypeOfTaxi[
                                  TripData.whatTypeOfTaxi.keys.first]!
                              .toList()
                              .first
                              .toString()),
                          hint: TripData.whatTypeOfTaxi.keys.first.toString(),
                          options: TripData.whatTypeOfTaxi[
                                  TripData.whatTypeOfTaxi.keys.first]!
                              .toList(),
                          onChange: (String? p) {},
                        ),
                        DropDownFormInput(
                          label: Text(TripData.whereDidYouPark[
                                  TripData.whereDidYouPark.keys.first]!
                              .toList()
                              .first
                              .toString()),
                          hint: TripData.whereDidYouPark.keys.first.toString(),
                          options: TripData.whereDidYouPark[
                                  TripData.whereDidYouPark.keys.first]!
                              .toList(),
                          onChange: (String? p) {},
                        ),
                      ],
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextForm(
                            controller: tripModel.buildingName,
                            text: "How much taxi fare did you pay?",
                            label: "How much taxi fare did you pay?",
                          ),
                          TextForm(
                            controller: tripModel.streetName,
                            text: "how much fare did you pay?",
                            label: "how much fare did you pay?",
                          )
                        ],
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextForm(
                            controller: tripModel.streetName,
                            text: "type of travel pass",
                            label: "type of travel pass",
                          )
                        ],
                      ),
                    ),
                    const Headline(text: "Arrival & Depart time"),
                    const Divider(),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextForm(
                            controller: tripModel.buildingName,
                            text: "How much taxi fare did you pay?",
                            label: "How much taxi fare did you pay?",
                          ),
                          TextForm(
                            controller: tripModel.streetName,
                            text: "how much fare did you pay?",
                            label: "how much fare did you pay?",
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        DropDownFormInput(
                          label: Text(TripData.howOftenDoYouMakeThisTrip[
                                  TripData
                                      .howOftenDoYouMakeThisTrip.keys.first]!
                              .toList()
                              .first
                              .toString()),
                          hint: TripData.howOftenDoYouMakeThisTrip.keys.first
                              .toString(),
                          options: TripData.howOftenDoYouMakeThisTrip[TripData
                                  .howOftenDoYouMakeThisTrip.keys.first]!
                              .toList(),
                          onChange: (String? p) {},
                        ),
                      ],
                    ),
                    DefaultButton(
                      function: () {
                        surveyPt.interViewDate=DateTime.now();
                        surveyPt.headerInterviewNumber=4;
                        surveyPt.headerDistrictName="ll";
                        surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="car";
                        surveys.addSurvey(surveyPt.data);
                        surveys.fetch();
                        print(surveyPt.headerDistrictName);
                        //   surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="kkk";
                      },
                      isWidget: true,
                      text: "Finish",
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

class TripHoldAddress extends StatelessWidget {
  final TripModel tripModel;

  const TripHoldAddress({super.key, required this.tripModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        const Headline(text: "?Where did you start beginning of the day"),
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
                controller: tripModel.buildingName,
                text: "Building Name",
                label: "Enter Building Name",
              ),
              TextForm(
                controller: tripModel.streetName,
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
                controller: tripModel.streetNumber,
                label: "Street Number",
                text: "Enter Street Number",
              ),
              TextForm(
                controller: tripModel.nearestLandMark,
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
                controller: tripModel.blockNearestTwoCrossStreets,
                text: "Block/Nearest two cross streets",
                label: "Enter Block/Nearest two cross streets",
              ),
              TextForm(
                controller: tripModel.area,
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
                controller: tripModel.blockNearestTwoCrossStreets,
                text: "City/ Town",
                label: "Enter City/ Town",
              ),
              //  TextForm(controller: area,text: "Area (Suburb)",label: "Enter Area (Suburb) ",)
            ],
          ),
        ),
      ],
    );
  }
}

class TripModel {
  final TextEditingController area;

  final TextEditingController zoneNumber;

  final TextEditingController buildingName;

  final TextEditingController streetName;

  final TextEditingController streetNumber;

  final TextEditingController nearestLandMark;
  final TextEditingController blockNearestTwoCrossStreets;

  TripModel(
      {required this.streetName,
      required this.buildingName,
      required this.streetNumber,
      required this.zoneNumber,
      required this.nearestLandMark,
      required this.blockNearestTwoCrossStreets,
      required this.area});
}

class Headline extends StatelessWidget {
  final String text;

  const Headline({required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppSize.spaceWidth1(context),
        TextGlobal(
          text: text,
          fontSize: height(context) * .015,
          color: ColorManager.black,
        ),
        AppSize.spaceWidth2(context),
        Column(
          children: [
            CircleAvatar(
                backgroundColor: ColorManager.black,
                radius: height(context) * .013),
            AppSize.spaceHeight05(context),
            Container(
              color: ColorManager.black,
              width: width(context) * .03,
              height: height(context) * .003,
            )
          ],
        )
      ],
    );
  }
}

class TimeLeave extends StatelessWidget {
  final TextEditingController expectedDeparture;

  const TimeLeave({super.key, required this.expectedDeparture});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: "Expected Departure Time	 (24 hour clock)",
              fontSize: height(context) * .020,
              color: ColorManager.black,
            )
          ],
        ),
        AppSize.spaceHeight1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextGlobal(
              text: "	the very first trip should be the one after 03.00am",
              fontSize: height(context) * .015,
              color: ColorManager.grayColor,
            ),
            MyTextForm(
              label: "Expected Departure Time	 (24 hour clock)",
              controller: expectedDeparture,
            ),

            //  TextForm(controller: expectedDeparture,text: "	Expected Departure Time	 (24 hour clock)",label: "Enter 	Expected Departure Time	 (24 hour clock)",),
          ],
        )
      ],
    );
  }
}

class WhyDidYouGo extends StatefulWidget {
  const WhyDidYouGo({super.key});

  @override
  State<WhyDidYouGo> createState() => _WhyDidYouGoState();
}

class _WhyDidYouGoState extends State<WhyDidYouGo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GridView.builder(
        primary: true,
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: TripData.purposeOfBeingThere["QPurposeOfBeingThere"].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 4),
        itemBuilder: (context, index) => SizedBox(
          width: width(context) / 2,
          child: Row(children: [
            SizedBox(
              width: width(context) * .23,
              child: TextGlobal(
                text: TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                    [index]["value"],
                //[index].title,
                fontSize: height(context) * .02,
                color: ColorManager.grayColor,
              ),
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
                value: TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                    [index]["isChick"],
                onChanged: (bool? value) {
                  setState(() {
                    TripData.purposeOfBeingThere["QPurposeOfBeingThere"][index]
                        ["isChick"] = value!;
                  });
                }),
          ]),
        ),
      ),
    );
  }
}

class PurposeOfTheBeing extends StatefulWidget {
  const PurposeOfTheBeing({super.key});

  @override
  State<PurposeOfTheBeing> createState() => _PurposeOfTheBeing();
}

class _PurposeOfTheBeing extends State<PurposeOfTheBeing> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GridView.builder(
        primary: true,
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: TripData.purposeOfBeingThere["QPurposeOfBeingThere"].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 4),
        itemBuilder: (context, index) => SizedBox(
          width: width(context) / 2,
          child: Row(children: [
            SizedBox(
              width: width(context) * .23,
              child: TextGlobal(
                text: TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                    [index]["value"],
                //[index].title,
                fontSize: height(context) * .02,
                color: ColorManager.grayColor,
              ),
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
                value: TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                    [index]["isChick"],
                onChanged: (bool? value) {
                  setState(() {
                    TripData.purposeOfBeingThere["QPurposeOfBeingThere"][index]
                        ["isChick"] = value!;
                  });
                }),
          ]),
        ),
      ),
    );
  }
}

class AdultsOrNot extends StatelessWidget {
  const AdultsOrNot({super.key, required this.adultsModel});

  final AdultsModel adultsModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: adultsModel.text,
              fontSize: height(context) * .02,
              color: ColorManager.black,
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                MyTextForm(
                  label: "",
                  controller: adultsModel.adultsMin18,
                  widthForm: width(context) * .07,
                ),
                AppSize.spaceWidth1(context),
                TextGlobal(
                  text: "children (under 18yrs)",
                  fontSize: height(context) * .015,
                  color: ColorManager.black,
                ),
              ],
            ),
            AppSize.spaceWidth3(context),
            Row(
              children: [
                MyTextForm(
                  label: "",
                  controller: adultsModel.adultsPlus18,
                  widthForm: width(context) * .07,
                ),
                AppSize.spaceWidth1(context),
                TextGlobal(
                  text: "adults (18yrs +)",
                  fontSize: height(context) * .017,
                  color: ColorManager.grayColor,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class AdultsModel {
  TextEditingController adultsPlus18;
  TextEditingController adultsMin18;
  final String text;

  AdultsModel(
      {required this.adultsPlus18,
      required this.adultsMin18,
      required this.text});
}

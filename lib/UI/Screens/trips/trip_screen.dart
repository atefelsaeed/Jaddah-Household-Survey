import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/all_data.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/headline.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/action_trip_screen.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/depart_time.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/how_did_you_travel.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/travel_alone_or_with_other.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/where_did_you_park.dart';
import 'package:provider/provider.dart';

import '../../../Providers/survey_hhs.dart';
import '../../../Providers/surveys.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/text.dart';
import '../Survey/components/q5.dart';
import 'components/adults_or_not.dart';
import 'components/headline_trip.dart';
import 'components/purpose_of)being.dart';
import 'components/time_leave.dart';
import 'components/trip_hold_address.dart';
import 'components/where_did_you_go.dart';
import 'model/trip_model.dart';
import 'model/trip_model_editing_controller.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    const HeadlinePerson(
                        text: "Trips- Household Travel Diary Survey"),
                    AppSize.spaceHeight2(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DefaultButton(
                          function: () {
                            setState(() {
                              TripModeList.tripModeList.add(TripModel(
                                  whereDidYouGo: "",
                                  purposeOfBeing: "",
                                  mainMode: "",
                                  accessMode: "",
                                  memberHouseHoldTravelPass: "",
                                  typeTravel: "",
                                  typeTaxi: "",
                                  locationPark: "",
                                  costTaxi: TextEditingController(),
                                  depart: TextEditingController(),
                                  destination: TextEditingController(),
                                  tripModel: TripModelEditingController(
                                      streetName: TextEditingController(),
                                      buildingName: TextEditingController(),
                                      streetNumber: TextEditingController(),
                                      zoneNumber: TextEditingController(),
                                      nearestLandMark: TextEditingController(),
                                      blockNearestTwoCrossStreets:
                                          TextEditingController(),
                                      area: TextEditingController()),
                                  type: false,
                                  typeAlone: false,
                                  travelAloneHouseHold: AdultsModel(
                                      adultsPlus18: TextEditingController(),
                                      adultsMin18: TextEditingController(),
                                      text: "Non Household persons"),
                                  travelAloneWithOther: AdultsModel(
                                      adultsPlus18: TextEditingController(),
                                      adultsMin18: TextEditingController(),
                                      text: "?If with other how many"),
                                  atWhatAddressDidYou:
                                      TripModelEditingController(
                                          streetName: TextEditingController(),
                                          buildingName: TextEditingController(),
                                          streetNumber: TextEditingController(),
                                          zoneNumber: TextEditingController(),
                                          nearestLandMark:
                                              TextEditingController(),
                                          blockNearestTwoCrossStreets:
                                              TextEditingController(),
                                          area: TextEditingController()),
                                  expectedDeparture: TextEditingController(),
                                  editingController3: EditingController3(
                                      peopleUnder18: TextEditingController(),
                                      totalNumber: TextEditingController(),
                                      peopleAdults18: TextEditingController()),
                                  typeTravelCondition: "0"));
                            });

                            //   surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="kkk";
                          },
                          isWidget: true,
                          btnWidth: width(context) * .24,
                          text: "Add New Trip",
                          widget: const Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                    AppSize.spaceHeight2(context),
                    for (int i = 0; i < TripModeList.tripModeList.length; i++)
                      Padding(
                        padding: EdgeInsets.all(AppSize.padding1(context)),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorManager.gray2Color)),
                          child: Padding(
                            padding: EdgeInsets.all(AppSize.padding2(context)),
                            child: Column(
                              children: [
                                TextTrip(index: i),
                                AppSize.spaceHeight2(context),
                                TripHoldAddress(
                                  tripModel: TripModeList.tripModeList[i].tripModel,
                                ),
                                AppSize.spaceHeight3(context),
                                const HeadlineTrip(
                                    text:
                                        "?What was the purpose of being there"),
                                const Divider(),
                                PurposeOfTheBeing(
                                  indexTripModel: i,
                                ),
                                const HeadlineTrip(
                                    text: "?What time did you leave"),
                                const Divider(),
                                AppSize.spaceHeight2(context),
                                TimeLeave(
                                  expectedDeparture:
                                  TripModeList.tripModeList[i].expectedDeparture,
                                ),
                                const HeadlineTrip(
                                    text: "?At what address did you go to"),
                                const Divider(),
                                TripHoldAddress(
                                  tripModel: TripModeList
                                      .tripModeList[i].atWhatAddressDidYou,
                                ),
                                AppSize.spaceHeight2(context),
                                const HeadlineTrip(
                                    text: "?At what address did you go to"),
                                const Divider(),
                                AppSize.spaceHeight2(context),
                                WhyDidYouGo(
                                  indexTripModel: i,
                                ),
                                AppSize.spaceHeight2(context),
                                HowDidYouTravel(
                                  i: i,
                                ),
                                TravelAlone(index: i),
                                AppSize.spaceHeight2(context),
                                WhereDidYouPark(
                                  costTaxi: TripModeList.tripModeList[i].costTaxi,
                                  index: i,
                                ),
                                AppSize.spaceHeight2(context),
                                DepartTime(tripModel: TripModeList.tripModeList[i]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    AppSize.spaceHeight2(context),
                    ActionTripScreen(),
                    AppSize.spaceHeight2(context),
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

class TextTrip extends StatelessWidget {
  final int index;

  TextTrip({required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int indexc = index + 1;
    return TextGlobal(
      text: "Trip ${indexc.toString()}",
      fontSize: height(context) * .023,
      color: ColorManager.orangeTxtColor,
    );
  }
}

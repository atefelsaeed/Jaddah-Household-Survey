import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/PersonData/person_model_list.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/headline.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/action_trip_screen.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/depart_time.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/how_did_you_travel.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/travel_alone_or_with_other.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/where_did_you_park.dart';

import '../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../Models/Trips_SurveyModel/travel_type_model.dart';
import '../../../Models/Trips_SurveyModel/travel_with_other_model.dart';
import '../../../Models/Trips_SurveyModel/trips_model.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/text.dart';
import 'components/headline_trip.dart';
import 'components/purpose_of)being.dart';
import 'components/time_leave.dart';
import 'components/trip_hold_address.dart';
import 'components/where_did_you_go.dart';

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
                              TripModeList.tripModeList.add(TripsModel(
                                type: false,
                                isTravelAlone: false,
                                tripReason: "",
                                //whereDidYouGo
                                purposeTravel: "",
                                departureTime: TextEditingController(),
                                typeTravel: '',
                                typeTravelCondition: "0",
                                travelTypeModel: TravelTypeModel(
                                  carParkingPlace: "",
                                  taxiFare: TextEditingController(),
                                  taxiTravelType: '',
                                  passTravelType: '',
                                  publicTransportFare: '',
                                ),
                                travelWay: TravelWay(
                                  mainMode: "",
                                  accessMode: "",
                                ),
                                travelWithOtherModel: TravelWithOtherModel(
                                    adultsNumber: TextEditingController(),
                                    childrenNumber: TextEditingController(),
                                    hhsMembersTraveled: "",
                                    text: "?If with other how many"),
                                travelAloneHouseHold: TravelWithOtherModel(
                                    adultsNumber: TextEditingController(),
                                    childrenNumber: TextEditingController(),
                                    hhsMembersTraveled: "",
                                    text: "Non Household persons"),
                                arrivalDepartTime: ArrivalDepartTime(
                                  arriveDestinationTime:
                                      TextEditingController(),
                                  departTime: TextEditingController(),
                                  numberRepeatTrip: '',
                                ),
                                startBeginningModel: StartBeginningModel(
                                  area: TextEditingController(),
                                  buildingName: TextEditingController(),
                                  city: TextEditingController(),
                                  block: TextEditingController(),
                                  nearestLandMark: TextEditingController(),
                                  streetName: TextEditingController(),
                                  streetNumber: TextEditingController(),
                                  referToMap: TextEditingController(),
                                ),
                                endingAddress: StartBeginningModel(
                                  area: TextEditingController(),
                                  buildingName: TextEditingController(),
                                  city: TextEditingController(),
                                  block: TextEditingController(),
                                  nearestLandMark: TextEditingController(),
                                  streetName: TextEditingController(),
                                  streetNumber: TextEditingController(),
                                  referToMap: TextEditingController(),
                                ),
                              ));
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
                                  tripModel: TripModeList
                                      .tripModeList[i].startBeginningModel!,
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
                                  expectedDeparture: TripModeList
                                      .tripModeList[i].departureTime!,
                                ),
                                const HeadlineTrip(
                                    text: "?At what address did you go to"),
                                const Divider(),
                                TripHoldAddress(
                                  tripModel: TripModeList
                                      .tripModeList[i].endingAddress!,
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
                                  costTaxi: TripModeList.tripModeList[i]
                                      .travelTypeModel!.taxiFare!,
                                  index: i,
                                ),
                                AppSize.spaceHeight2(context),
                                DepartTime(
                                    tripModel: TripModeList.tripModeList[i]),
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

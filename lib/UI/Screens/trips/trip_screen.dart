import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/headline.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/action_trip_screen.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/depart_time.dart';
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
import 'components/how_did_you_travel.dart';
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
                    const HeadlinePerson(text: "الرحلات"),
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
                                taxiTravelTypeEditingControl:
                                    TextEditingController(),
                                //whereDidYouGo
                                purposeTravel: "",
                                departureTime: TextEditingController(),
                                typeTravel: '',
                                typeTravelCondition: "0",
                                travelTypeModel: TravelTypeModel(
                                  carParkingPlace: "",
                                  otherWhereDidYouParking:
                                      TextEditingController(),
                                  ticketSub: TextEditingController(),
                                  taxiTravelTypeOther: TextEditingController(),
                                  taxiFare: TextEditingController(),
                                  taxiTravelType: '',
                                  travelType : '',
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
                          text: "أضافة رحلة جديدة",
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
                                  titel: "من أین بدأت الیوم؟",
                                ),
                                AppSize.spaceHeight3(context),
                                const HeadlineTrip(
                                    text:
                                        "ما ھو الغرض من التواجد ھناك؟"),

                                const Divider(),
                                PurposeOfTheBeing(
                                  indexTripModel: i,
                                ),
                                AppSize.spaceHeight3(context),
                                const Divider(),
                                TimeLeave(
                                  expectedDeparture: TripModeList
                                      .tripModeList[i].departureTime!,
                                ),
                                AppSize.spaceHeight3(context),
                                TripHoldAddress(
                                  tripModel: TripModeList
                                      .tripModeList[i].endingAddress!,
                                  titel: "الى أي عنوان ذھبت؟",
                                ),
                                AppSize.spaceHeight2(context),
                                const Divider(),
                                const HeadlineTrip(
                                    text:
                                    "ما ھو الغرض من الذھاب إلى ھذا  المكان؟"),

                                AppSize.spaceHeight2(context),
                                const Divider(),
                                WhyDidYouGo(
                                  indexTripModel: i,
                                ),
                                AppSize.spaceHeight2(context),

                                HowDidYouTravel(
                                  i: i,
                                ),
                                AppSize.spaceHeight2(context),
                                const Divider(),

                                AppSize.spaceHeight2(context),
                                TravelAlone(index: i),
                                AppSize.spaceHeight2(context),


                                WhereDidYouPark(
                                  costTaxi: TripModeList.tripModeList[i]
                                      .travelTypeModel!.taxiFare!,
                                  index: i,
                                ),
                                AppSize.spaceHeight2(context),
                                DepartTime(
                                  tripModel: TripModeList.tripModeList[i],
                                  i: i,
                                  textEditingControl: TripModeList
                                      .tripModeList[i]
                                      .taxiTravelTypeEditingControl!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    AppSize.spaceHeight2(context),
                    const ActionTripScreen(),
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

  const TextTrip({required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int indexc = index + 1;
    return TextGlobal(
      text: "رحلة  ${indexc.toString()}",
      fontSize: height(context) * .023,
      color: ColorManager.orangeTxtColor,
    );
  }
}

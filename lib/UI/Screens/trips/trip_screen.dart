import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/validate_data/trips_validation.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/delete_trip.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/depart_time.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/travel_alone_or_with_other.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/trip_ending_address.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/trip_hold_address.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/where_did_you_park.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/provider/trip_provider.dart';
import 'package:jaddah_household_survey/UI/Widgets/headline.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../Data/HouseholdPart1/save_data.dart';
import '../../../Data/app_constants.dart';
import '../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../Models/Trips_SurveyModel/travel_type_model.dart';
import '../../../Models/Trips_SurveyModel/travel_with_other_model.dart';
import '../../../Models/Trips_SurveyModel/trips_model.dart';
import '../../../Providers/user_surveys.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import 'components/headline_trip.dart';
import 'components/how_did_you_travel.dart';
import 'components/owner_trip.dart';
import 'components/purpose_of_being.dart';
import 'components/time_leave.dart';
import 'components/trip_starting_address.dart';
import 'components/where_did_you_go.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  Future<LocationData> getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error(0);
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error(1);
      }
    }

    return await location.getLocation();
  }

  String status = '';

  getSystemStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      status = (prefs.getString('SystemStatus') ?? '');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSystemStatus();
    final validationService = Provider.of<TripProvider>(context, listen: false);
    validationService.initTrip();
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);
    // validationService.getTripsDataUpdated(context);
    if ((userSurveysProvider.userSurveyStatus == 'edit' &&
        AppConstants.isResetTrip == true)) {
      validationService.getAllTripUpdated(context);
      AppConstants.isResetTrip = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
          child: Consumer<TripProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _key,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  const HeadlinePerson(text: "??????????????"),
                  AppSize.spaceHeight5(context),
                  // HomeSearchMap(),
                  for (int i = 0; i < TripModeList.tripModeList.length; i++)
                    Padding(
                      padding: EdgeInsets.all(AppSize.padding1(context)),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorManager.gray2Color)),
                        child: Padding(
                          padding: EdgeInsets.all(AppSize.padding2(context)),
                          child: Column(
                            children: [
                              DeleteTripComponent(i: i),
                              AppSize.spaceHeight2(context),

                              OwnerTrip(index: i),
                              //==========TripStartingAddress================
                              status == 'Offline'
                                  ? TripHoldAddress(
                                      tripModel: TripModeList
                                          .tripModeList[i].startBeginningModel!,
                                      titel: "1. ???? ?????? ???????? ????????????")
                                  : TripStartingAddress(
                                      index: i,
                                      title: "1. ???? ?????? ???????? ????????????",
                                    ),
                              AppSize.spaceHeight3(context),
                              const HeadlineText(
                                  text: "2. ???? ???? ?????????? ???? ?????????????? ??????????"),
                              WhyDidYouGo(
                                indexTripModel: i,
                              ),
                              AppSize.spaceHeight3(context),
                              TimeLeave(
                                expectedDeparture:
                                    TripModeList.tripModeList[i].departureTime,
                              ),
                              AppSize.spaceHeight3(context),
                              //=============TripEndingAddress========================
                              status == 'Offline'
                                  ? TripHoldAddress(
                                      tripModel: TripModeList
                                          .tripModeList[i].endingAddress!,
                                      titel: "4. ?????? ???? ?????????? ??????????",
                                    )
                                  : TripEndingAddress(
                                      title: "4. ?????? ???? ?????????? ??????????",
                                      index: i,
                                    ),
                              AppSize.spaceHeight2(context),
                              const HeadlineText(
                                  text:
                                      "5. ???? ???? ?????????? ???? ???????????? ?????? ??????  ??????????????"),
                              PurposeOfTheBeing(
                                indexTripModel: i,
                              ),
                              AppSize.spaceHeight2(context),
                              HowDidYouTravel(i: i),
                              AppSize.spaceHeight3(context),
                              TravelAlone(index: i),
                              AppSize.spaceHeight2(context),
                              WhereDidYouPark(
                                costTaxi: TripModeList
                                    .tripModeList[i].travelTypeModel.taxiFare,
                                index: i,
                              ),
                              AppSize.spaceHeight2(context),
                              DepartTime(
                                tripModel: TripModeList.tripModeList[i],
                                i: i,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  AppSize.spaceHeight5(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DefaultButton(
                        function: () async {
                          setState(() {
                            TripModeList.tripModeList.add(TripsModel(
                              mainPerson: [],
                              chosenPerson: '',
                              isTravelAlone: null,
                              purposeOfBeingThere2: {
                                "TripReason": [
                                  {"value": '???? ????????????', "isChick": false},
                                  {
                                    "value": '???? ?????? ?????????????? / ????????????',
                                    "isChick": false
                                  },
                                  {
                                    "value": '?????????? - ???? ???????? / ?????? ??????????',
                                    "isChick": false
                                  },
                                  {
                                    "value": '?????????? - ???????? ???????? / ?????? ??????????',
                                    "isChick": false
                                  },
                                  {"value": '???????? ????????????', "isChick": false},
                                  {"value": '????????????', "isChick": false},
                                  {"value": '?????? ????????', "isChick": false},
                                  {"value": '?????? / ????????????', "isChick": false},
                                  {
                                    "value": '?????????? ???????????????? / ??????????????',
                                    "isChick": false
                                  },
                                  {
                                    "value": '?????????? / ?????? ????????????',
                                    "isChick": false
                                  },
                                  {
                                    "value": '?????????? ?????? ?????????????? / ??????????????',
                                    "isChick": false
                                  },
                                  {
                                    "value": '?????????? ?????? ???????? ??????',
                                    "isChick": false
                                  },
                                  {"value": '????????', "isChick": false},
                                ],
                                "title": "?What was the purpose of being there",
                                "subTitle":
                                    " A separate family is defined as who share the kitchen expenses and meals",
                                "chosenIndex": 0,
                              },
                              purposeOfBeingThere: {
                                "QPurposeOfBeingThere": [
                                  {"value": '???? ????????????', "isChick": false},
                                  {
                                    "value": '???? ?????? ?????????????? / ????????????',
                                    "isChick": false
                                  },
                                  {
                                    "value": '?????????? - ???? ???????? / ?????? ??????????',
                                    "isChick": false
                                  },
                                  {
                                    "value": '?????????? - ???????? ???????? / ?????? ??????????',
                                    "isChick": false
                                  },
                                  {"value": '???????? ????????????', "isChick": false},
                                  {"value": '????????????', "isChick": false},
                                  {"value": '?????? ????????', "isChick": false},
                                  {"value": '?????? / ????????????', "isChick": false},
                                  {
                                    "value": '?????????? ???????????????? / ??????????????',
                                    "isChick": false
                                  },
                                  {
                                    "value": '?????????? / ?????? ????????????',
                                    "isChick": false
                                  },
                                  {
                                    "value": '?????????? ?????? ?????????????? / ??????????????',
                                    "isChick": false
                                  },
                                  {
                                    "value": '?????????? ?????? ???????? ??????',
                                    "isChick": false
                                  },
                                  {"value": '????????', "isChick": false},
                                ],
                                "title": "?What was the purpose of being there",
                                "subTitle":
                                    " A separate family is defined as who share the kitchen expenses and meals",
                                "chosenIndex": 0,
                              },
                              person: TripModeList.tripModeList[0].person,
                              travelWithOther: {
                                'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
                                    [
                                  {"value": '???? ??????????????', "isChick": false},
                                  {"value": '????????????', "isChick": false},
                                ],
                                "index": 0
                              },
                              type: false,
                              isHome: false,
                              isHomeEnding: false,
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
                                travelType: '',
                                passTravelType: '',
                                publicTransportFare: '',
                              ),
                              travelWay: TravelWay(
                                mainMode: "",
                                accessMode: "",
                              ),
                              hhsMembersTraveled: [],
                              travelWithOtherModel: TravelWithOtherModel(
                                  adultsNumber: TextEditingController(),
                                  childrenNumber: TextEditingController(),
                                  text: "?????? ?????? ???? ?????????????? ???? ????????????????"),
                              travelAloneHouseHold: TravelWithOtherModel(
                                  adultsNumber: TextEditingController(),
                                  childrenNumber: TextEditingController(),
                                  text: "???? ???? ?????????? ???????????? ?????? ????????"),
                              arrivalDepartTime: ArrivalDepartTime(
                                arriveDestinationTime: TextEditingController(),
                                departTime: TextEditingController(),
                                numberRepeatTrip: '',
                              ),
                              startBeginningModel: StartBeginningModel(
                                tripAddressLat: "",
                                tripAddressLong: "",
                                area: TextEditingController(),
                                block: TextEditingController(),
                                nearestLandMark: TextEditingController(),
                                streetName: TextEditingController(),
                                streetNumber: TextEditingController(),
                              ),
                              endingAddress: StartBeginningModel(
                                tripAddressLat: "",
                                tripAddressLong: "",
                                area: TextEditingController(),
                                block: TextEditingController(),
                                nearestLandMark: TextEditingController(),
                                streetName: TextEditingController(),
                                streetNumber: TextEditingController(),
                              ),
                              chosenFriendPerson: [],
                              otherWhereDidYouParkEditingControl:
                                  TextEditingController(),
                            ));
                          });
                        },
                        isWidget: true,
                        btnWidth: width(context) * .24,
                        text: "?????????? ???????? ??????????",
                        widget: const Icon(Icons.arrow_forward),
                      )
                    ],
                  ),
                  AppSize.spaceHeight6(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultButton(
                        function: () {
                          if (_key.currentState!.validate()) {
                            SaveTripsData.saveData(context);
                            // TripConditions().checkIsCarDriver();

                            CheckTripsValidation.validatePerson(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("???????? ?????? ??????????????????"),
                                duration: Duration(seconds: 3),
                                elevation: 1,
                              ),
                            );
                          }
                        },
                        isWidget: true,
                        text: "?????? ????????????",
                        widget: const Icon(Icons.arrow_forward),
                      ),
                      AppSize.spaceWidth3(context),
                      DefaultButton(
                        function: () {
                          Navigator.pop(context);
                        },
                        isWidget: true,
                        background: ColorManager.grayColor,
                        text: "????????????",
                        widget: const Icon(Icons.arrow_back_rounded),
                      ),
                    ],
                  ),
                  AppSize.spaceHeight2(context),
                ],
              ),
            ),
          ),
        );
      })),
    ));
  }
}

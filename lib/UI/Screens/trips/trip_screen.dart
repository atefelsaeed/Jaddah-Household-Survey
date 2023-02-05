import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/validate_data/trips_validation.dart';
import 'package:jaddah_household_survey/Providers/auth.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/depart_time.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/travel_alone_or_with_other.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/trip_ending_address.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/where_did_you_park.dart';
import 'package:jaddah_household_survey/UI/Widgets/headline.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../Data/HouseholdPart1/save_data.dart';
import '../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../Models/Trips_SurveyModel/travel_type_model.dart';
import '../../../Models/Trips_SurveyModel/travel_with_other_model.dart';
import '../../../Models/Trips_SurveyModel/trips_model.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/text.dart';
import 'components/headline_trip.dart';
import 'components/how_did_you_travel.dart';
import 'components/purpose_of)being.dart';
import 'components/time_leave.dart';
import 'components/trip_starting_address.dart';
import 'components/where_did_you_go.dart';

List personTripList = [""];

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TripModeList.tripModeList[0].person = [];
    for (int i = 0; i < PersonModelList.personModelList.length; i++) {
      TripModeList.tripModeList[0].person
          .add(PersonModelList.personModelList[i].personName.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    Auth auth = Provider.of<Auth>(context, listen: false);

    SurveysProvider surveys =
        Provider.of<SurveysProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _key,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  const HeadlinePerson(text: "الرحلات"),
                  AppSize.spaceHeight5(context),
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
                              Row(
                                children: [
                                  const Spacer(),
                                  TextTrip(index: i),
                                  const Spacer(),
                                  i >= 1
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              TripModeList.tripModeList
                                                  .removeAt(i);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: ColorManager.primaryColor,
                                          ))
                                      : Container()
                                ],
                              ),
                              AppSize.spaceHeight2(context),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DropDownFormInput(
                                    hint: "صاحب الرحلة",
                                    label: TripModeList
                                                .tripModeList[i].chosenPerson !=
                                            ''
                                        ? Text(TripModeList
                                                .tripModeList[i].chosenPerson ??
                                            '')
                                        : const Text('إختار'),
                                    options:
                                        TripModeList.tripModeList[i].person,
                                    onChange: (String? p) {
                                      print("p");
                                      //personTrip.add(p!);

                                      TripModeList.tripModeList[i]
                                          .friendPerson["friendPerson"] = [];
                                      for (int x = 0;
                                          x <
                                              TripModeList.tripModeList[i]
                                                  .person.length;
                                          x++) {
                                        print(x);
                                        setState(() {
                                          if (TripModeList
                                                  .tripModeList[i].person[x] !=
                                              p) {
                                            TripModeList.tripModeList[i]
                                                .friendPerson["friendPerson"]
                                                .add({
                                              "value": TripModeList
                                                  .tripModeList[i].person[x],
                                              "isChick": false
                                            });
                                          }
                                        });
                                        TripModeList
                                            .tripModeList[i].chosenPerson = p!;
                                        print(personTrip);
                                        setState(() {
                                          for (int x = 0;
                                              x <
                                                  TripModeList
                                                      .tripModeList.length;
                                              x++) {
                                            if (TripModeList.tripModeList[x]
                                                    .chosenFriendPerson
                                                    .contains(p) &&
                                                personTrip.contains(p) ==
                                                    false) {
                                              personTrip.add(p);
                                              TripModeList.tripModeList[i] =
                                                  TripModeList.tripModeList[x];
                                              break;
                                            }
                                          }
                                        });

                                        print(p);

                                        print(TripModeList
                                            .tripModeList[i].friendPerson);
                                      }
                                      if (TripModeList.tripModeList[i]
                                          .friendPerson.isNotEmpty) {
                                        TripModeList
                                            .tripModeList[i].showFriend = true;
                                      }
                                    },
                                  )
                                ],
                              ),
                              TripStartingAddress(
                                index: i,
                                title: "1. من أین بدأت الیوم؟",
                              ),
                              AppSize.spaceHeight3(context),
                              const HeadlineText(
                                  text: "2. ما ھو الغرض من التواجد ھناك؟"),
                              PurposeOfTheBeing(
                                indexTripModel: i,
                              ),
                              AppSize.spaceHeight3(context),
                              TimeLeave(
                                expectedDeparture:
                                    TripModeList.tripModeList[i].departureTime,
                              ),
                              AppSize.spaceHeight3(context),
                              TripEndingAddress(
                                title: "4. الى أي عنوان ذھبت؟",
                                index: i,
                              ),
                              AppSize.spaceHeight2(context),
                              const HeadlineText(
                                  text:
                                      "5. ما ھو الغرض من الذھاب إلى ھذا  المكان؟"),
                              WhyDidYouGo(
                                indexTripModel: i,
                              ),
                              AppSize.spaceHeight2(context),
                              HowDidYouTravel(
                                i: i,
                              ),
                              AppSize.spaceHeight3(context),
                              TravelAlone(index: i),
                              AppSize.spaceHeight2(context),
                              WhereDidYouPark(
                                costTaxi: TripModeList
                                    .tripModeList[i].travelTypeModel!.taxiFare,
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
                        function: () {
                          setState(() {
                            TripModeList.tripModeList.add(TripsModel(
                              purposeOfBeingThere2: {
                                "TripReason": [
                                  {"value": ' في المنزل', "isChick": false},
                                  {
                                    "value": 'فى بيت العطلات / الفندق',
                                    "isChick": false
                                  },
                                  {
                                    "value": 'العمل - فى مكتب / مقر العمل',
                                    "isChick": false
                                  },
                                  {
                                    "value": 'العمل - خارج مكتب / مقر العمل',
                                    "isChick": false
                                  },
                                  {"value": 'مكان تعليمى', "isChick": false},
                                  {"value": 'التسوق', "isChick": false},
                                  {"value": 'عمل شخصي', "isChick": false},
                                  {"value": 'طبى / مستشفى', "isChick": false},
                                  {
                                    "value": 'زیارة الأصدقاء / الأقار',
                                    "isChick": false
                                  },
                                  {
                                    "value": 'ترفيه / وقت الفراغ',
                                    "isChick": false
                                  },
                                  {
                                    "value": 'توص الى المدرسة / التعليم',
                                    "isChick": false
                                  },
                                  {
                                    "value": 'توص الى مكان آخر',
                                    "isChick": false
                                  },
                                ],
                                "title": "?What was the purpose of being there",
                                "subTitle":
                                    " A separate family is defined as who share the kitchen expenses and meals",
                                "chosenIndex": 0,
                              },
                              purposeOfBeingThere: {
                                "QPurposeOfBeingThere": [
                                  {"value": ' في المنزل', "isChick": false},
                                  {
                                    "value": 'فى بيت العطلات / الفندق',
                                    "isChick": false
                                  },
                                  {
                                    "value": 'العمل - فى مكتب / مقر العمل',
                                    "isChick": false
                                  },
                                  {
                                    "value": 'العمل - خارج مكتب / مقر العمل',
                                    "isChick": false
                                  },
                                  {"value": 'مكان تعليمى', "isChick": false},
                                  {"value": 'التسوق', "isChick": false},
                                  {"value": 'عمل شخصي', "isChick": false},
                                  {"value": 'طبى / مستشفى', "isChick": false},
                                  {
                                    "value": 'زیارة الأصدقاء / الأقار',
                                    "isChick": false
                                  },
                                  {
                                    "value": 'ترفيه / وقت الفراغ',
                                    "isChick": false
                                  },
                                  {
                                    "value": 'توص الى المدرسة / التعليم',
                                    "isChick": false
                                  },
                                  {
                                    "value": 'توص الى مكان آخر',
                                    "isChick": false
                                  },
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
                                  {"value": 'مع الأخرين', "isChick": false},
                                  {"value": 'بمفردك', "isChick": false},
                                ],
                                "index": 0
                              },
                              type: false,
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
                                  text: "إذا كان مع الآخرین كم أعمارھم؟"),
                              travelAloneHouseHold: TravelWithOtherModel(
                                  adultsNumber: TextEditingController(),
                                  childrenNumber: TextEditingController(),
                                  text:"اي من أفراد الأسرة ذهب معك؟"),
                              arrivalDepartTime: ArrivalDepartTime(
                                arriveDestinationTime: TextEditingController(),
                                departTime: TextEditingController(),
                                numberRepeatTrip: '',
                              ),
                              startBeginningModel: StartBeginningModel(
                                tripAddressLat: "",
                                tripAddressLong: "",
                              ),
                              endingAddress: StartBeginningModel(
                                tripAddressLat: "",
                                tripAddressLong: "",
                              ),
                              chosenFriendPerson: [],
                            ));
                          });
                        },
                        isWidget: true,
                        btnWidth: width(context) * .24,
                        text: "أضافة رحلة جديدة",
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
                          print('save1');
                          if (_key.currentState!.validate()) {
                            print('save2');
                            Random random = Random();
                            int randomNumber =
                                (1000 + random.nextInt(10000 - 1000));
                            int num = int.parse('${auth.uid}001$randomNumber');
                            print('save3');
                            surveyPt.headerLat = 0;
                            surveyPt.interViewDate = DateTime.now();
                            surveyPt.headerLong = 0;
                            surveyPt.headerEmpNumber = auth.uid;
                            surveyPt.headerInterviewNumber = num;
                            print('kkkk');
                            SaveTripsData.saveData(context);
                            print("validate");
                            CheckTripsValidation.validatePerson(context);
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
                        text: "أنتهينا",
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
                  AppSize.spaceHeight2(context),
                ],
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

  const TextTrip({super.key, required this.index});

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

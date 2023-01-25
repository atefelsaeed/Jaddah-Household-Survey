import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/PersonData/person_data.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/validate_data/trips_validation.dart';
import 'package:jaddah_household_survey/Providers/auth.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/headline.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/depart_time.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/travel_alone_or_with_other.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/where_did_you_park.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../Data/HouseholdPart1/save_data.dart';
import '../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../Models/Trips_SurveyModel/travel_type_model.dart';
import '../../../Models/Trips_SurveyModel/travel_with_other_model.dart';
import '../../../Models/Trips_SurveyModel/trips_model.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/text.dart';
import '../Survey/widgets/list_view_check_box_orange.dart';
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
    TripModeList.tripModeList[0].person=[];
    for(int i=0;i<  PersonModelList.personModelList.length;i++){
      TripModeList.tripModeList[0].person.add( PersonModelList.personModelList[i].personName.text);
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
                                travelType: '',
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
                                arriveDestinationTime: TextEditingController(),
                                departTime: TextEditingController(),
                                numberRepeatTrip: '',
                              ),
                              startBeginningModel: StartBeginningModel(
                                area: TextEditingController(),
                                block: TextEditingController(),
                                nearestLandMark: TextEditingController(),
                                streetName: TextEditingController(),
                                streetNumber: TextEditingController(),
                              ),
                              endingAddress: StartBeginningModel(
                                area: TextEditingController(),
                                block: TextEditingController(),
                                nearestLandMark: TextEditingController(),
                                streetName: TextEditingController(),
                                streetNumber: TextEditingController(),
                              ),
                            ));
                            for(int i=0;i<  PersonModelList.personModelList.length;i++){
                              TripModeList.tripModeList[i].person.add( PersonModelList.personModelList[i].personName.text);
                            }
                          });
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
                                    label: Text(TripModeList.tripModeList[i].person.first),
                                    hint: "صاحب الرحله",
                                    options: TripModeList.tripModeList[i].person,

                                    onChange: (String? p) {
                                      TripModeList.tripModeList[i].friendPerson=[];
for(int x=0;x<TripModeList.tripModeList[i].person.length;x++){
  print(x);
  setState(() {
    if(TripModeList.tripModeList[i].person[x]!=p) {
      TripModeList.tripModeList[i].friendPerson.add({"value":
          TripModeList.tripModeList[i].person[x],"isChick":false});
    }

  });

print(   TripModeList.tripModeList[i].friendPerson);
}
                                      if(TripModeList.tripModeList[i].friendPerson.isNotEmpty){
                                        TripModeList.tripModeList[i].showFriend=true;
                                      }
                                    },
                                  ),

                                /*  TripModeList.tripModeList[i].showFriend==true?                         DropDownFormInput(
                                    label: Text(TripModeList.tripModeList[i].friendPerson.first),
                                    hint: "مع من سوف تذهب",
                                    options: TripModeList.tripModeList[i].friendPerson,

                                    onChange: (String? p) {
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
                                            travelType: '',
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
                                            arriveDestinationTime: TextEditingController(),
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
                                      TripModeList.tripModeList[i].person=[];
                                      for(int i=0;i<  PersonModelList.personModelList.length;i++){
                                        TripModeList.tripModeList[i].person.add( PersonModelList.personModelList[i].personName.text);
                                      }

                                    },
                                  ):Container(),*/
                                ],
                              ),
                              ListViewCheckBoxOrange(
                                map:const {"":""} ,
                                onChange: (r) {
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
                                        travelType: '',
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
                                        arriveDestinationTime: TextEditingController(),
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


                                },
                                title:
                                "3.كم عدد العائلات المنفصلة التي تعيش في هذا العنوان؟",
                                question:  TripModeList.tripModeList[i].friendPerson,
                                subTitle:
                                'يتم تعريف الأسرة المنفصلة على أنها من لا يشارك مصاريف المطبخ والوجبات مع العائلة الأخرى في نفس السكن)',
                              ),

                              TripHoldAddress(
                                tripModel: TripModeList
                                    .tripModeList[i].startBeginningModel!,
                                titel: "1. من أین بدأت الیوم؟",
                              ),
                              AppSize.spaceHeight3(context),
                              const HeadlineTrip(
                                  text: "2. ما ھو الغرض من التواجد ھناك؟"),
                              const Divider(),
                              PurposeOfTheBeing(
                                indexTripModel: i,
                              ),
                              AppSize.spaceHeight3(context),
                              const Divider(),
                              TimeLeave(
                                expectedDeparture:
                                    TripModeList.tripModeList[i].departureTime,
                              ),
                              AppSize.spaceHeight3(context),
                              TripHoldAddress(
                                tripModel:
                                    TripModeList.tripModeList[i].endingAddress!,
                                titel: "4. الى أي عنوان ذھبت؟",
                              ),
                              AppSize.spaceHeight2(context),
                              const Divider(),
                              const HeadlineTrip(
                                  text:
                                      "5. ما ھو الغرض من الذھاب إلى ھذا  المكان؟"),
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
                                costTaxi: TripModeList
                                    .tripModeList[i].travelTypeModel!.taxiFare,
                                index: i,
                              ),
                              AppSize.spaceHeight2(context),
                              DepartTime(
                                tripModel: TripModeList.tripModeList[i],
                                i: i,
                                textEditingControl: TripModeList.tripModeList[i]
                                    .taxiTravelTypeEditingControl!,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  AppSize.spaceHeight2(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultButton(
                        function: () {
                          if (_key.currentState!.validate()) {
                            getLocation().then(
                              (value) {
                                Random random = Random();
                                int randomNumber =
                                    (1000 + random.nextInt(10000 - 1000));
                                int num =
                                    int.parse('${auth.uid}001$randomNumber');
                                surveyPt.headerLat = value.latitude ?? 0;
                                surveyPt.interViewDate = DateTime.now();
                                surveyPt.headerLong = value.longitude ?? 0;
                                surveyPt.headerEmpNumber = auth.uid;
                                surveyPt.headerInterviewNumber = num;
                                surveyPt.id = auth.uid.toString();
                                SaveTripsData.saveData(context);
                                CheckTripsValidation.validatePerson(context);
                                QuestionsData.qh4[QuestionsData.qh4.keys.first]!
                                        .toList()[QuestionsData.qh4["index"]]
                                    ["isChick"] = false;
                                QuestionsData.qh7[QuestionsData.qh7.keys.first]!
                                        .toList()[QuestionsData.qh7["index"]]
                                    ["isChick"] = false;
                                QuestionsData
                                        .qh7_2[QuestionsData.qh7_2.keys.first]!
                                        .toList()[QuestionsData.qh7_2["index"]]
                                    ["isChick"] = false;
                                VehiclesData.q3VecData[VehiclesData
                                                .q3VecData.keys.first]!
                                            .toList()[
                                        VehiclesData.q3VecData["index"]]
                                    ["isChick"] = false;
                                PersonData.nationality[PersonData
                                                .nationality.keys.first]!
                                            .toList()[
                                        PersonData.nationality["index"]]
                                    ["isChick"] = false;
                              },
                            ).onError(
                              (error, stackTrace) {
                                print(error);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("يجب تشغيل خدمة تحديد الموقع"),
                                    duration: Duration(seconds: 3),
                                    elevation: 1,
                                  ),
                                );
                              },
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

import 'package:flutter/material.dart';

import '../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../Models/Trips_SurveyModel/travel_type_model.dart';
import '../../../Models/Trips_SurveyModel/travel_with_other_model.dart';
import '../../../Models/Trips_SurveyModel/trips_model.dart';

class TripModeList {
  static List<TripsModel> tripModeList = [
    TripsModel(
      purposeOfBeingThere2: {
        "TripReason": [
          {"value": 'كنت في المنزل', "isChick": false},
          {"value": 'كنت العطلات / الفندق', "isChick": false},
          {"value": ' كنت في العمل', "isChick": false},
          {"value": 'مكان تعليمي', "isChick": false},
          {"value": 'موظف لصاحب العمل', "isChick": false},
          {"value": 'التسوق', "isChick": false},
          {"value": 'عمل شخصي', "isChick": false},
          {"value": 'زیارة الأصدقاء / الأقار', "isChick": false},
          {"value": 'استجمام / وقت الفراغ', "isChick": false},
          {"value": 'توص الى المدرسة', "isChick": false},
        ],
        "title": "?What was the purpose of being there",
        "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
        "chosenIndex": 0,
      },
      purposeOfBeingThere: {
    "QPurposeOfBeingThere": [
    {"value": 'كنت في المنزل', "isChick": false},
    {"value": 'كنت العطلات / الفندق', "isChick": false},
    {"value": ' كنت في العمل', "isChick": false},
    {"value": 'مكان تعليمي', "isChick": false},
    {"value": 'موظف لصاحب العمل', "isChick": false},
    {"value": 'التسوق', "isChick": false},
    {"value": 'عمل شخصي', "isChick": false},
    {"value": 'زیارة الأصدقاء / الأقار', "isChick": false},
    {"value": 'استجمام / وقت الفراغ', "isChick": false},
    {"value": 'توص الى المدرسة', "isChick": false},
    ],
    "title": "?What was the purpose of being there",
    "subTitle":
    " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
    },
      person: [],
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
      // person: [],
      purposeTravel: "",
      // newPerson: [],
      // chosenPerson: '',
      otherWhereDidYouParkEditingControl: TextEditingController(),
      taxiTravelTypeEditingControl: TextEditingController(),
      departureTime: TextEditingController(),
      typeTravel: '',
      typeTravelCondition: "0",
      travelTypeModel: TravelTypeModel(
        carParkingPlace: "",
        ticketSub: TextEditingController(),
        taxiTravelTypeOther: TextEditingController(),
        otherWhereDidYouParking: TextEditingController(),
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
          text: "إذا كان مع الآخرین كم أعمارھم؟"),
      travelAloneHouseHold: TravelWithOtherModel(
          adultsNumber: TextEditingController(),
          childrenNumber: TextEditingController(),
          hhsMembersTraveled: "",
          text: "اي من أفراد الأسرة ذهب معك؟"),
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
    ),
  ];
}

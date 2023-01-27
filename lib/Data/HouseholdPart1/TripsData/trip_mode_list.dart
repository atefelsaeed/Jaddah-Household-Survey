import 'package:flutter/material.dart';

import '../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../Models/Trips_SurveyModel/travel_type_model.dart';
import '../../../Models/Trips_SurveyModel/travel_with_other_model.dart';
import '../../../Models/Trips_SurveyModel/trips_model.dart';

class TripModeList {
  static List<TripsModel> tripModeList = [
    TripsModel(
      person: [],

      type: false,
      isTravelAlone: false,
      tripReason: "",
      purposeTravel: "",
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
      ), chosenFriendPerson: [],
    ),
  ];
}


import 'package:flutter/material.dart';

import '../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../Models/Trips_SurveyModel/travel_type_model.dart';
import '../../../Models/Trips_SurveyModel/travel_with_other_model.dart';
import '../../../Models/Trips_SurveyModel/trips_model.dart';

class TripModeList {
  static List<TripsModel> tripModeList = [
    TripsModel(
      type: false,
      isTravelAlone: false,
      tripReason: "",
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
    ),
  ];
}
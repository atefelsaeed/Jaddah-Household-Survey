import 'package:jaddah_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/trips_model.dart';

class EmptyTrips {
  static emptyTrips() {
    personTrip = [];

    for (var element in TripModeList.tripModeList) {

      //==============Reset-List=================
      element.hhsMembersTraveled = [];
      element.isHome = false;
      element.isHomeEnding = false;
      element.person = [];
      element.chosenFriendPerson = [];
      element.friendPerson={};
      element.chosenPerson ='';
      element.departureTime.text = '';
      element.isTravelAlone = false;
      element.otherWhereDidYouParkEditingControl.text = '';
      element.taxiTravelTypeEditingControl.text = '';
      element.arrivalDepartTime.departTime.text = '';
      element.arrivalDepartTime.arriveDestinationTime.text = '';
      element.arrivalDepartTime.numberRepeatTrip = '';
      element.tripReason = '';
      element.purposeTravel = '';
      element.typeTravel = '';
      element.type = false;
      //============travelTypeModel=======================
      element.travelTypeModel.travelType = '';
      element.travelTypeModel.taxiTravelType = '';
      element.travelTypeModel.taxiFare.text = '';
      element.travelTypeModel.carParkingPlace = '';
      element.travelTypeModel.publicTransportFare = '';
      element.travelTypeModel.passTravelType = '';
      element.travelTypeModel.otherWhereDidYouParking?.text = '';
      element.travelTypeModel.taxiTravelTypeOther?.text = '';
      //================travelWay===============
      element.travelWay?.mainMode = '';
      element.travelWay?.accessMode = '';
      //================travelWithOtherModel================
      element.travelWithOtherModel?.childrenNumber.text = '';
      element.travelWithOtherModel?.adultsNumber.text = '';
      element.travelWithOtherModel?.text = '';
      //===============startBeginningModel=============
      element.startBeginningModel?.tripAddressLat = '';
      element.startBeginningModel?.tripAddressLong = '';
      element.startBeginningModel?.area.text = '';
      element.startBeginningModel?.block.text = '';
      element.startBeginningModel?.nearestLandMark.text = '';
      element.startBeginningModel?.streetName.text = '';
      element.startBeginningModel?.streetNumber.text = '';
      //===========endingAddress=================
      element.endingAddress?.tripAddressLat = '';
      element.endingAddress?.tripAddressLong = '';
      element.endingAddress?.area.text = '';
      element.endingAddress?.block.text = '';
      element.endingAddress?.nearestLandMark.text = '';
      element.endingAddress?.streetName.text = '';
      element.endingAddress?.streetNumber.text = '';
      //============Reset-Checkbox==============================
      element.travelWithOther[element.travelWithOther.keys.first]!
          .toList()[element.travelWithOther["index"]]["isChick"] = false;

      element.purposeOfBeingThere2[element.purposeOfBeingThere2.keys.first]!
          .toList()[element.purposeOfBeingThere2["chosenIndex"]]
      ["isChick"] = false;

      element.purposeOfBeingThere[element.purposeOfBeingThere.keys.first]!
          .toList()[element.purposeOfBeingThere["chosenIndex"]]["isChick"] =
      false;

      // element.friendPerson[element.friendPerson.keys.first]!
      //     .toList()[element.friendPerson["index"]]["isChick"] = false;
    }
    TripModeList.tripModeList.length = 1;
  }
}

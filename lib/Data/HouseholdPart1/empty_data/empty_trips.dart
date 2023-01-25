import 'package:jaddah_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';

class EmptyTrips {
  static emptyTrips() {
    for (var element in TripModeList.tripModeList) {
      element.departureTime.text = '';
      element.otherWhereDidYouParkEditingControl!.text = '';
      element.taxiTravelTypeEditingControl!.text = '';
      element.arrivalDepartTime?.departTime.text = '';
      element.arrivalDepartTime?.arriveDestinationTime.text = '';
      element.arrivalDepartTime?.numberRepeatTrip = '';
      element.tripReason = '';
      element.purposeTravel = '';
      element.typeTravel = '';
      element.type = false;
      //travelTypeModel
      element.travelTypeModel?.travelType = '';
      element.travelTypeModel?.taxiTravelType = '';
      element.travelTypeModel?.taxiFare.text = '';
      element.travelTypeModel?.carParkingPlace = '';
      element.travelTypeModel?.publicTransportFare = '';
      element.travelTypeModel?.passTravelType = '';
      element.travelTypeModel?.otherWhereDidYouParking?.text = '';
      element.travelTypeModel?.taxiTravelTypeOther?.text = '';
      //travelWay
      element.travelWay?.mainMode = '';
      element.travelWay?.accessMode = '';
      //travelWithOtherModel
      element.travelWithOtherModel?.childrenNumber.text = '';
      element.travelWithOtherModel?.adultsNumber.text = '';
      element.travelWithOtherModel?.hhsMembersTraveled = '';
      element.travelWithOtherModel?.text = '';
      //startBeginningModel
      element.startBeginningModel?.block.text = '';
      element.startBeginningModel?.streetName.text = '';
      element.startBeginningModel?.streetNumber.text = '';
      element.startBeginningModel?.nearestLandMark.text = '';
      element.startBeginningModel?.area.text = '';
      //endingAddress
      element.endingAddress?.block.text = '';
      element.endingAddress?.streetName.text = '';
      element.endingAddress?.streetNumber.text = '';
      element.endingAddress?.nearestLandMark.text = '';
      element.endingAddress?.area.text = '';
    }
  }
}

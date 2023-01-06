class TravelTypeModel {
  String? carParkingPlace;
  String? taxiTravelType;
  String? passTravelType;
  String? taxiFare;
  String? publicTransportFare;

  TravelTypeModel();

  TravelTypeModel.fromJson(Map<String, dynamic> json) {
    carParkingPlace = json['carParkingPlace'];
    taxiTravelType = json['taxiTravelType'];
    passTravelType = json['passTravelType'];
    taxiFare = json['taxiFare'];
    publicTransportFare = json['publicTransportFare'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['carParkingPlace'] = carParkingPlace;
    data['taxiTravelType'] = taxiTravelType;
    data['passTravelType'] = passTravelType;
    data['taxiFare'] = taxiFare;
    data['publicTransportFare'] = publicTransportFare;
    return data;
  }
}

class ArrivalDepartTime {
  String? departTime;
  String? arriveDestinationTime;
  String? numberRepeatTrip;

  ArrivalDepartTime();

  ArrivalDepartTime.fromJson(Map<String, dynamic> json) {
    departTime = json['departTime'];
    arriveDestinationTime = json['arriveDestinationTime'];
    numberRepeatTrip = json['numberRepeatTrip'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['departTime'] = departTime;
    data['numberRepeatTrip'] = numberRepeatTrip;
    return data;
  }
}

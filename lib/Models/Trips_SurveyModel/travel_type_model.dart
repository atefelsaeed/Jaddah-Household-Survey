import 'package:flutter/material.dart';

class TravelTypeModel {
  String? carParkingPlace;
  String? taxiTravelType;
  String? passTravelType;
  TextEditingController? taxiFare;
  String? publicTransportFare;

  TravelTypeModel({
    this.carParkingPlace,
    this.passTravelType,
    this.publicTransportFare,
    this.taxiFare,
    this.taxiTravelType,
  });

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
  TextEditingController? departTime;
  TextEditingController? arriveDestinationTime;
  String? numberRepeatTrip;

  ArrivalDepartTime({
    this.departTime,
    this.numberRepeatTrip,
    this.arriveDestinationTime,
  });

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

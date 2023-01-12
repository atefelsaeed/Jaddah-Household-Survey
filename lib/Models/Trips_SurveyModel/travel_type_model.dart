import 'package:flutter/material.dart';

class TravelTypeModel {
  String? carParkingPlace;
  String? taxiTravelType;
  String? passTravelType;
  TextEditingController taxiFare = TextEditingController();
  String? publicTransportFare;

  TravelTypeModel({
    this.carParkingPlace,
    this.passTravelType,
    this.publicTransportFare,
    required this.taxiFare,
    this.taxiTravelType,
  });

  TravelTypeModel.fromJson(Map<String, dynamic> json) {
    carParkingPlace = json['carParkingPlace'];
    taxiTravelType = json['taxiTravelType'];
    passTravelType = json['passTravelType'];
    taxiFare.text = json['taxiFare'];
    publicTransportFare = json['publicTransportFare'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['carParkingPlace'] = carParkingPlace;
    data['taxiTravelType'] = taxiTravelType;
    data['passTravelType'] = passTravelType;
    data['taxiFare'] = taxiFare.text;
    data['publicTransportFare'] = publicTransportFare;
    return data;
  }
}

class ArrivalDepartTime {
  TextEditingController departTime = TextEditingController();
  TextEditingController arriveDestinationTime = TextEditingController();
  String? numberRepeatTrip;

  ArrivalDepartTime({
    required this.departTime,
    this.numberRepeatTrip,
    required this.arriveDestinationTime,
  });

  ArrivalDepartTime.fromJson(Map<String, dynamic> json) {
    departTime.text = json['departTime'];
    arriveDestinationTime.text = json['arriveDestinationTime'];
    numberRepeatTrip = json['numberRepeatTrip'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['departTime'] = departTime.text;
    data['arriveDestinationTime'] = arriveDestinationTime.text;
    data['numberRepeatTrip'] = numberRepeatTrip;
    return data;
  }
}

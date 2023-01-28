import 'package:flutter/material.dart';

class StartBeginningModel {
  String? tripAddressLat ;
  String? tripAddressLong;

  StartBeginningModel({
    required this.tripAddressLong,
    required this.tripAddressLat,
  });

  StartBeginningModel.fromJson(Map<String, dynamic> json) {
    tripAddressLat = json['tripAddressLat'];
    tripAddressLong = json['tripAddressLong'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['streetName'] = tripAddressLat;
    data['streetNumber'] = tripAddressLong;
    return data;
  }
}

import 'package:flutter/material.dart';

class StartBeginningModel {
  TextEditingController? buildingName;
  TextEditingController? streetName;
  TextEditingController? streetNumber;
  TextEditingController? nearestLandMark;
  TextEditingController? block;
  TextEditingController? area;
  TextEditingController? city;
  TextEditingController? referToMap;

  StartBeginningModel({
    this.nearestLandMark,
    this.streetNumber,
    this.streetName,
    this.buildingName,
    this.city,
    this.area,
    this.block,
    this.referToMap,
  });

  StartBeginningModel.fromJson(Map<String, dynamic> json) {
    buildingName = json['buildingName'];
    streetName = json['streetName'];
    streetNumber = json['streetNumber'];
    nearestLandMark = json['nearestLandMark'];
    block = json['block'];
    area = json['area'];
    city = json['city'];
    referToMap = json['referToMap'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['buildingName'] = buildingName;
    data['streetName'] = streetName;
    data['streetNumber'] = streetNumber;
    data['nearestLandMark'] = nearestLandMark;
    data['block'] = block;
    data['area'] = area;
    data['city'] = city;
    data['referToMap'] = referToMap;
    return data;
  }
}

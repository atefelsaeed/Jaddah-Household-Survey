import 'package:flutter/material.dart';

class StartBeginningModel {
  TextEditingController buildingName = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController streetNumber = TextEditingController();
  TextEditingController nearestLandMark = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController referToMap = TextEditingController();

  StartBeginningModel({
    required this.nearestLandMark,
    required this.streetNumber,
    required this.streetName,
    required this.buildingName,
    required this.city,
    required this.area,
    required this.block,
    required this.referToMap,
  });

  StartBeginningModel.fromJson(Map<String, dynamic> json) {
    buildingName.text = json['buildingName'];
    streetName.text = json['streetName'];
    streetNumber.text = json['streetNumber'];
    nearestLandMark.text = json['nearestLandMark'];
    block.text = json['block'];
    area.text = json['area'];
    city.text = json['city'];
    referToMap.text = json['referToMap'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['buildingName'] = buildingName.text;
    data['streetName'] = streetName.text;
    data['streetNumber'] = streetNumber.text;
    data['nearestLandMark'] = nearestLandMark.text;
    data['block'] = block.text;
    data['area'] = area.text;
    data['city'] = city.text;
    data['referToMap'] = referToMap.text;
    return data;
  }
}

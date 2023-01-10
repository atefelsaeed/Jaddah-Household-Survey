import 'package:flutter/material.dart';

class TravelWithOtherModel {
  TextEditingController? adultsNumber;
  TextEditingController? childrenNumber;
  String? hhsMembersTraveled;
  // TextEditingController? nonHHSAdultsNumber;
  // TextEditingController? nonHHSChildrenNumber;
  String? text;

  TravelWithOtherModel({
    this.adultsNumber,
    this.childrenNumber,
    this.hhsMembersTraveled,
    // this.nonHHSAdultsNumber,
    // this.nonHHSChildrenNumber,
    this.text,
  });

  TravelWithOtherModel.fromJson(Map<String, dynamic> json) {
    adultsNumber = json['adultsNumber'];
    childrenNumber = json['childrenNumber'];
    hhsMembersTraveled = json['hhsMembersTraveled'];
    // nonHHSAdultsNumber = json['nonHHSAdultsNumber'];
    // nonHHSChildrenNumber = json['nonHHSChildrenNumber'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['adultsNumber'] = adultsNumber;
    data['childrenNumber'] = childrenNumber;
    data['hhsMembersTraveled'] = hhsMembersTraveled;
    // data['nonHHSAdultsNumber'] = nonHHSAdultsNumber;
    // data['nonHHSChildrenNumber'] = nonHHSChildrenNumber;
    return data;
  }
}

class AdultsModel {
  TextEditingController adultsPlus18;
  TextEditingController adultsMin18;
  final String text;

  AdultsModel(
      {required this.adultsPlus18,
      required this.adultsMin18,
      required this.text});
}

class TravelWay {
  String? mainMode;
  String? accessMode;

  TravelWay({
    this.mainMode,
    this.accessMode,
  });

  TravelWay.fromJson(Map<String, dynamic> json) {
    mainMode = json['mainMode'];
    mainMode = json['accessMode'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['mainMode'] = mainMode;
    data['accessMode'] = accessMode;
    return data;
  }
}

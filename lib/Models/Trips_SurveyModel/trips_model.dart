import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/start_beginning_model.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/travel_type_model.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/travel_with_other_model.dart';

class TripsModel {
  bool? type;
  StartBeginningModel? startBeginningModel;
  String? typeTravelCondition;
  String? typeTravel;
  StartBeginningModel? endingAddress;

  String? purposeTravel;
  TextEditingController? departureTime;

  String? tripReason;
  TravelWay? travelWay;

  bool? isTravelAlone;

  TravelWithOtherModel? travelWithOtherModel;
  TravelWithOtherModel? travelAloneHouseHold;
  ArrivalDepartTime? arrivalDepartTime;
  TravelTypeModel? travelTypeModel;

  TripsModel({
    this.type,
    this.travelTypeModel,
    this.typeTravel,
    this.typeTravelCondition,
    this.travelWithOtherModel,
    this.travelAloneHouseHold,
    this.arrivalDepartTime,
    this.travelWay,
    this.departureTime,
    this.endingAddress,
    this.isTravelAlone,
    this.purposeTravel,
    this.startBeginningModel,
    this.tripReason,
  });

  TripsModel.fromJson(Map<String, dynamic> json) {
    startBeginningModel =
        StartBeginningModel.fromJson(json['startBeginningModel']);
    endingAddress = StartBeginningModel.fromJson(json['endingAddress']);
    travelWay = TravelWay.fromJson(json['travelWay']);
    travelWithOtherModel =
        TravelWithOtherModel.fromJson(json['travelWithOtherModel']);
    travelAloneHouseHold =
        TravelWithOtherModel.fromJson(json['travelAloneHouseHold']);
    arrivalDepartTime = ArrivalDepartTime.fromJson(json['arrivalDepartTime']);
    travelTypeModel = TravelTypeModel.fromJson(json['travelTypeModel']);
    purposeTravel = json['purposeTravel'];
    departureTime = json['departureTime'];
    tripReason = json['tripReason'];
    isTravelAlone = json['isTravelAlone'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['startBeginningModel'] = startBeginningModel!.toJson();
    data['endingAddress'] = endingAddress!.toJson();
    data['travelWay'] = travelWay!.toJson();
    data['travelWithOtherModel'] = travelWithOtherModel!.toJson();
    data['travelAloneHouseHold'] = travelAloneHouseHold!.toJson();
    data['arrivalDepartTime'] = arrivalDepartTime!.toJson();
    data['travelTypeModel'] = travelTypeModel!.toJson();
    data['purposeTravel'] = purposeTravel;
    data['departureTime'] = departureTime;
    data['tripReason'] = tripReason;
    data['isTravelAlone'] = isTravelAlone;
    return data;
  }
}

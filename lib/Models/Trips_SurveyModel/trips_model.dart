import 'package:jaddah_household_survey/Models/Trips_SurveyModel/start_beginning_model.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/travel_type_model.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/travel_with_other_model.dart';

class TripsModel {
  StartBeginningModel? startBeginningModel;
  StartBeginningModel? endingAddress;
  String? purposeTravel;
  String? departureTime;
  String? tripReason;
  TravelWay? travelWay;
  bool? isTravelAlone;
  TravelWithOtherModel? travelWithOtherModel;
  ArrivalDepartTime? arrivalDepartTime;
  TravelTypeModel? travelTypeModel;

  TripsModel();

  TripsModel.fromJson(Map<String, dynamic> json) {
    startBeginningModel =
        StartBeginningModel.fromJson(json['startBeginningModel']);
    endingAddress = StartBeginningModel.fromJson(json['endingAddress']);
    travelWay = TravelWay.fromJson(json['travelWay']);
    travelWithOtherModel =
        TravelWithOtherModel.fromJson(json['travelWithOtherModel']);
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
    data['arrivalDepartTime'] = arrivalDepartTime!.toJson();
    data['travelTypeModel'] = travelTypeModel!.toJson();
    data['purposeTravel'] = purposeTravel;
    data['departureTime'] = departureTime;
    data['tripReason'] = tripReason;
    data['isTravelAlone'] = isTravelAlone;
    return data;
  }
}